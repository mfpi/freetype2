{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include "harfbuzz/hb.h"
module Bindings.Harfbuzz.HbSet where
import Foreign.Ptr
#strict_import

import Bindings.Harfbuzz.HbCommon
{- typedef struct hb_set_t hb_set_t; -}
#opaque_t struct hb_set_t
-- #synonym_t hb_set_t , <struct hb_set_t>
#ccall hb_set_create , IO (Ptr <struct hb_set_t>)
#ccall hb_set_get_empty , IO (Ptr <struct hb_set_t>)
#ccall hb_set_reference , Ptr <struct hb_set_t> -> IO (Ptr <struct hb_set_t>)
#ccall hb_set_destroy , Ptr <struct hb_set_t> -> IO ()
#ccall hb_set_set_user_data , Ptr <struct hb_set_t> -> Ptr <struct hb_user_data_key_t> -> Ptr () -> <hb_destroy_func_t> -> CInt -> IO CInt
#ccall hb_set_get_user_data , Ptr <struct hb_set_t> -> Ptr <struct hb_user_data_key_t> -> IO (Ptr ())
#ccall hb_set_allocation_successful , Ptr <struct hb_set_t> -> IO CInt
#ccall hb_set_clear , Ptr <struct hb_set_t> -> IO ()
#ccall hb_set_is_empty , Ptr <struct hb_set_t> -> IO CInt
#ccall hb_set_has , Ptr <struct hb_set_t> -> CUInt -> IO CInt
#ccall hb_set_add , Ptr <struct hb_set_t> -> CUInt -> IO ()
#ccall hb_set_add_range , Ptr <struct hb_set_t> -> CUInt -> CUInt -> IO ()
#ccall hb_set_del , Ptr <struct hb_set_t> -> CUInt -> IO ()
#ccall hb_set_del_range , Ptr <struct hb_set_t> -> CUInt -> CUInt -> IO ()
#ccall hb_set_is_equal , Ptr <struct hb_set_t> -> Ptr <struct hb_set_t> -> IO CInt
#ccall hb_set_set , Ptr <struct hb_set_t> -> Ptr <struct hb_set_t> -> IO ()
#ccall hb_set_union , Ptr <struct hb_set_t> -> Ptr <struct hb_set_t> -> IO ()
#ccall hb_set_intersect , Ptr <struct hb_set_t> -> Ptr <struct hb_set_t> -> IO ()
#ccall hb_set_subtract , Ptr <struct hb_set_t> -> Ptr <struct hb_set_t> -> IO ()
#ccall hb_set_symmetric_difference , Ptr <struct hb_set_t> -> Ptr <struct hb_set_t> -> IO ()
#ccall hb_set_invert , Ptr <struct hb_set_t> -> IO ()
#ccall hb_set_get_population , Ptr <struct hb_set_t> -> IO CUInt
#ccall hb_set_get_min , Ptr <struct hb_set_t> -> IO CUInt
#ccall hb_set_get_max , Ptr <struct hb_set_t> -> IO CUInt
#ccall hb_set_next , Ptr <struct hb_set_t> -> Ptr CUInt -> IO CInt
#ccall hb_set_next_range , Ptr <struct hb_set_t> -> Ptr CUInt -> Ptr CUInt -> IO CInt
