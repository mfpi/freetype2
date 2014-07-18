{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include "harfbuzz/hb.h"
module Bindings.Harfbuzz.HbUnicode where
import Foreign.Ptr
#strict_import

import Bindings.Harfbuzz.HbCommon
{- typedef enum {
            HB_UNICODE_GENERAL_CATEGORY_CONTROL,
            HB_UNICODE_GENERAL_CATEGORY_FORMAT,
            HB_UNICODE_GENERAL_CATEGORY_UNASSIGNED,
            HB_UNICODE_GENERAL_CATEGORY_PRIVATE_USE,
            HB_UNICODE_GENERAL_CATEGORY_SURROGATE,
            HB_UNICODE_GENERAL_CATEGORY_LOWERCASE_LETTER,
            HB_UNICODE_GENERAL_CATEGORY_MODIFIER_LETTER,
            HB_UNICODE_GENERAL_CATEGORY_OTHER_LETTER,
            HB_UNICODE_GENERAL_CATEGORY_TITLECASE_LETTER,
            HB_UNICODE_GENERAL_CATEGORY_UPPERCASE_LETTER,
            HB_UNICODE_GENERAL_CATEGORY_SPACING_MARK,
            HB_UNICODE_GENERAL_CATEGORY_ENCLOSING_MARK,
            HB_UNICODE_GENERAL_CATEGORY_NON_SPACING_MARK,
            HB_UNICODE_GENERAL_CATEGORY_DECIMAL_NUMBER,
            HB_UNICODE_GENERAL_CATEGORY_LETTER_NUMBER,
            HB_UNICODE_GENERAL_CATEGORY_OTHER_NUMBER,
            HB_UNICODE_GENERAL_CATEGORY_CONNECT_PUNCTUATION,
            HB_UNICODE_GENERAL_CATEGORY_DASH_PUNCTUATION,
            HB_UNICODE_GENERAL_CATEGORY_CLOSE_PUNCTUATION,
            HB_UNICODE_GENERAL_CATEGORY_FINAL_PUNCTUATION,
            HB_UNICODE_GENERAL_CATEGORY_INITIAL_PUNCTUATION,
            HB_UNICODE_GENERAL_CATEGORY_OTHER_PUNCTUATION,
            HB_UNICODE_GENERAL_CATEGORY_OPEN_PUNCTUATION,
            HB_UNICODE_GENERAL_CATEGORY_CURRENCY_SYMBOL,
            HB_UNICODE_GENERAL_CATEGORY_MODIFIER_SYMBOL,
            HB_UNICODE_GENERAL_CATEGORY_MATH_SYMBOL,
            HB_UNICODE_GENERAL_CATEGORY_OTHER_SYMBOL,
            HB_UNICODE_GENERAL_CATEGORY_LINE_SEPARATOR,
            HB_UNICODE_GENERAL_CATEGORY_PARAGRAPH_SEPARATOR,
            HB_UNICODE_GENERAL_CATEGORY_SPACE_SEPARATOR
        } hb_unicode_general_category_t; -}
#integral_t hb_unicode_general_category_t
#num HB_UNICODE_GENERAL_CATEGORY_CONTROL
#num HB_UNICODE_GENERAL_CATEGORY_FORMAT
#num HB_UNICODE_GENERAL_CATEGORY_UNASSIGNED
#num HB_UNICODE_GENERAL_CATEGORY_PRIVATE_USE
#num HB_UNICODE_GENERAL_CATEGORY_SURROGATE
#num HB_UNICODE_GENERAL_CATEGORY_LOWERCASE_LETTER
#num HB_UNICODE_GENERAL_CATEGORY_MODIFIER_LETTER
#num HB_UNICODE_GENERAL_CATEGORY_OTHER_LETTER
#num HB_UNICODE_GENERAL_CATEGORY_TITLECASE_LETTER
#num HB_UNICODE_GENERAL_CATEGORY_UPPERCASE_LETTER
#num HB_UNICODE_GENERAL_CATEGORY_SPACING_MARK
#num HB_UNICODE_GENERAL_CATEGORY_ENCLOSING_MARK
#num HB_UNICODE_GENERAL_CATEGORY_NON_SPACING_MARK
#num HB_UNICODE_GENERAL_CATEGORY_DECIMAL_NUMBER
#num HB_UNICODE_GENERAL_CATEGORY_LETTER_NUMBER
#num HB_UNICODE_GENERAL_CATEGORY_OTHER_NUMBER
#num HB_UNICODE_GENERAL_CATEGORY_CONNECT_PUNCTUATION
#num HB_UNICODE_GENERAL_CATEGORY_DASH_PUNCTUATION
#num HB_UNICODE_GENERAL_CATEGORY_CLOSE_PUNCTUATION
#num HB_UNICODE_GENERAL_CATEGORY_FINAL_PUNCTUATION
#num HB_UNICODE_GENERAL_CATEGORY_INITIAL_PUNCTUATION
#num HB_UNICODE_GENERAL_CATEGORY_OTHER_PUNCTUATION
#num HB_UNICODE_GENERAL_CATEGORY_OPEN_PUNCTUATION
#num HB_UNICODE_GENERAL_CATEGORY_CURRENCY_SYMBOL
#num HB_UNICODE_GENERAL_CATEGORY_MODIFIER_SYMBOL
#num HB_UNICODE_GENERAL_CATEGORY_MATH_SYMBOL
#num HB_UNICODE_GENERAL_CATEGORY_OTHER_SYMBOL
#num HB_UNICODE_GENERAL_CATEGORY_LINE_SEPARATOR
#num HB_UNICODE_GENERAL_CATEGORY_PARAGRAPH_SEPARATOR
#num HB_UNICODE_GENERAL_CATEGORY_SPACE_SEPARATOR
{- typedef enum {
            HB_UNICODE_COMBINING_CLASS_NOT_REORDERED = 0,
            HB_UNICODE_COMBINING_CLASS_OVERLAY = 1,
            HB_UNICODE_COMBINING_CLASS_NUKTA = 7,
            HB_UNICODE_COMBINING_CLASS_KANA_VOICING = 8,
            HB_UNICODE_COMBINING_CLASS_VIRAMA = 9,
            HB_UNICODE_COMBINING_CLASS_CCC10 = 10,
            HB_UNICODE_COMBINING_CLASS_CCC11 = 11,
            HB_UNICODE_COMBINING_CLASS_CCC12 = 12,
            HB_UNICODE_COMBINING_CLASS_CCC13 = 13,
            HB_UNICODE_COMBINING_CLASS_CCC14 = 14,
            HB_UNICODE_COMBINING_CLASS_CCC15 = 15,
            HB_UNICODE_COMBINING_CLASS_CCC16 = 16,
            HB_UNICODE_COMBINING_CLASS_CCC17 = 17,
            HB_UNICODE_COMBINING_CLASS_CCC18 = 18,
            HB_UNICODE_COMBINING_CLASS_CCC19 = 19,
            HB_UNICODE_COMBINING_CLASS_CCC20 = 20,
            HB_UNICODE_COMBINING_CLASS_CCC21 = 21,
            HB_UNICODE_COMBINING_CLASS_CCC22 = 22,
            HB_UNICODE_COMBINING_CLASS_CCC23 = 23,
            HB_UNICODE_COMBINING_CLASS_CCC24 = 24,
            HB_UNICODE_COMBINING_CLASS_CCC25 = 25,
            HB_UNICODE_COMBINING_CLASS_CCC26 = 26,
            HB_UNICODE_COMBINING_CLASS_CCC27 = 27,
            HB_UNICODE_COMBINING_CLASS_CCC28 = 28,
            HB_UNICODE_COMBINING_CLASS_CCC29 = 29,
            HB_UNICODE_COMBINING_CLASS_CCC30 = 30,
            HB_UNICODE_COMBINING_CLASS_CCC31 = 31,
            HB_UNICODE_COMBINING_CLASS_CCC32 = 32,
            HB_UNICODE_COMBINING_CLASS_CCC33 = 33,
            HB_UNICODE_COMBINING_CLASS_CCC34 = 34,
            HB_UNICODE_COMBINING_CLASS_CCC35 = 35,
            HB_UNICODE_COMBINING_CLASS_CCC36 = 36,
            HB_UNICODE_COMBINING_CLASS_CCC84 = 84,
            HB_UNICODE_COMBINING_CLASS_CCC91 = 91,
            HB_UNICODE_COMBINING_CLASS_CCC103 = 103,
            HB_UNICODE_COMBINING_CLASS_CCC107 = 107,
            HB_UNICODE_COMBINING_CLASS_CCC118 = 118,
            HB_UNICODE_COMBINING_CLASS_CCC122 = 122,
            HB_UNICODE_COMBINING_CLASS_CCC129 = 129,
            HB_UNICODE_COMBINING_CLASS_CCC130 = 130,
            HB_UNICODE_COMBINING_CLASS_CCC133 = 132,
            HB_UNICODE_COMBINING_CLASS_ATTACHED_BELOW_LEFT = 200,
            HB_UNICODE_COMBINING_CLASS_ATTACHED_BELOW = 202,
            HB_UNICODE_COMBINING_CLASS_ATTACHED_ABOVE = 214,
            HB_UNICODE_COMBINING_CLASS_ATTACHED_ABOVE_RIGHT = 216,
            HB_UNICODE_COMBINING_CLASS_BELOW_LEFT = 218,
            HB_UNICODE_COMBINING_CLASS_BELOW = 220,
            HB_UNICODE_COMBINING_CLASS_BELOW_RIGHT = 222,
            HB_UNICODE_COMBINING_CLASS_LEFT = 224,
            HB_UNICODE_COMBINING_CLASS_RIGHT = 226,
            HB_UNICODE_COMBINING_CLASS_ABOVE_LEFT = 228,
            HB_UNICODE_COMBINING_CLASS_ABOVE = 230,
            HB_UNICODE_COMBINING_CLASS_ABOVE_RIGHT = 232,
            HB_UNICODE_COMBINING_CLASS_DOUBLE_BELOW = 233,
            HB_UNICODE_COMBINING_CLASS_DOUBLE_ABOVE = 234,
            HB_UNICODE_COMBINING_CLASS_IOTA_SUBSCRIPT = 240,
            HB_UNICODE_COMBINING_CLASS_INVALID = 255
        } hb_unicode_combining_class_t; -}
#integral_t hb_unicode_combining_class_t
#num HB_UNICODE_COMBINING_CLASS_NOT_REORDERED
#num HB_UNICODE_COMBINING_CLASS_OVERLAY
#num HB_UNICODE_COMBINING_CLASS_NUKTA
#num HB_UNICODE_COMBINING_CLASS_KANA_VOICING
#num HB_UNICODE_COMBINING_CLASS_VIRAMA
#num HB_UNICODE_COMBINING_CLASS_CCC10
#num HB_UNICODE_COMBINING_CLASS_CCC11
#num HB_UNICODE_COMBINING_CLASS_CCC12
#num HB_UNICODE_COMBINING_CLASS_CCC13
#num HB_UNICODE_COMBINING_CLASS_CCC14
#num HB_UNICODE_COMBINING_CLASS_CCC15
#num HB_UNICODE_COMBINING_CLASS_CCC16
#num HB_UNICODE_COMBINING_CLASS_CCC17
#num HB_UNICODE_COMBINING_CLASS_CCC18
#num HB_UNICODE_COMBINING_CLASS_CCC19
#num HB_UNICODE_COMBINING_CLASS_CCC20
#num HB_UNICODE_COMBINING_CLASS_CCC21
#num HB_UNICODE_COMBINING_CLASS_CCC22
#num HB_UNICODE_COMBINING_CLASS_CCC23
#num HB_UNICODE_COMBINING_CLASS_CCC24
#num HB_UNICODE_COMBINING_CLASS_CCC25
#num HB_UNICODE_COMBINING_CLASS_CCC26
#num HB_UNICODE_COMBINING_CLASS_CCC27
#num HB_UNICODE_COMBINING_CLASS_CCC28
#num HB_UNICODE_COMBINING_CLASS_CCC29
#num HB_UNICODE_COMBINING_CLASS_CCC30
#num HB_UNICODE_COMBINING_CLASS_CCC31
#num HB_UNICODE_COMBINING_CLASS_CCC32
#num HB_UNICODE_COMBINING_CLASS_CCC33
#num HB_UNICODE_COMBINING_CLASS_CCC34
#num HB_UNICODE_COMBINING_CLASS_CCC35
#num HB_UNICODE_COMBINING_CLASS_CCC36
#num HB_UNICODE_COMBINING_CLASS_CCC84
#num HB_UNICODE_COMBINING_CLASS_CCC91
#num HB_UNICODE_COMBINING_CLASS_CCC103
#num HB_UNICODE_COMBINING_CLASS_CCC107
#num HB_UNICODE_COMBINING_CLASS_CCC118
#num HB_UNICODE_COMBINING_CLASS_CCC122
#num HB_UNICODE_COMBINING_CLASS_CCC129
#num HB_UNICODE_COMBINING_CLASS_CCC130
#num HB_UNICODE_COMBINING_CLASS_CCC133
#num HB_UNICODE_COMBINING_CLASS_ATTACHED_BELOW_LEFT
#num HB_UNICODE_COMBINING_CLASS_ATTACHED_BELOW
#num HB_UNICODE_COMBINING_CLASS_ATTACHED_ABOVE
#num HB_UNICODE_COMBINING_CLASS_ATTACHED_ABOVE_RIGHT
#num HB_UNICODE_COMBINING_CLASS_BELOW_LEFT
#num HB_UNICODE_COMBINING_CLASS_BELOW
#num HB_UNICODE_COMBINING_CLASS_BELOW_RIGHT
#num HB_UNICODE_COMBINING_CLASS_LEFT
#num HB_UNICODE_COMBINING_CLASS_RIGHT
#num HB_UNICODE_COMBINING_CLASS_ABOVE_LEFT
#num HB_UNICODE_COMBINING_CLASS_ABOVE
#num HB_UNICODE_COMBINING_CLASS_ABOVE_RIGHT
#num HB_UNICODE_COMBINING_CLASS_DOUBLE_BELOW
#num HB_UNICODE_COMBINING_CLASS_DOUBLE_ABOVE
#num HB_UNICODE_COMBINING_CLASS_IOTA_SUBSCRIPT
#num HB_UNICODE_COMBINING_CLASS_INVALID
{- typedef struct hb_unicode_funcs_t hb_unicode_funcs_t; -}
#opaque_t struct hb_unicode_funcs_t
-- #synonym_t hb_unicode_funcs_t , <struct hb_unicode_funcs_t>
#ccall hb_unicode_funcs_get_default , IO (Ptr <struct hb_unicode_funcs_t>)
#ccall hb_unicode_funcs_create , Ptr <struct hb_unicode_funcs_t> -> IO (Ptr <struct hb_unicode_funcs_t>)
#ccall hb_unicode_funcs_get_empty , IO (Ptr <struct hb_unicode_funcs_t>)
#ccall hb_unicode_funcs_reference , Ptr <struct hb_unicode_funcs_t> -> IO (Ptr <struct hb_unicode_funcs_t>)
#ccall hb_unicode_funcs_destroy , Ptr <struct hb_unicode_funcs_t> -> IO ()
#ccall hb_unicode_funcs_set_user_data , Ptr <struct hb_unicode_funcs_t> -> Ptr <struct hb_user_data_key_t> -> Ptr () -> <hb_destroy_func_t> -> CInt -> IO CInt
#ccall hb_unicode_funcs_get_user_data , Ptr <struct hb_unicode_funcs_t> -> Ptr <struct hb_user_data_key_t> -> IO (Ptr ())
#ccall hb_unicode_funcs_make_immutable , Ptr <struct hb_unicode_funcs_t> -> IO ()
#ccall hb_unicode_funcs_is_immutable , Ptr <struct hb_unicode_funcs_t> -> IO CInt
#ccall hb_unicode_funcs_get_parent , Ptr <struct hb_unicode_funcs_t> -> IO (Ptr <struct hb_unicode_funcs_t>)
#callback hb_unicode_combining_class_func_t , Ptr <struct hb_unicode_funcs_t> -> CUInt -> Ptr () -> IO <hb_unicode_combining_class_t>
#callback hb_unicode_eastasian_width_func_t , Ptr <struct hb_unicode_funcs_t> -> CUInt -> Ptr () -> IO CUInt
#callback hb_unicode_general_category_func_t , Ptr <struct hb_unicode_funcs_t> -> CUInt -> Ptr () -> IO <hb_unicode_general_category_t>
#callback hb_unicode_mirroring_func_t , Ptr <struct hb_unicode_funcs_t> -> CUInt -> Ptr () -> IO CUInt
#callback hb_unicode_script_func_t , Ptr <struct hb_unicode_funcs_t> -> CUInt -> Ptr () -> IO <hb_script_t>
#callback hb_unicode_compose_func_t , Ptr <struct hb_unicode_funcs_t> -> CUInt -> CUInt -> Ptr CUInt -> Ptr () -> IO CInt
#callback hb_unicode_decompose_func_t , Ptr <struct hb_unicode_funcs_t> -> CUInt -> Ptr CUInt -> Ptr CUInt -> Ptr () -> IO CInt
#callback hb_unicode_decompose_compatibility_func_t , Ptr <struct hb_unicode_funcs_t> -> CUInt -> Ptr CUInt -> Ptr () -> IO CUInt
#ccall hb_unicode_funcs_set_combining_class_func , Ptr <struct hb_unicode_funcs_t> -> <hb_unicode_combining_class_func_t> -> Ptr () -> <hb_destroy_func_t> -> IO ()
#ccall hb_unicode_funcs_set_eastasian_width_func , Ptr <struct hb_unicode_funcs_t> -> <hb_unicode_eastasian_width_func_t> -> Ptr () -> <hb_destroy_func_t> -> IO ()
#ccall hb_unicode_funcs_set_general_category_func , Ptr <struct hb_unicode_funcs_t> -> <hb_unicode_general_category_func_t> -> Ptr () -> <hb_destroy_func_t> -> IO ()
#ccall hb_unicode_funcs_set_mirroring_func , Ptr <struct hb_unicode_funcs_t> -> <hb_unicode_mirroring_func_t> -> Ptr () -> <hb_destroy_func_t> -> IO ()
#ccall hb_unicode_funcs_set_script_func , Ptr <struct hb_unicode_funcs_t> -> <hb_unicode_script_func_t> -> Ptr () -> <hb_destroy_func_t> -> IO ()
#ccall hb_unicode_funcs_set_compose_func , Ptr <struct hb_unicode_funcs_t> -> <hb_unicode_compose_func_t> -> Ptr () -> <hb_destroy_func_t> -> IO ()
#ccall hb_unicode_funcs_set_decompose_func , Ptr <struct hb_unicode_funcs_t> -> <hb_unicode_decompose_func_t> -> Ptr () -> <hb_destroy_func_t> -> IO ()
#ccall hb_unicode_funcs_set_decompose_compatibility_func , Ptr <struct hb_unicode_funcs_t> -> <hb_unicode_decompose_compatibility_func_t> -> Ptr () -> <hb_destroy_func_t> -> IO ()
#ccall hb_unicode_combining_class , Ptr <struct hb_unicode_funcs_t> -> CUInt -> IO <hb_unicode_combining_class_t>
#ccall hb_unicode_eastasian_width , Ptr <struct hb_unicode_funcs_t> -> CUInt -> IO CUInt
#ccall hb_unicode_general_category , Ptr <struct hb_unicode_funcs_t> -> CUInt -> IO <hb_unicode_general_category_t>
#ccall hb_unicode_mirroring , Ptr <struct hb_unicode_funcs_t> -> CUInt -> IO CUInt
#ccall hb_unicode_script , Ptr <struct hb_unicode_funcs_t> -> CUInt -> IO <hb_script_t>
#ccall hb_unicode_compose , Ptr <struct hb_unicode_funcs_t> -> CUInt -> CUInt -> Ptr CUInt -> IO CInt
#ccall hb_unicode_decompose , Ptr <struct hb_unicode_funcs_t> -> CUInt -> Ptr CUInt -> Ptr CUInt -> IO CInt
#ccall hb_unicode_decompose_compatibility , Ptr <struct hb_unicode_funcs_t> -> CUInt -> Ptr CUInt -> IO CUInt
