{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include "harfbuzz/hb.h"
module Bindings.Harfbuzz.HbVersion where
import Foreign.Ptr
#strict_import

import Bindings.Harfbuzz.HbCommon
#ccall hb_version , Ptr CUInt -> Ptr CUInt -> Ptr CUInt -> IO ()
#ccall hb_version_string , IO CString
#ccall hb_version_atleast , CUInt -> CUInt -> CUInt -> IO CInt
