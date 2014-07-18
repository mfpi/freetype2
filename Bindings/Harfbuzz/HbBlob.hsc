{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include "harfbuzz/hb.h"
module Bindings.Harfbuzz.HbBlob where
import Foreign.Ptr
#strict_import

import Bindings.Harfbuzz.HbCommon
{- typedef enum {
            HB_MEMORY_MODE_DUPLICATE,
            HB_MEMORY_MODE_READONLY,
            HB_MEMORY_MODE_WRITABLE,
            HB_MEMORY_MODE_READONLY_MAY_MAKE_WRITABLE
        } hb_memory_mode_t; -}
#integral_t hb_memory_mode_t
#num HB_MEMORY_MODE_DUPLICATE
#num HB_MEMORY_MODE_READONLY
#num HB_MEMORY_MODE_WRITABLE
#num HB_MEMORY_MODE_READONLY_MAY_MAKE_WRITABLE
{- typedef struct hb_blob_t hb_blob_t; -}
#opaque_t struct hb_blob_t
-- #synonym_t hb_blob_t , <struct hb_blob_t>
#ccall hb_blob_create , CString -> CUInt -> <hb_memory_mode_t> -> Ptr () -> <hb_destroy_func_t> -> IO (Ptr <struct hb_blob_t>)
#ccall hb_blob_create_sub_blob , Ptr <struct hb_blob_t> -> CUInt -> CUInt -> IO (Ptr <struct hb_blob_t>)
#ccall hb_blob_get_empty , IO (Ptr <struct hb_blob_t>)
#ccall hb_blob_reference , Ptr <struct hb_blob_t> -> IO (Ptr <struct hb_blob_t>)
#ccall hb_blob_destroy , Ptr <struct hb_blob_t> -> IO ()
#ccall hb_blob_set_user_data , Ptr <struct hb_blob_t> -> Ptr <struct hb_user_data_key_t> -> Ptr () -> <hb_destroy_func_t> -> CInt -> IO CInt
#ccall hb_blob_get_user_data , Ptr <struct hb_blob_t> -> Ptr <struct hb_user_data_key_t> -> IO (Ptr ())
#ccall hb_blob_make_immutable , Ptr <struct hb_blob_t> -> IO ()
#ccall hb_blob_is_immutable , Ptr <struct hb_blob_t> -> IO CInt
#ccall hb_blob_get_length , Ptr <struct hb_blob_t> -> IO CUInt
#ccall hb_blob_get_data , Ptr <struct hb_blob_t> -> Ptr CUInt -> IO CString
#ccall hb_blob_get_data_writable , Ptr <struct hb_blob_t> -> Ptr CUInt -> IO CString
