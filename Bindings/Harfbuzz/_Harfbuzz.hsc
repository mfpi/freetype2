#include <bindings.dsl.h>
#include <harfbuzz/hb.h>
#include <ft2build.h>

-- | <http://www.opengroup.org/onlinepubs/9699919799/basedefs/regex.h.html>

module Bindings.Harfbuzz () where
import Graphics.Rendering.FreeType.Internal.Face

#opaque_t hb_buffer_t
#opaque_t hb_language_impl_t
#synonym_t hb_language_t, Ptr <hb_language_impl_t>

#opaque_t hb_font_t
#opaque_t hb_feature_t

#integral_t uint32_t
#integral_t int32_t

#synonym_t hb_position_t, <uint32_t>
#synonym_t hb_codepoint_t, <int32_t>
#synonym_t hb_mask_t, <uint32_t>

#starttype hb_glyph_info_t
#field codepoint, <hb_codepoint_t>
#field mask, <hb_mask_t>
#field cluster, <uint32_t>
#stoptype

#starttype hb_glyph_position_t
#field x_advance, <hb_position_t>
#field y_advance, <hb_position_t>
#field x_offset, <hb_position_t>
#field y_offset, <hb_position_t>
#stoptype

#opaque_t hb_destroy_func_t

#integral_t hb_direction_t
#num HB_DIRECTION_LTR

#enum hb_script_t C'hb_script_t HB_SCRIPT_COMMON
-- #integral_t hb_script_t
-- #num HB_SCRIPT_COMMON

-- #opaque_t FT_FaceRec_
-- #synonym_t FT_Face, Ptr <FT_FaceRec_>

#ccall hb_language_from_string, Ptr CChar -> CInt -> IO <hb_language_t>

#ccall hb_buffer_create, IO (Ptr <hb_buffer_t>)
#ccall hb_buffer_set_direction, Ptr <hb_buffer_t> -> <hb_direction_t> -> IO ()
#ccall hb_buffer_set_script, Ptr <hb_buffer_t> -> <hb_script_t> -> IO ()
#ccall hb_buffer_set_language, Ptr <hb_buffer_t> -> <hb_language_t> -> IO ()
#ccall hb_buffer_add_utf8, Ptr <hb_buffer_t> -> Ptr CChar -> CInt -> CUInt -> CInt -> IO ()
#ccall hb_buffer_reset, IO (Ptr <hb_buffer_t>)

#ccall hb_shape, Ptr <hb_font_t> -> Ptr <hb_buffer_t> -> Ptr <hb_feature_t> -> CUInt -> IO ()

#ccall hb_buffer_get_glyph_infos, Ptr <hb_buffer_t> -> Ptr CUInt -> IO (Ptr <hb_glyph_info_t>)
#ccall hb_buffer_get_glyph_positions, Ptr <hb_buffer_t> -> Ptr CUInt -> IO (Ptr <hb_glyph_position_t>)

#ccall hb_ft_font_create, FT_Face -> Ptr <hb_destroy_func_t> -> IO (Ptr <hb_font_t>)

