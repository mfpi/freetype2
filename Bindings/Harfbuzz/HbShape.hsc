{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include "harfbuzz/hb.h"
module Bindings.Harfbuzz.HbShape where
import Foreign.Ptr
#strict_import

import Bindings.Harfbuzz.HbCommon
import Bindings.Harfbuzz.HbBuffer
import Bindings.Harfbuzz.HbFont
{- typedef struct hb_feature_t {
            hb_tag_t tag; uint32_t value; unsigned int start; unsigned int end;
        } hb_feature_t; -}
#starttype struct hb_feature_t
#field tag , CUInt
#field value , CUInt
#field start , CUInt
#field end , CUInt
#stoptype
-- #synonym_t hb_feature_t , <struct hb_feature_t>
#ccall hb_feature_from_string , CString -> CInt -> Ptr <struct hb_feature_t> -> IO CInt
#ccall hb_feature_to_string , Ptr <struct hb_feature_t> -> CString -> CUInt -> IO ()
#ccall hb_shape , Ptr <struct hb_font_t> -> Ptr <struct hb_buffer_t> -> Ptr <struct hb_feature_t> -> CUInt -> IO ()
#ccall hb_shape_full , Ptr <struct hb_font_t> -> Ptr <struct hb_buffer_t> -> Ptr <struct hb_feature_t> -> CUInt -> Ptr CString -> IO CInt
#ccall hb_shape_list_shapers , IO (Ptr CString)
