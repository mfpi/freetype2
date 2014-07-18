{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include "harfbuzz/hb.h"
module Bindings.Harfbuzz.HbFont where
import Foreign.Ptr
#strict_import

import Bindings.Harfbuzz.HbCommon
import Bindings.Harfbuzz.HbFace
{- typedef struct hb_font_t hb_font_t; -}
#opaque_t struct hb_font_t
-- #synonym_t hb_font_t , <struct hb_font_t>
{- typedef struct hb_font_funcs_t hb_font_funcs_t; -}
#opaque_t struct hb_font_funcs_t
-- #synonym_t hb_font_funcs_t , <struct hb_font_funcs_t>
#ccall hb_font_funcs_create , IO (Ptr <struct hb_font_funcs_t>)
#ccall hb_font_funcs_get_empty , IO (Ptr <struct hb_font_funcs_t>)
#ccall hb_font_funcs_reference , Ptr <struct hb_font_funcs_t> -> IO (Ptr <struct hb_font_funcs_t>)
#ccall hb_font_funcs_destroy , Ptr <struct hb_font_funcs_t> -> IO ()
#ccall hb_font_funcs_set_user_data , Ptr <struct hb_font_funcs_t> -> Ptr <struct hb_user_data_key_t> -> Ptr () -> <hb_destroy_func_t> -> CInt -> IO CInt
#ccall hb_font_funcs_get_user_data , Ptr <struct hb_font_funcs_t> -> Ptr <struct hb_user_data_key_t> -> IO (Ptr ())
#ccall hb_font_funcs_make_immutable , Ptr <struct hb_font_funcs_t> -> IO ()
#ccall hb_font_funcs_is_immutable , Ptr <struct hb_font_funcs_t> -> IO CInt
{- typedef struct hb_glyph_extents_t {
            hb_position_t x_bearing;
            hb_position_t y_bearing;
            hb_position_t width;
            hb_position_t height;
        } hb_glyph_extents_t; -}
#starttype struct hb_glyph_extents_t
#field x_bearing , CInt
#field y_bearing , CInt
#field width , CInt
#field height , CInt
#stoptype
-- #synonym_t hb_glyph_extents_t , <struct hb_glyph_extents_t>
#callback hb_font_get_glyph_func_t , Ptr <struct hb_font_t> -> Ptr () -> CUInt -> CUInt -> Ptr CUInt -> Ptr () -> IO CInt
#callback hb_font_get_glyph_advance_func_t , Ptr <struct hb_font_t> -> Ptr () -> CUInt -> Ptr () -> IO CInt
{- typedef hb_font_get_glyph_advance_func_t hb_font_get_glyph_h_advance_func_t; -}
#synonym_t hb_font_get_glyph_h_advance_func_t , <hb_font_get_glyph_advance_func_t>
{- typedef hb_font_get_glyph_advance_func_t hb_font_get_glyph_v_advance_func_t; -}
#synonym_t hb_font_get_glyph_v_advance_func_t , <hb_font_get_glyph_advance_func_t>
#callback hb_font_get_glyph_origin_func_t , Ptr <struct hb_font_t> -> Ptr () -> CUInt -> Ptr CInt -> Ptr CInt -> Ptr () -> IO CInt
{- typedef hb_font_get_glyph_origin_func_t hb_font_get_glyph_h_origin_func_t; -}
#synonym_t hb_font_get_glyph_h_origin_func_t , <hb_font_get_glyph_origin_func_t>
{- typedef hb_font_get_glyph_origin_func_t hb_font_get_glyph_v_origin_func_t; -}
#synonym_t hb_font_get_glyph_v_origin_func_t , <hb_font_get_glyph_origin_func_t>
#callback hb_font_get_glyph_kerning_func_t , Ptr <struct hb_font_t> -> Ptr () -> CUInt -> CUInt -> Ptr () -> IO CInt
{- typedef hb_font_get_glyph_kerning_func_t hb_font_get_glyph_h_kerning_func_t; -}
#synonym_t hb_font_get_glyph_h_kerning_func_t , <hb_font_get_glyph_kerning_func_t>
{- typedef hb_font_get_glyph_kerning_func_t hb_font_get_glyph_v_kerning_func_t; -}
#synonym_t hb_font_get_glyph_v_kerning_func_t , <hb_font_get_glyph_kerning_func_t>
#callback hb_font_get_glyph_extents_func_t , Ptr <struct hb_font_t> -> Ptr () -> CUInt -> Ptr <struct hb_glyph_extents_t> -> Ptr () -> IO CInt
#callback hb_font_get_glyph_contour_point_func_t , Ptr <struct hb_font_t> -> Ptr () -> CUInt -> CUInt -> Ptr CInt -> Ptr CInt -> Ptr () -> IO CInt
#callback hb_font_get_glyph_name_func_t , Ptr <struct hb_font_t> -> Ptr () -> CUInt -> CString -> CUInt -> Ptr () -> IO CInt
#callback hb_font_get_glyph_from_name_func_t , Ptr <struct hb_font_t> -> Ptr () -> CString -> CInt -> Ptr CUInt -> Ptr () -> IO CInt
#ccall hb_font_funcs_set_glyph_func , Ptr <struct hb_font_funcs_t> -> <hb_font_get_glyph_func_t> -> Ptr () -> <hb_destroy_func_t> -> IO ()
#ccall hb_font_funcs_set_glyph_h_advance_func , Ptr <struct hb_font_funcs_t> -> <hb_font_get_glyph_advance_func_t> -> Ptr () -> <hb_destroy_func_t> -> IO ()
#ccall hb_font_funcs_set_glyph_v_advance_func , Ptr <struct hb_font_funcs_t> -> <hb_font_get_glyph_advance_func_t> -> Ptr () -> <hb_destroy_func_t> -> IO ()
#ccall hb_font_funcs_set_glyph_h_origin_func , Ptr <struct hb_font_funcs_t> -> <hb_font_get_glyph_origin_func_t> -> Ptr () -> <hb_destroy_func_t> -> IO ()
#ccall hb_font_funcs_set_glyph_v_origin_func , Ptr <struct hb_font_funcs_t> -> <hb_font_get_glyph_origin_func_t> -> Ptr () -> <hb_destroy_func_t> -> IO ()
#ccall hb_font_funcs_set_glyph_h_kerning_func , Ptr <struct hb_font_funcs_t> -> <hb_font_get_glyph_kerning_func_t> -> Ptr () -> <hb_destroy_func_t> -> IO ()
#ccall hb_font_funcs_set_glyph_v_kerning_func , Ptr <struct hb_font_funcs_t> -> <hb_font_get_glyph_kerning_func_t> -> Ptr () -> <hb_destroy_func_t> -> IO ()
#ccall hb_font_funcs_set_glyph_extents_func , Ptr <struct hb_font_funcs_t> -> <hb_font_get_glyph_extents_func_t> -> Ptr () -> <hb_destroy_func_t> -> IO ()
#ccall hb_font_funcs_set_glyph_contour_point_func , Ptr <struct hb_font_funcs_t> -> <hb_font_get_glyph_contour_point_func_t> -> Ptr () -> <hb_destroy_func_t> -> IO ()
#ccall hb_font_funcs_set_glyph_name_func , Ptr <struct hb_font_funcs_t> -> <hb_font_get_glyph_name_func_t> -> Ptr () -> <hb_destroy_func_t> -> IO ()
#ccall hb_font_funcs_set_glyph_from_name_func , Ptr <struct hb_font_funcs_t> -> <hb_font_get_glyph_from_name_func_t> -> Ptr () -> <hb_destroy_func_t> -> IO ()
#ccall hb_font_get_glyph , Ptr <struct hb_font_t> -> CUInt -> CUInt -> Ptr CUInt -> IO CInt
#ccall hb_font_get_glyph_h_advance , Ptr <struct hb_font_t> -> CUInt -> IO CInt
#ccall hb_font_get_glyph_v_advance , Ptr <struct hb_font_t> -> CUInt -> IO CInt
#ccall hb_font_get_glyph_h_origin , Ptr <struct hb_font_t> -> CUInt -> Ptr CInt -> Ptr CInt -> IO CInt
#ccall hb_font_get_glyph_v_origin , Ptr <struct hb_font_t> -> CUInt -> Ptr CInt -> Ptr CInt -> IO CInt
#ccall hb_font_get_glyph_h_kerning , Ptr <struct hb_font_t> -> CUInt -> CUInt -> IO CInt
#ccall hb_font_get_glyph_v_kerning , Ptr <struct hb_font_t> -> CUInt -> CUInt -> IO CInt
#ccall hb_font_get_glyph_extents , Ptr <struct hb_font_t> -> CUInt -> Ptr <struct hb_glyph_extents_t> -> IO CInt
#ccall hb_font_get_glyph_contour_point , Ptr <struct hb_font_t> -> CUInt -> CUInt -> Ptr CInt -> Ptr CInt -> IO CInt
#ccall hb_font_get_glyph_name , Ptr <struct hb_font_t> -> CUInt -> CString -> CUInt -> IO CInt
#ccall hb_font_get_glyph_from_name , Ptr <struct hb_font_t> -> CString -> CInt -> Ptr CUInt -> IO CInt
#ccall hb_font_get_glyph_advance_for_direction , Ptr <struct hb_font_t> -> CUInt -> <hb_direction_t> -> Ptr CInt -> Ptr CInt -> IO ()
#ccall hb_font_get_glyph_origin_for_direction , Ptr <struct hb_font_t> -> CUInt -> <hb_direction_t> -> Ptr CInt -> Ptr CInt -> IO ()
#ccall hb_font_add_glyph_origin_for_direction , Ptr <struct hb_font_t> -> CUInt -> <hb_direction_t> -> Ptr CInt -> Ptr CInt -> IO ()
#ccall hb_font_subtract_glyph_origin_for_direction , Ptr <struct hb_font_t> -> CUInt -> <hb_direction_t> -> Ptr CInt -> Ptr CInt -> IO ()
#ccall hb_font_get_glyph_kerning_for_direction , Ptr <struct hb_font_t> -> CUInt -> CUInt -> <hb_direction_t> -> Ptr CInt -> Ptr CInt -> IO ()
#ccall hb_font_get_glyph_extents_for_origin , Ptr <struct hb_font_t> -> CUInt -> <hb_direction_t> -> Ptr <struct hb_glyph_extents_t> -> IO CInt
#ccall hb_font_get_glyph_contour_point_for_origin , Ptr <struct hb_font_t> -> CUInt -> CUInt -> <hb_direction_t> -> Ptr CInt -> Ptr CInt -> IO CInt
#ccall hb_font_glyph_to_string , Ptr <struct hb_font_t> -> CUInt -> CString -> CUInt -> IO ()
#ccall hb_font_glyph_from_string , Ptr <struct hb_font_t> -> CString -> CInt -> Ptr CUInt -> IO CInt
#ccall hb_font_create , Ptr <struct hb_face_t> -> IO (Ptr <struct hb_font_t>)
#ccall hb_font_create_sub_font , Ptr <struct hb_font_t> -> IO (Ptr <struct hb_font_t>)
#ccall hb_font_get_empty , IO (Ptr <struct hb_font_t>)
#ccall hb_font_reference , Ptr <struct hb_font_t> -> IO (Ptr <struct hb_font_t>)
#ccall hb_font_destroy , Ptr <struct hb_font_t> -> IO ()
#ccall hb_font_set_user_data , Ptr <struct hb_font_t> -> Ptr <struct hb_user_data_key_t> -> Ptr () -> <hb_destroy_func_t> -> CInt -> IO CInt
#ccall hb_font_get_user_data , Ptr <struct hb_font_t> -> Ptr <struct hb_user_data_key_t> -> IO (Ptr ())
#ccall hb_font_make_immutable , Ptr <struct hb_font_t> -> IO ()
#ccall hb_font_is_immutable , Ptr <struct hb_font_t> -> IO CInt
#ccall hb_font_get_parent , Ptr <struct hb_font_t> -> IO (Ptr <struct hb_font_t>)
#ccall hb_font_get_face , Ptr <struct hb_font_t> -> IO (Ptr <struct hb_face_t>)
#ccall hb_font_set_funcs , Ptr <struct hb_font_t> -> Ptr <struct hb_font_funcs_t> -> Ptr () -> <hb_destroy_func_t> -> IO ()
#ccall hb_font_set_funcs_data , Ptr <struct hb_font_t> -> Ptr () -> <hb_destroy_func_t> -> IO ()
#ccall hb_font_set_scale , Ptr <struct hb_font_t> -> CInt -> CInt -> IO ()
#ccall hb_font_get_scale , Ptr <struct hb_font_t> -> Ptr CInt -> Ptr CInt -> IO ()
#ccall hb_font_set_ppem , Ptr <struct hb_font_t> -> CUInt -> CUInt -> IO ()
#ccall hb_font_get_ppem , Ptr <struct hb_font_t> -> Ptr CUInt -> Ptr CUInt -> IO ()
