import Distribution.Simple 
import Data.Maybe

import Control.Monad (when, filterM)
import Data.List (foldl', intersperse, intercalate, nub, lookup, isPrefixOf, isInfixOf, find)
import Data.Maybe (fromJust)
import Distribution.PackageDescription
import Distribution.Simple
import Distribution.Simple.LocalBuildInfo
import Distribution.Simple.PackageIndex
import Distribution.Simple.Program 
import Distribution.Simple.Program.Types
import Distribution.Simple.Setup 
import Distribution.System
import Distribution.Verbosity (normal, verbose)
import System.Process (system)
import System.Directory (createDirectoryIfMissing, doesFileExist, getCurrentDirectory, getModificationTime)
import System.Environment (getEnv)
import System.FilePath ((</>), (<.>), replaceExtension, takeFileName, dropFileName, addExtension, takeDirectory)
import System.IO.Unsafe (unsafePerformIO)
import System.Process (readProcess)

main :: IO ()
main = defaultMainWithHooks simpleUserHooks { buildHook = myBuildHook }

defaultProgram name =
    ConfiguredProgram name Nothing [] [] [] (FoundOnSystem name)

myBuildHook pkg_descr local_bld_info user_hooks bld_flags =
    do
    let lib       = fromJust (library pkg_descr)
        lib_bi    = libBuildInfo lib
        custom_bi = customFieldsBI lib_bi
        cpp_name  = fromJust (lookup "x-cc-name" custom_bi)
        c_srcs    = (cSources lib_bi)
        cc_opts   = ccOptions lib_bi
        ld_opts   = ldOptions lib_bi
        inc_dirs  = includeDirs lib_bi
        lib_dirs  = extraLibDirs lib_bi
        libs      = extraLibs lib_bi
        bld_dir   = buildDir local_bld_info
        ver = (pkgVersion . package) pkg_descr
    -- Compile C/C++ sources
    putStrLn "invoking my compile phase"
    objs <- mapM (compileCxx (defaultProgram cpp_name) cc_opts inc_dirs bld_dir) c_srcs
    -- Remove C/C++ source code from the hooked build (don't change libs)

    let lib_bi'    = lib_bi { cSources = [] }
        lib'       = lib    { libBuildInfo = lib_bi' }
        pkg_descr' = pkg_descr { library = Just lib' }
    -- The following line invokes the standard build behaviour
    print "Linking"
    linkSharedLib (defaultProgram cpp_name) ld_opts lib_dirs (libs) objs ver bld_dir "harf"
    putStrLn "Invoke default build hook"
    bh <- buildHook simpleUserHooks pkg_descr' local_bld_info user_hooks bld_flags
    return bh

-- | Compile a single source file using the configured gcc, if the object file does not yet
--   exist, or is older than the source file.
--   TODO: Does not do dependency resolution properly
compileCxx :: ConfiguredProgram  -- ^ Program used to perform C/C++ compilation (gcc)
           -> [String]           -- ^ Compile options provided by Cabal and wxConfig
           -> [String]           -- ^ Include paths provided by Cabal and wxConfig
           -> FilePath           -- ^ Base output directory
           -> FilePath           -- ^ Path to source file
           -> IO FilePath        -- ^ Path to generated object code
compileCxx gcc opts incls out_path cxx_src =
    do
    let includes  = map ("-I" ++) incls
        out_path' = normalisePath out_path
        cxx_src'  = normalisePath cxx_src
        out_file  = out_path' </> dropFileName cxx_src </> replaceExtension (takeFileName cxx_src) ".o"
        lo_file = out_path' </> dropFileName cxx_src </> replaceExtension (takeFileName cxx_src) ".lo"
        tpo_file = out_path' </> dropFileName cxx_src </> replaceExtension (takeFileName cxx_src) ".Tpo"
        out       = ["-MT", lo_file, "-MD", "-MP", "-MF", tpo_file, "-c", "-o", lo_file, cxx_src']
        opts'     = opts ++ osCompileOpts
    do_it <- needsCompiling cxx_src out_file
    when do_it $ 
      do
        createDirectoryIfMissing True (dropFileName out_file)
        runProgram verbose gcc (includes ++ opts' ++ out)

        let out' = ["-MT", lo_file, "-MD", "-MP", "-MF", tpo_file, "-c", cxx_src', "-fPIC", "-DPIC", "-o", out_file]
        runProgram verbose gcc (includes ++ opts' ++ out')
    return out_file

-- | Return True if obj does not exist or is older than src.
--   Real dependency checking would be nice here...
needsCompiling :: FilePath        -- ^ Path to source file
               -> FilePath        -- ^ Path to object file
               -> IO Bool         -- ^ True if compilation required
needsCompiling src obj =
    do
    has_obj <- doesFileExist obj
    if has_obj
        then do
          mtime_src <- getModificationTime src
          mtime_obj <- getModificationTime obj
          if mtime_obj < mtime_src then return True else return False
        else
          return True
-- | Return any linker options required to support shared library creation
linkCxxOpts :: Version     -- ^ Version information to be used for Unix shared libraries 
            -> FilePath    -- ^ Directory in which library will be built
            -> String      -- ^ Name of the shared library
            -> [String]    -- ^ List of options which can be applied to 'runProgram'
linkCxxOpts ver out_dir basename =
    let dll_pathname    = normalisePath (out_dir </> addExtension basename ".dll")
        implib_pathname = normalisePath (out_dir </> "lib" ++ addExtension basename ".a") in
    case buildOS of
      Windows -> ["-static", "", "-o " ++ addExtension basename ".dll", 
                  "-Wl,--out-implib," ++ "lib" ++ addExtension basename ".a",
                  "-Wl,--export-all-symbols"]
      OSX     -> ["-dynamiclib", 
                  "-o " ++ out_dir </> addExtension basename ".so", 
                  "-static", "-Wl,undefined,dynamic_lookup"]
      _       -> [
                  "-Wl,-soname", "-Wl,libharf.so.0", "-o", out_dir </> "lib" ++ basename ++ ".so"]
        where
          maj_ver     = (show . head . versionBranch) ver
          (a:b:c:d:_) = versionBranch ver
          full_ver    = (show a) ++ "." ++ (show b) ++ "." ++ (show c) ++ "." ++ (show d) 

-- | Create a dynamically linked library using the configured ld.
linkSharedLib :: ConfiguredProgram -- ^ Program used to perform linking
              -> [String]          -- ^ Linker options supplied by Cabal
              -> [FilePath]        -- ^ Library directories
              -> [String]          -- ^ Libraries
              -> [String]          -- ^ Objects
              -> Version           -- ^ wxCore version (wxC has same version number)
              -> FilePath          -- ^ Directory in which library will begenerated
              -> String            -- ^ Name of the shared library
              -> IO ()
linkSharedLib gcc opts lib_dirs libs objs ver out_dir dll_name =
    do
    cwd <- getCurrentDirectory
    let lib_dirs' = map (\d -> "-L" ++ normalisePath d) lib_dirs
        out_dir'  = normalisePath out_dir
        opts'     = opts ++ linkCxxOpts ver (cwd </> out_dir') dll_name
        objs'     = map normalisePath objs
        libs'     = ["-lstdc++"] ++ map ("-l" ++) libs
    runProgram verbose gcc (["-shared"] ++ objs' ++ lib_dirs' ++ libs' ++ opts')
 
-- | The 'normalise' implementation in System.FilePath does not meet the requirements of 
--   calling and/or running external programs on Windows particularly well as it does not
--   normalise the '/' character to '\\'. The problem is that some MinGW programs do not
--   like to see paths with a mixture of '/' and '\\'. Sine we are calling out to these,
--   we require a stricter normalisation.
normalisePath :: FilePath -> FilePath
normalisePath = case buildOS of
                  Windows -> dosifyFilePath
                  _       -> unixifyFilePath
 
-- | Replace a character in a String with some other character
replace :: Char            -- ^ Character to replace
        -> Char            -- ^ Character with which to replace
        -> String          -- ^ String in which to replace
        -> String          -- ^ Transformed string
replace old new = map replace' 
    where
      replace' elem = if elem == old then new else elem
 
unixifyFilePath = replace '\\' '/'
dosifyFilePath  = replace '/' '\\'

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
 
-- | Return any compiler options required to support shared library creation
osCompileOpts :: [String] -- ^ Platform-specific compile options
osCompileOpts =
    case buildOS of
      Windows -> ["-DBUILD_DLL"]
      OSX     -> ["-fPIC"]
      _       -> ["-fPIC"]
 
