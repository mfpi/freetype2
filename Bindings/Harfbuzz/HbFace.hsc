{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include "harfbuzz/hb.h"
module Bindings.Harfbuzz.HbFace where
import Foreign.Ptr
#strict_import

import Bindings.Harfbuzz.HbCommon
import Bindings.Harfbuzz.HbBlob
{- typedef struct hb_face_t hb_face_t; -}
#opaque_t struct hb_face_t
-- #synonym_t hb_face_t , <struct hb_face_t>
#ccall hb_face_create , Ptr <struct hb_blob_t> -> CUInt -> IO (Ptr <struct hb_face_t>)
#callback hb_reference_table_func_t , Ptr <struct hb_face_t> -> CUInt -> Ptr () -> IO (Ptr <struct hb_blob_t>)
#ccall hb_face_create_for_tables , <hb_reference_table_func_t> -> Ptr () -> <hb_destroy_func_t> -> IO (Ptr <struct hb_face_t>)
#ccall hb_face_get_empty , IO (Ptr <struct hb_face_t>)
#ccall hb_face_reference , Ptr <struct hb_face_t> -> IO (Ptr <struct hb_face_t>)
#ccall hb_face_destroy , Ptr <struct hb_face_t> -> IO ()
#ccall hb_face_set_user_data , Ptr <struct hb_face_t> -> Ptr <struct hb_user_data_key_t> -> Ptr () -> <hb_destroy_func_t> -> CInt -> IO CInt
#ccall hb_face_get_user_data , Ptr <struct hb_face_t> -> Ptr <struct hb_user_data_key_t> -> IO (Ptr ())
#ccall hb_face_make_immutable , Ptr <struct hb_face_t> -> IO ()
#ccall hb_face_is_immutable , Ptr <struct hb_face_t> -> IO CInt
#ccall hb_face_reference_table , Ptr <struct hb_face_t> -> CUInt -> IO (Ptr <struct hb_blob_t>)
#ccall hb_face_reference_blob , Ptr <struct hb_face_t> -> IO (Ptr <struct hb_blob_t>)
#ccall hb_face_set_index , Ptr <struct hb_face_t> -> CUInt -> IO ()
#ccall hb_face_get_index , Ptr <struct hb_face_t> -> IO CUInt
#ccall hb_face_set_upem , Ptr <struct hb_face_t> -> CUInt -> IO ()
#ccall hb_face_get_upem , Ptr <struct hb_face_t> -> IO CUInt
#ccall hb_face_set_glyph_count , Ptr <struct hb_face_t> -> CUInt -> IO ()
#ccall hb_face_get_glyph_count , Ptr <struct hb_face_t> -> IO CUInt
