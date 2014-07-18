{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include "harfbuzz/hb.h"
#include <ft2build.h>
module Bindings.Harfbuzz.HbFt where
import Foreign.Ptr
#strict_import

import Graphics.Rendering.FreeType.Internal.Face

import Bindings.Harfbuzz.Hb

#ccall hb_ft_face_create , FT_Face -> <hb_destroy_func_t> -> IO (Ptr <struct hb_face_t>)

#ccall hb_ft_face_create_cached , FT_Face -> IO (Ptr <struct hb_face_t>)

#ccall hb_ft_font_create , FT_Face -> <hb_destroy_func_t> -> IO (Ptr <struct hb_font_t>)

#ccall hb_ft_font_set_funcs , Ptr <struct hb_font_t> -> IO ()

#ccall hb_ft_font_get_face , Ptr <struct hb_font_t> -> IO FT_Face
