{-# LANGUAGE DataKinds, TypeOperators #-}
module Main where

import Graphics.Rendering.FreeType.Internal
import Graphics.Rendering.FreeType.Internal.Face
import Graphics.Rendering.FreeType.Internal.Bitmap
import Graphics.Rendering.FreeType.Internal.GlyphSlot
import Graphics.Rendering.FreeType.Internal.Matrix
import Graphics.Rendering.FreeType.Internal.PrimitiveTypes
import Foreign.Marshal.Alloc
import Foreign.C.String
import Foreign.Storable
import Foreign.Ptr

import Bindings.Harfbuzz.Hb
import Bindings.Harfbuzz.HbFt
import Bindings.Harfbuzz.HbShape

import Codec.Picture

import qualified Data.ByteString as BS
import qualified Data.ByteString.Internal as BS (c2w, w2c)

loadFont :: IO (Ptr FT_Face)
loadFont = do
	libPtr <- malloc
	facePtr <- malloc

	ftError <- ft_Init_FreeType libPtr
	print ftError
	ftError2 <- peek libPtr >>= newFace "font.otf" facePtr
	print ftError2
	--peek libPtr >>= \lib -> ft_Library_SetLcdFilter lib ft_LCD_FILTER_LIGHT
	peek facePtr >>= \face -> ft_Set_Char_Size face 0 (24*64) (100*72) 72
		>>= print

	let zero = (0::FT_Fixed) * 0x10000
	let one = (1::FT_Fixed) * 0x10000
	let one2 = round (((1.0::Float)/ (100::Float)) * 0x10000) :: FT_Fixed

	let matrix = FT_Matrix one2 zero zero one
	peek facePtr >>= \face -> alloca $ \matPtr -> do
		poke matPtr matrix
		ft_Set_Transform face matPtr nullPtr


	return facePtr
	where
		newFace filename face lib = withCString filename $ \cstr -> ft_New_Face lib cstr 0 face

harfbuzzGlyphData :: IO ()
harfbuzzGlyphData = do
	facePtr <- loadFont

	buf <- c'hb_buffer_create
	c'hb_buffer_set_direction buf c'HB_DIRECTION_LTR
	c'hb_buffer_set_script buf c'HB_SCRIPT_COMMON
	hb_lang <- withCString "en" $ \lang -> c'hb_language_from_string lang 2	
	c'hb_buffer_set_language buf hb_lang
	withCString "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" $ \text -> c'hb_buffer_add_utf8 buf text 52 0 52
	hb_font <- peek facePtr >>= \font -> c'hb_ft_font_create font nullFunPtr
	c'hb_shape hb_font buf nullPtr 0

	alloca $ \glyphCountPtr -> do
		glyphInfo <- c'hb_buffer_get_glyph_infos buf glyphCountPtr
		glyphPos <- c'hb_buffer_get_glyph_positions buf glyphCountPtr

		print "test"
		let printGlyph i = do
			peekElemOff glyphCountPtr i >>= print
			peekElemOff glyphInfo i >>= print
			peekElemOff glyphPos i >>= print

		mapM_ printGlyph [1]

		--let flags = 

		mapM_ (\i -> do
			codepoint <- fmap c'hb_glyph_info_t'codepoint $ peekElemOff glyphInfo i
			peek facePtr >>= \face -> ft_Load_Glyph face codepoint ft_LOAD_RENDER

			--slotPtr <- peek facePtr >>= \face -> fmap glyph 
			peek facePtr >>= \face -> do
				let slotPtr = glyph face
				peek slotPtr >>= \slot -> do
					let bitmapPtr = bitmap slot 
					peek bitmapPtr >>= \bitmap -> do
						print "Rows and width"
						print $ pitch bitmap
						print $ rows bitmap	
						print $ width bitmap

						stuff <- mapM (\(x, y) -> do
								c8 <- peekElemOff (buffer bitmap) (y*(fromIntegral $ pitch bitmap) + x)
								return $ BS.c2w . castCCharToChar $ c8	
							) [(x, y) | y <- [0..(fromIntegral $ rows bitmap-1)], x <- [0..(fromIntegral $ width bitmap - 1)]]

						let img = generateImage (\x y -> stuff!!(y*(fromIntegral $ pitch bitmap) + x)) (fromIntegral $ width bitmap) (fromIntegral $ rows bitmap)

						saveBmpImage ("test" ++ show i ++ ".bmp") (ImageY8 img)
						return ()
			) [0..52]

		return ()

	return ()

main :: IO ()
main = do
	harfbuzzGlyphData
	return ()