{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include "harfbuzz/hb.h"
module Bindings.Harfbuzz.HbBuffer where
import Foreign.Ptr
#strict_import

import Bindings.Harfbuzz.HbCommon
import Bindings.Harfbuzz.HbUnicode
import Bindings.Harfbuzz.HbFont
{- typedef struct hb_glyph_info_t {
            hb_codepoint_t codepoint;
            hb_mask_t mask;
            uint32_t cluster;
            hb_var_int_t var1;
            hb_var_int_t var2;
        } hb_glyph_info_t; -}
#starttype struct hb_glyph_info_t
#field codepoint , CUInt
#field mask , CUInt
#field cluster , CUInt
#field var1 , <union _hb_var_int_t>
#field var2 , <union _hb_var_int_t>
#stoptype
-- #synonym_t hb_glyph_info_t , <struct hb_glyph_info_t>
{- typedef struct hb_glyph_position_t {
            hb_position_t x_advance;
            hb_position_t y_advance;
            hb_position_t x_offset;
            hb_position_t y_offset;
            hb_var_int_t var;
        } hb_glyph_position_t; -}
#starttype struct hb_glyph_position_t
#field x_advance , CInt
#field y_advance , CInt
#field x_offset , CInt
#field y_offset , CInt
#field var , <union _hb_var_int_t>
#stoptype
-- #synonym_t hb_glyph_position_t , <struct hb_glyph_position_t>
{- typedef struct hb_segment_properties_t {
            hb_direction_t direction;
            hb_script_t script;
            hb_language_t language;
            void * reserved1;
            void * reserved2;
        } hb_segment_properties_t; -}
#starttype struct hb_segment_properties_t
#field direction , <hb_direction_t>
#field script , <hb_script_t>
#field language , <hb_language_t>
#field reserved1 , Ptr ()
#field reserved2 , Ptr ()
#stoptype
-- #synonym_t hb_segment_properties_t , <struct hb_segment_properties_t>
#ccall hb_segment_properties_equal , Ptr <struct hb_segment_properties_t> -> Ptr <struct hb_segment_properties_t> -> IO CInt
#ccall hb_segment_properties_hash , Ptr <struct hb_segment_properties_t> -> IO CUInt
{- typedef struct hb_buffer_t hb_buffer_t; -}
#opaque_t struct hb_buffer_t

-- #synonym_t hb_buffer_t , <struct hb_buffer_t>

#ccall hb_buffer_create , IO (Ptr <struct hb_buffer_t>)
#ccall hb_buffer_get_empty , IO (Ptr <struct hb_buffer_t>)
#ccall hb_buffer_reference , Ptr <struct hb_buffer_t> -> IO (Ptr <struct hb_buffer_t>)
#ccall hb_buffer_destroy , Ptr <struct hb_buffer_t> -> IO ()
#ccall hb_buffer_set_user_data , Ptr <struct hb_buffer_t> -> Ptr <struct hb_user_data_key_t> -> Ptr () -> <hb_destroy_func_t> -> CInt -> IO CInt
#ccall hb_buffer_get_user_data , Ptr <struct hb_buffer_t> -> Ptr <struct hb_user_data_key_t> -> IO (Ptr ())
{- typedef enum {
            HB_BUFFER_CONTENT_TYPE_INVALID = 0,
            HB_BUFFER_CONTENT_TYPE_UNICODE,
            HB_BUFFER_CONTENT_TYPE_GLYPHS
        } hb_buffer_content_type_t; -}
#integral_t hb_buffer_content_type_t
#num HB_BUFFER_CONTENT_TYPE_INVALID
#num HB_BUFFER_CONTENT_TYPE_UNICODE
#num HB_BUFFER_CONTENT_TYPE_GLYPHS
#ccall hb_buffer_set_content_type , Ptr <struct hb_buffer_t> -> <hb_buffer_content_type_t> -> IO ()
#ccall hb_buffer_get_content_type , Ptr <struct hb_buffer_t> -> IO <hb_buffer_content_type_t>
#ccall hb_buffer_set_unicode_funcs , Ptr <struct hb_buffer_t> -> Ptr <struct hb_unicode_funcs_t> -> IO ()
#ccall hb_buffer_get_unicode_funcs , Ptr <struct hb_buffer_t> -> IO (Ptr <struct hb_unicode_funcs_t>)
#ccall hb_buffer_set_direction , Ptr <struct hb_buffer_t> -> <hb_direction_t> -> IO ()
#ccall hb_buffer_get_direction , Ptr <struct hb_buffer_t> -> IO <hb_direction_t>
#ccall hb_buffer_set_script , Ptr <struct hb_buffer_t> -> <hb_script_t> -> IO ()
#ccall hb_buffer_get_script , Ptr <struct hb_buffer_t> -> IO <hb_script_t>
#ccall hb_buffer_set_language , Ptr <struct hb_buffer_t> -> <hb_language_t> -> IO ()
#ccall hb_buffer_get_language , Ptr <struct hb_buffer_t> -> IO (<hb_language_t>)
#ccall hb_buffer_set_segment_properties , Ptr <struct hb_buffer_t> -> Ptr <struct hb_segment_properties_t> -> IO ()
#ccall hb_buffer_get_segment_properties , Ptr <struct hb_buffer_t> -> Ptr <struct hb_segment_properties_t> -> IO ()
#ccall hb_buffer_guess_segment_properties , Ptr <struct hb_buffer_t> -> IO ()
{- typedef enum {
            HB_BUFFER_FLAG_DEFAULT = 0x0u,
            HB_BUFFER_FLAG_BOT = 0x1u,
            HB_BUFFER_FLAG_EOT = 0x2u,
            HB_BUFFER_FLAG_PRESERVE_DEFAULT_IGNORABLES = 0x4u
        } hb_buffer_flags_t; -}
#integral_t hb_buffer_flags_t
#num HB_BUFFER_FLAG_DEFAULT
#num HB_BUFFER_FLAG_BOT
#num HB_BUFFER_FLAG_EOT
#num HB_BUFFER_FLAG_PRESERVE_DEFAULT_IGNORABLES
#ccall hb_buffer_set_flags , Ptr <struct hb_buffer_t> -> <hb_buffer_flags_t> -> IO ()
#ccall hb_buffer_get_flags , Ptr <struct hb_buffer_t> -> IO <hb_buffer_flags_t>
#ccall hb_buffer_reset , Ptr <struct hb_buffer_t> -> IO ()
#ccall hb_buffer_clear_contents , Ptr <struct hb_buffer_t> -> IO ()
#ccall hb_buffer_pre_allocate , Ptr <struct hb_buffer_t> -> CUInt -> IO CInt
#ccall hb_buffer_allocation_successful , Ptr <struct hb_buffer_t> -> IO CInt
#ccall hb_buffer_reverse , Ptr <struct hb_buffer_t> -> IO ()
#ccall hb_buffer_reverse_clusters , Ptr <struct hb_buffer_t> -> IO ()
#ccall hb_buffer_add , Ptr <struct hb_buffer_t> -> CUInt -> CUInt -> IO ()
#ccall hb_buffer_add_utf8 , Ptr <struct hb_buffer_t> -> CString -> CInt -> CUInt -> CInt -> IO ()
#ccall hb_buffer_add_utf16 , Ptr <struct hb_buffer_t> -> Ptr CUShort -> CInt -> CUInt -> CInt -> IO ()
#ccall hb_buffer_add_utf32 , Ptr <struct hb_buffer_t> -> Ptr CUInt -> CInt -> CUInt -> CInt -> IO ()
#ccall hb_buffer_set_length , Ptr <struct hb_buffer_t> -> CUInt -> IO CInt
#ccall hb_buffer_get_length , Ptr <struct hb_buffer_t> -> IO CUInt
#ccall hb_buffer_get_glyph_infos , Ptr <struct hb_buffer_t> -> Ptr CUInt -> IO (Ptr <struct hb_glyph_info_t>)
#ccall hb_buffer_get_glyph_positions , Ptr <struct hb_buffer_t> -> Ptr CUInt -> IO (Ptr <struct hb_glyph_position_t>)
#ccall hb_buffer_normalize_glyphs , Ptr <struct hb_buffer_t> -> IO ()
{- typedef enum {
            HB_BUFFER_SERIALIZE_FLAG_DEFAULT = 0x0u,
            HB_BUFFER_SERIALIZE_FLAG_NO_CLUSTERS = 0x1u,
            HB_BUFFER_SERIALIZE_FLAG_NO_POSITIONS = 0x2u,
            HB_BUFFER_SERIALIZE_FLAG_NO_GLYPH_NAMES = 0x4u
        } hb_buffer_serialize_flags_t; -}
#integral_t hb_buffer_serialize_flags_t
#num HB_BUFFER_SERIALIZE_FLAG_DEFAULT
#num HB_BUFFER_SERIALIZE_FLAG_NO_CLUSTERS
#num HB_BUFFER_SERIALIZE_FLAG_NO_POSITIONS
#num HB_BUFFER_SERIALIZE_FLAG_NO_GLYPH_NAMES
{- typedef enum {
            HB_BUFFER_SERIALIZE_FORMAT_TEXT = (hb_tag_t) ((uint8_t) 'T' << 24 | (uint8_t) 'E' << 16 | (uint8_t) 'X' << 8 | (uint8_t) 'T'),
            HB_BUFFER_SERIALIZE_FORMAT_JSON = (hb_tag_t) ((uint8_t) 'J' << 24 | (uint8_t) 'S' << 16 | (uint8_t) 'O' << 8 | (uint8_t) 'N'),
            HB_BUFFER_SERIALIZE_FORMAT_INVALID = (hb_tag_t) ((uint8_t) 0 << 24 | (uint8_t) 0 << 16 | (uint8_t) 0 << 8 | (uint8_t) 0)
        } hb_buffer_serialize_format_t; -}
#integral_t hb_buffer_serialize_format_t
#num HB_BUFFER_SERIALIZE_FORMAT_TEXT
#num HB_BUFFER_SERIALIZE_FORMAT_JSON
#num HB_BUFFER_SERIALIZE_FORMAT_INVALID
#ccall hb_buffer_serialize_format_from_string , CString -> CInt -> IO <hb_buffer_serialize_format_t>
#ccall hb_buffer_serialize_format_to_string , <hb_buffer_serialize_format_t> -> IO CString
#ccall hb_buffer_serialize_list_formats , IO (Ptr CString)
#ccall hb_buffer_serialize_glyphs , Ptr <struct hb_buffer_t> -> CUInt -> CUInt -> CString -> CUInt -> Ptr CUInt -> Ptr <struct hb_font_t> -> <hb_buffer_serialize_format_t> -> <hb_buffer_serialize_flags_t> -> IO CUInt
#ccall hb_buffer_deserialize_glyphs , Ptr <struct hb_buffer_t> -> CString -> CInt -> Ptr CString -> Ptr <struct hb_font_t> -> <hb_buffer_serialize_format_t> -> IO CInt
