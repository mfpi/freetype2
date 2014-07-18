{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include "harfbuzz/hb.h"
module Bindings.Harfbuzz.HbCommon where
import Foreign.Ptr
#strict_import

{- typedef int hb_bool_t; -}
#synonym_t hb_bool_t , CInt
{- typedef uint32_t hb_codepoint_t; -}
#synonym_t hb_codepoint_t , CUInt
{- typedef int32_t hb_position_t; -}
#synonym_t hb_position_t , CInt
{- typedef uint32_t hb_mask_t; -}
#synonym_t hb_mask_t , CUInt
{- typedef union _hb_var_int_t {
            uint32_t u32;
            int32_t i32;
            uint16_t u16[2];
            int16_t i16[2];
            uint8_t u8[4];
            int8_t i8[4];
        } hb_var_int_t; -}
#starttype union _hb_var_int_t
#field u32 , CUInt
#field i32 , CInt
#array_field u16 , CUShort
#array_field i16 , CShort
#array_field u8 , CUChar
#array_field i8 , CSChar
#stoptype
#synonym_t hb_var_int_t , <union _hb_var_int_t>
{- typedef uint32_t hb_tag_t; -}
#synonym_t hb_tag_t , CUInt
#ccall hb_tag_from_string , CString -> CInt -> IO CUInt
#ccall hb_tag_to_string , CUInt -> CString -> IO ()
{- typedef enum {
            HB_DIRECTION_INVALID = 0,
            HB_DIRECTION_LTR = 4,
            HB_DIRECTION_RTL,
            HB_DIRECTION_TTB,
            HB_DIRECTION_BTT
        } hb_direction_t; -}
#integral_t hb_direction_t
#num HB_DIRECTION_INVALID
#num HB_DIRECTION_LTR
#num HB_DIRECTION_RTL
#num HB_DIRECTION_TTB
#num HB_DIRECTION_BTT
#ccall hb_direction_from_string , CString -> CInt -> IO <hb_direction_t>
#ccall hb_direction_to_string , <hb_direction_t> -> IO CString
{- typedef const struct hb_language_impl_t * hb_language_t; -}
#opaque_t struct hb_language_impl_t
#synonym_t hb_language_t , Ptr <struct hb_language_impl_t>
#ccall hb_language_from_string , CString -> CInt -> IO (<hb_language_t>)
#ccall hb_language_to_string , <hb_language_t> -> IO CString
#ccall hb_language_get_default , IO (<hb_language_t>)
{- typedef enum {
            HB_SCRIPT_COMMON = (hb_tag_t) ((uint8_t) 'Z' << 24 | (uint8_t) 'y' << 16 | (uint8_t) 'y' << 8 | (uint8_t) 'y'),
            HB_SCRIPT_INHERITED = (hb_tag_t) ((uint8_t) 'Z' << 24 | (uint8_t) 'i' << 16 | (uint8_t) 'n' << 8 | (uint8_t) 'h'),
            HB_SCRIPT_UNKNOWN = (hb_tag_t) ((uint8_t) 'Z' << 24 | (uint8_t) 'z' << 16 | (uint8_t) 'z' << 8 | (uint8_t) 'z'),
            HB_SCRIPT_ARABIC = (hb_tag_t) ((uint8_t) 'A' << 24 | (uint8_t) 'r' << 16 | (uint8_t) 'a' << 8 | (uint8_t) 'b'),
            HB_SCRIPT_ARMENIAN = (hb_tag_t) ((uint8_t) 'A' << 24 | (uint8_t) 'r' << 16 | (uint8_t) 'm' << 8 | (uint8_t) 'n'),
            HB_SCRIPT_BENGALI = (hb_tag_t) ((uint8_t) 'B' << 24 | (uint8_t) 'e' << 16 | (uint8_t) 'n' << 8 | (uint8_t) 'g'),
            HB_SCRIPT_CYRILLIC = (hb_tag_t) ((uint8_t) 'C' << 24 | (uint8_t) 'y' << 16 | (uint8_t) 'r' << 8 | (uint8_t) 'l'),
            HB_SCRIPT_DEVANAGARI = (hb_tag_t) ((uint8_t) 'D' << 24 | (uint8_t) 'e' << 16 | (uint8_t) 'v' << 8 | (uint8_t) 'a'),
            HB_SCRIPT_GEORGIAN = (hb_tag_t) ((uint8_t) 'G' << 24 | (uint8_t) 'e' << 16 | (uint8_t) 'o' << 8 | (uint8_t) 'r'),
            HB_SCRIPT_GREEK = (hb_tag_t) ((uint8_t) 'G' << 24 | (uint8_t) 'r' << 16 | (uint8_t) 'e' << 8 | (uint8_t) 'k'),
            HB_SCRIPT_GUJARATI = (hb_tag_t) ((uint8_t) 'G' << 24 | (uint8_t) 'u' << 16 | (uint8_t) 'j' << 8 | (uint8_t) 'r'),
            HB_SCRIPT_GURMUKHI = (hb_tag_t) ((uint8_t) 'G' << 24 | (uint8_t) 'u' << 16 | (uint8_t) 'r' << 8 | (uint8_t) 'u'),
            HB_SCRIPT_HANGUL = (hb_tag_t) ((uint8_t) 'H' << 24 | (uint8_t) 'a' << 16 | (uint8_t) 'n' << 8 | (uint8_t) 'g'),
            HB_SCRIPT_HAN = (hb_tag_t) ((uint8_t) 'H' << 24 | (uint8_t) 'a' << 16 | (uint8_t) 'n' << 8 | (uint8_t) 'i'),
            HB_SCRIPT_HEBREW = (hb_tag_t) ((uint8_t) 'H' << 24 | (uint8_t) 'e' << 16 | (uint8_t) 'b' << 8 | (uint8_t) 'r'),
            HB_SCRIPT_HIRAGANA = (hb_tag_t) ((uint8_t) 'H' << 24 | (uint8_t) 'i' << 16 | (uint8_t) 'r' << 8 | (uint8_t) 'a'),
            HB_SCRIPT_KANNADA = (hb_tag_t) ((uint8_t) 'K' << 24 | (uint8_t) 'n' << 16 | (uint8_t) 'd' << 8 | (uint8_t) 'a'),
            HB_SCRIPT_KATAKANA = (hb_tag_t) ((uint8_t) 'K' << 24 | (uint8_t) 'a' << 16 | (uint8_t) 'n' << 8 | (uint8_t) 'a'),
            HB_SCRIPT_LAO = (hb_tag_t) ((uint8_t) 'L' << 24 | (uint8_t) 'a' << 16 | (uint8_t) 'o' << 8 | (uint8_t) 'o'),
            HB_SCRIPT_LATIN = (hb_tag_t) ((uint8_t) 'L' << 24 | (uint8_t) 'a' << 16 | (uint8_t) 't' << 8 | (uint8_t) 'n'),
            HB_SCRIPT_MALAYALAM = (hb_tag_t) ((uint8_t) 'M' << 24 | (uint8_t) 'l' << 16 | (uint8_t) 'y' << 8 | (uint8_t) 'm'),
            HB_SCRIPT_ORIYA = (hb_tag_t) ((uint8_t) 'O' << 24 | (uint8_t) 'r' << 16 | (uint8_t) 'y' << 8 | (uint8_t) 'a'),
            HB_SCRIPT_TAMIL = (hb_tag_t) ((uint8_t) 'T' << 24 | (uint8_t) 'a' << 16 | (uint8_t) 'm' << 8 | (uint8_t) 'l'),
            HB_SCRIPT_TELUGU = (hb_tag_t) ((uint8_t) 'T' << 24 | (uint8_t) 'e' << 16 | (uint8_t) 'l' << 8 | (uint8_t) 'u'),
            HB_SCRIPT_THAI = (hb_tag_t) ((uint8_t) 'T' << 24 | (uint8_t) 'h' << 16 | (uint8_t) 'a' << 8 | (uint8_t) 'i'),
            HB_SCRIPT_TIBETAN = (hb_tag_t) ((uint8_t) 'T' << 24 | (uint8_t) 'i' << 16 | (uint8_t) 'b' << 8 | (uint8_t) 't'),
            HB_SCRIPT_BOPOMOFO = (hb_tag_t) ((uint8_t) 'B' << 24 | (uint8_t) 'o' << 16 | (uint8_t) 'p' << 8 | (uint8_t) 'o'),
            HB_SCRIPT_BRAILLE = (hb_tag_t) ((uint8_t) 'B' << 24 | (uint8_t) 'r' << 16 | (uint8_t) 'a' << 8 | (uint8_t) 'i'),
            HB_SCRIPT_CANADIAN_SYLLABICS = (hb_tag_t) ((uint8_t) 'C' << 24 | (uint8_t) 'a' << 16 | (uint8_t) 'n' << 8 | (uint8_t) 's'),
            HB_SCRIPT_CHEROKEE = (hb_tag_t) ((uint8_t) 'C' << 24 | (uint8_t) 'h' << 16 | (uint8_t) 'e' << 8 | (uint8_t) 'r'),
            HB_SCRIPT_ETHIOPIC = (hb_tag_t) ((uint8_t) 'E' << 24 | (uint8_t) 't' << 16 | (uint8_t) 'h' << 8 | (uint8_t) 'i'),
            HB_SCRIPT_KHMER = (hb_tag_t) ((uint8_t) 'K' << 24 | (uint8_t) 'h' << 16 | (uint8_t) 'm' << 8 | (uint8_t) 'r'),
            HB_SCRIPT_MONGOLIAN = (hb_tag_t) ((uint8_t) 'M' << 24 | (uint8_t) 'o' << 16 | (uint8_t) 'n' << 8 | (uint8_t) 'g'),
            HB_SCRIPT_MYANMAR = (hb_tag_t) ((uint8_t) 'M' << 24 | (uint8_t) 'y' << 16 | (uint8_t) 'm' << 8 | (uint8_t) 'r'),
            HB_SCRIPT_OGHAM = (hb_tag_t) ((uint8_t) 'O' << 24 | (uint8_t) 'g' << 16 | (uint8_t) 'a' << 8 | (uint8_t) 'm'),
            HB_SCRIPT_RUNIC = (hb_tag_t) ((uint8_t) 'R' << 24 | (uint8_t) 'u' << 16 | (uint8_t) 'n' << 8 | (uint8_t) 'r'),
            HB_SCRIPT_SINHALA = (hb_tag_t) ((uint8_t) 'S' << 24 | (uint8_t) 'i' << 16 | (uint8_t) 'n' << 8 | (uint8_t) 'h'),
            HB_SCRIPT_SYRIAC = (hb_tag_t) ((uint8_t) 'S' << 24 | (uint8_t) 'y' << 16 | (uint8_t) 'r' << 8 | (uint8_t) 'c'),
            HB_SCRIPT_THAANA = (hb_tag_t) ((uint8_t) 'T' << 24 | (uint8_t) 'h' << 16 | (uint8_t) 'a' << 8 | (uint8_t) 'a'),
            HB_SCRIPT_YI = (hb_tag_t) ((uint8_t) 'Y' << 24 | (uint8_t) 'i' << 16 | (uint8_t) 'i' << 8 | (uint8_t) 'i'),
            HB_SCRIPT_DESERET = (hb_tag_t) ((uint8_t) 'D' << 24 | (uint8_t) 's' << 16 | (uint8_t) 'r' << 8 | (uint8_t) 't'),
            HB_SCRIPT_GOTHIC = (hb_tag_t) ((uint8_t) 'G' << 24 | (uint8_t) 'o' << 16 | (uint8_t) 't' << 8 | (uint8_t) 'h'),
            HB_SCRIPT_OLD_ITALIC = (hb_tag_t) ((uint8_t) 'I' << 24 | (uint8_t) 't' << 16 | (uint8_t) 'a' << 8 | (uint8_t) 'l'),
            HB_SCRIPT_BUHID = (hb_tag_t) ((uint8_t) 'B' << 24 | (uint8_t) 'u' << 16 | (uint8_t) 'h' << 8 | (uint8_t) 'd'),
            HB_SCRIPT_HANUNOO = (hb_tag_t) ((uint8_t) 'H' << 24 | (uint8_t) 'a' << 16 | (uint8_t) 'n' << 8 | (uint8_t) 'o'),
            HB_SCRIPT_TAGALOG = (hb_tag_t) ((uint8_t) 'T' << 24 | (uint8_t) 'g' << 16 | (uint8_t) 'l' << 8 | (uint8_t) 'g'),
            HB_SCRIPT_TAGBANWA = (hb_tag_t) ((uint8_t) 'T' << 24 | (uint8_t) 'a' << 16 | (uint8_t) 'g' << 8 | (uint8_t) 'b'),
            HB_SCRIPT_CYPRIOT = (hb_tag_t) ((uint8_t) 'C' << 24 | (uint8_t) 'p' << 16 | (uint8_t) 'r' << 8 | (uint8_t) 't'),
            HB_SCRIPT_LIMBU = (hb_tag_t) ((uint8_t) 'L' << 24 | (uint8_t) 'i' << 16 | (uint8_t) 'm' << 8 | (uint8_t) 'b'),
            HB_SCRIPT_LINEAR_B = (hb_tag_t) ((uint8_t) 'L' << 24 | (uint8_t) 'i' << 16 | (uint8_t) 'n' << 8 | (uint8_t) 'b'),
            HB_SCRIPT_OSMANYA = (hb_tag_t) ((uint8_t) 'O' << 24 | (uint8_t) 's' << 16 | (uint8_t) 'm' << 8 | (uint8_t) 'a'),
            HB_SCRIPT_SHAVIAN = (hb_tag_t) ((uint8_t) 'S' << 24 | (uint8_t) 'h' << 16 | (uint8_t) 'a' << 8 | (uint8_t) 'w'),
            HB_SCRIPT_TAI_LE = (hb_tag_t) ((uint8_t) 'T' << 24 | (uint8_t) 'a' << 16 | (uint8_t) 'l' << 8 | (uint8_t) 'e'),
            HB_SCRIPT_UGARITIC = (hb_tag_t) ((uint8_t) 'U' << 24 | (uint8_t) 'g' << 16 | (uint8_t) 'a' << 8 | (uint8_t) 'r'),
            HB_SCRIPT_BUGINESE = (hb_tag_t) ((uint8_t) 'B' << 24 | (uint8_t) 'u' << 16 | (uint8_t) 'g' << 8 | (uint8_t) 'i'),
            HB_SCRIPT_COPTIC = (hb_tag_t) ((uint8_t) 'C' << 24 | (uint8_t) 'o' << 16 | (uint8_t) 'p' << 8 | (uint8_t) 't'),
            HB_SCRIPT_GLAGOLITIC = (hb_tag_t) ((uint8_t) 'G' << 24 | (uint8_t) 'l' << 16 | (uint8_t) 'a' << 8 | (uint8_t) 'g'),
            HB_SCRIPT_KHAROSHTHI = (hb_tag_t) ((uint8_t) 'K' << 24 | (uint8_t) 'h' << 16 | (uint8_t) 'a' << 8 | (uint8_t) 'r'),
            HB_SCRIPT_NEW_TAI_LUE = (hb_tag_t) ((uint8_t) 'T' << 24 | (uint8_t) 'a' << 16 | (uint8_t) 'l' << 8 | (uint8_t) 'u'),
            HB_SCRIPT_OLD_PERSIAN = (hb_tag_t) ((uint8_t) 'X' << 24 | (uint8_t) 'p' << 16 | (uint8_t) 'e' << 8 | (uint8_t) 'o'),
            HB_SCRIPT_SYLOTI_NAGRI = (hb_tag_t) ((uint8_t) 'S' << 24 | (uint8_t) 'y' << 16 | (uint8_t) 'l' << 8 | (uint8_t) 'o'),
            HB_SCRIPT_TIFINAGH = (hb_tag_t) ((uint8_t) 'T' << 24 | (uint8_t) 'f' << 16 | (uint8_t) 'n' << 8 | (uint8_t) 'g'),
            HB_SCRIPT_BALINESE = (hb_tag_t) ((uint8_t) 'B' << 24 | (uint8_t) 'a' << 16 | (uint8_t) 'l' << 8 | (uint8_t) 'i'),
            HB_SCRIPT_CUNEIFORM = (hb_tag_t) ((uint8_t) 'X' << 24 | (uint8_t) 's' << 16 | (uint8_t) 'u' << 8 | (uint8_t) 'x'),
            HB_SCRIPT_NKO = (hb_tag_t) ((uint8_t) 'N' << 24 | (uint8_t) 'k' << 16 | (uint8_t) 'o' << 8 | (uint8_t) 'o'),
            HB_SCRIPT_PHAGS_PA = (hb_tag_t) ((uint8_t) 'P' << 24 | (uint8_t) 'h' << 16 | (uint8_t) 'a' << 8 | (uint8_t) 'g'),
            HB_SCRIPT_PHOENICIAN = (hb_tag_t) ((uint8_t) 'P' << 24 | (uint8_t) 'h' << 16 | (uint8_t) 'n' << 8 | (uint8_t) 'x'),
            HB_SCRIPT_CARIAN = (hb_tag_t) ((uint8_t) 'C' << 24 | (uint8_t) 'a' << 16 | (uint8_t) 'r' << 8 | (uint8_t) 'i'),
            HB_SCRIPT_CHAM = (hb_tag_t) ((uint8_t) 'C' << 24 | (uint8_t) 'h' << 16 | (uint8_t) 'a' << 8 | (uint8_t) 'm'),
            HB_SCRIPT_KAYAH_LI = (hb_tag_t) ((uint8_t) 'K' << 24 | (uint8_t) 'a' << 16 | (uint8_t) 'l' << 8 | (uint8_t) 'i'),
            HB_SCRIPT_LEPCHA = (hb_tag_t) ((uint8_t) 'L' << 24 | (uint8_t) 'e' << 16 | (uint8_t) 'p' << 8 | (uint8_t) 'c'),
            HB_SCRIPT_LYCIAN = (hb_tag_t) ((uint8_t) 'L' << 24 | (uint8_t) 'y' << 16 | (uint8_t) 'c' << 8 | (uint8_t) 'i'),
            HB_SCRIPT_LYDIAN = (hb_tag_t) ((uint8_t) 'L' << 24 | (uint8_t) 'y' << 16 | (uint8_t) 'd' << 8 | (uint8_t) 'i'),
            HB_SCRIPT_OL_CHIKI = (hb_tag_t) ((uint8_t) 'O' << 24 | (uint8_t) 'l' << 16 | (uint8_t) 'c' << 8 | (uint8_t) 'k'),
            HB_SCRIPT_REJANG = (hb_tag_t) ((uint8_t) 'R' << 24 | (uint8_t) 'j' << 16 | (uint8_t) 'n' << 8 | (uint8_t) 'g'),
            HB_SCRIPT_SAURASHTRA = (hb_tag_t) ((uint8_t) 'S' << 24 | (uint8_t) 'a' << 16 | (uint8_t) 'u' << 8 | (uint8_t) 'r'),
            HB_SCRIPT_SUNDANESE = (hb_tag_t) ((uint8_t) 'S' << 24 | (uint8_t) 'u' << 16 | (uint8_t) 'n' << 8 | (uint8_t) 'd'),
            HB_SCRIPT_VAI = (hb_tag_t) ((uint8_t) 'V' << 24 | (uint8_t) 'a' << 16 | (uint8_t) 'i' << 8 | (uint8_t) 'i'),
            HB_SCRIPT_AVESTAN = (hb_tag_t) ((uint8_t) 'A' << 24 | (uint8_t) 'v' << 16 | (uint8_t) 's' << 8 | (uint8_t) 't'),
            HB_SCRIPT_BAMUM = (hb_tag_t) ((uint8_t) 'B' << 24 | (uint8_t) 'a' << 16 | (uint8_t) 'm' << 8 | (uint8_t) 'u'),
            HB_SCRIPT_EGYPTIAN_HIEROGLYPHS = (hb_tag_t) ((uint8_t) 'E' << 24 | (uint8_t) 'g' << 16 | (uint8_t) 'y' << 8 | (uint8_t) 'p'),
            HB_SCRIPT_IMPERIAL_ARAMAIC = (hb_tag_t) ((uint8_t) 'A' << 24 | (uint8_t) 'r' << 16 | (uint8_t) 'm' << 8 | (uint8_t) 'i'),
            HB_SCRIPT_INSCRIPTIONAL_PAHLAVI = (hb_tag_t) ((uint8_t) 'P' << 24 | (uint8_t) 'h' << 16 | (uint8_t) 'l' << 8 | (uint8_t) 'i'),
            HB_SCRIPT_INSCRIPTIONAL_PARTHIAN = (hb_tag_t) ((uint8_t) 'P' << 24 | (uint8_t) 'r' << 16 | (uint8_t) 't' << 8 | (uint8_t) 'i'),
            HB_SCRIPT_JAVANESE = (hb_tag_t) ((uint8_t) 'J' << 24 | (uint8_t) 'a' << 16 | (uint8_t) 'v' << 8 | (uint8_t) 'a'),
            HB_SCRIPT_KAITHI = (hb_tag_t) ((uint8_t) 'K' << 24 | (uint8_t) 't' << 16 | (uint8_t) 'h' << 8 | (uint8_t) 'i'),
            HB_SCRIPT_LISU = (hb_tag_t) ((uint8_t) 'L' << 24 | (uint8_t) 'i' << 16 | (uint8_t) 's' << 8 | (uint8_t) 'u'),
            HB_SCRIPT_MEETEI_MAYEK = (hb_tag_t) ((uint8_t) 'M' << 24 | (uint8_t) 't' << 16 | (uint8_t) 'e' << 8 | (uint8_t) 'i'),
            HB_SCRIPT_OLD_SOUTH_ARABIAN = (hb_tag_t) ((uint8_t) 'S' << 24 | (uint8_t) 'a' << 16 | (uint8_t) 'r' << 8 | (uint8_t) 'b'),
            HB_SCRIPT_OLD_TURKIC = (hb_tag_t) ((uint8_t) 'O' << 24 | (uint8_t) 'r' << 16 | (uint8_t) 'k' << 8 | (uint8_t) 'h'),
            HB_SCRIPT_SAMARITAN = (hb_tag_t) ((uint8_t) 'S' << 24 | (uint8_t) 'a' << 16 | (uint8_t) 'm' << 8 | (uint8_t) 'r'),
            HB_SCRIPT_TAI_THAM = (hb_tag_t) ((uint8_t) 'L' << 24 | (uint8_t) 'a' << 16 | (uint8_t) 'n' << 8 | (uint8_t) 'a'),
            HB_SCRIPT_TAI_VIET = (hb_tag_t) ((uint8_t) 'T' << 24 | (uint8_t) 'a' << 16 | (uint8_t) 'v' << 8 | (uint8_t) 't'),
            HB_SCRIPT_BATAK = (hb_tag_t) ((uint8_t) 'B' << 24 | (uint8_t) 'a' << 16 | (uint8_t) 't' << 8 | (uint8_t) 'k'),
            HB_SCRIPT_BRAHMI = (hb_tag_t) ((uint8_t) 'B' << 24 | (uint8_t) 'r' << 16 | (uint8_t) 'a' << 8 | (uint8_t) 'h'),
            HB_SCRIPT_MANDAIC = (hb_tag_t) ((uint8_t) 'M' << 24 | (uint8_t) 'a' << 16 | (uint8_t) 'n' << 8 | (uint8_t) 'd'),
            HB_SCRIPT_CHAKMA = (hb_tag_t) ((uint8_t) 'C' << 24 | (uint8_t) 'a' << 16 | (uint8_t) 'k' << 8 | (uint8_t) 'm'),
            HB_SCRIPT_MEROITIC_CURSIVE = (hb_tag_t) ((uint8_t) 'M' << 24 | (uint8_t) 'e' << 16 | (uint8_t) 'r' << 8 | (uint8_t) 'c'),
            HB_SCRIPT_MEROITIC_HIEROGLYPHS = (hb_tag_t) ((uint8_t) 'M' << 24 | (uint8_t) 'e' << 16 | (uint8_t) 'r' << 8 | (uint8_t) 'o'),
            HB_SCRIPT_MIAO = (hb_tag_t) ((uint8_t) 'P' << 24 | (uint8_t) 'l' << 16 | (uint8_t) 'r' << 8 | (uint8_t) 'd'),
            HB_SCRIPT_SHARADA = (hb_tag_t) ((uint8_t) 'S' << 24 | (uint8_t) 'h' << 16 | (uint8_t) 'r' << 8 | (uint8_t) 'd'),
            HB_SCRIPT_SORA_SOMPENG = (hb_tag_t) ((uint8_t) 'S' << 24 | (uint8_t) 'o' << 16 | (uint8_t) 'r' << 8 | (uint8_t) 'a'),
            HB_SCRIPT_TAKRI = (hb_tag_t) ((uint8_t) 'T' << 24 | (uint8_t) 'a' << 16 | (uint8_t) 'k' << 8 | (uint8_t) 'r'),
            HB_SCRIPT_BASSA_VAH = (hb_tag_t) ((uint8_t) 'B' << 24 | (uint8_t) 'a' << 16 | (uint8_t) 's' << 8 | (uint8_t) 's'),
            HB_SCRIPT_CAUCASIAN_ALBANIAN = (hb_tag_t) ((uint8_t) 'A' << 24 | (uint8_t) 'g' << 16 | (uint8_t) 'h' << 8 | (uint8_t) 'b'),
            HB_SCRIPT_DUPLOYAN = (hb_tag_t) ((uint8_t) 'D' << 24 | (uint8_t) 'u' << 16 | (uint8_t) 'p' << 8 | (uint8_t) 'l'),
            HB_SCRIPT_ELBASAN = (hb_tag_t) ((uint8_t) 'E' << 24 | (uint8_t) 'l' << 16 | (uint8_t) 'b' << 8 | (uint8_t) 'a'),
            HB_SCRIPT_GRANTHA = (hb_tag_t) ((uint8_t) 'G' << 24 | (uint8_t) 'r' << 16 | (uint8_t) 'a' << 8 | (uint8_t) 'n'),
            HB_SCRIPT_KHOJKI = (hb_tag_t) ((uint8_t) 'K' << 24 | (uint8_t) 'h' << 16 | (uint8_t) 'o' << 8 | (uint8_t) 'j'),
            HB_SCRIPT_KHUDAWADI = (hb_tag_t) ((uint8_t) 'S' << 24 | (uint8_t) 'i' << 16 | (uint8_t) 'n' << 8 | (uint8_t) 'd'),
            HB_SCRIPT_LINEAR_A = (hb_tag_t) ((uint8_t) 'L' << 24 | (uint8_t) 'i' << 16 | (uint8_t) 'n' << 8 | (uint8_t) 'a'),
            HB_SCRIPT_MAHAJANI = (hb_tag_t) ((uint8_t) 'M' << 24 | (uint8_t) 'a' << 16 | (uint8_t) 'h' << 8 | (uint8_t) 'j'),
            HB_SCRIPT_MANICHAEAN = (hb_tag_t) ((uint8_t) 'M' << 24 | (uint8_t) 'a' << 16 | (uint8_t) 'n' << 8 | (uint8_t) 'i'),
            HB_SCRIPT_MENDE_KIKAKUI = (hb_tag_t) ((uint8_t) 'M' << 24 | (uint8_t) 'e' << 16 | (uint8_t) 'n' << 8 | (uint8_t) 'd'),
            HB_SCRIPT_MODI = (hb_tag_t) ((uint8_t) 'M' << 24 | (uint8_t) 'o' << 16 | (uint8_t) 'd' << 8 | (uint8_t) 'i'),
            HB_SCRIPT_MRO = (hb_tag_t) ((uint8_t) 'M' << 24 | (uint8_t) 'r' << 16 | (uint8_t) 'o' << 8 | (uint8_t) 'o'),
            HB_SCRIPT_NABATAEAN = (hb_tag_t) ((uint8_t) 'N' << 24 | (uint8_t) 'b' << 16 | (uint8_t) 'a' << 8 | (uint8_t) 't'),
            HB_SCRIPT_OLD_NORTH_ARABIAN = (hb_tag_t) ((uint8_t) 'N' << 24 | (uint8_t) 'a' << 16 | (uint8_t) 'r' << 8 | (uint8_t) 'b'),
            HB_SCRIPT_OLD_PERMIC = (hb_tag_t) ((uint8_t) 'P' << 24 | (uint8_t) 'e' << 16 | (uint8_t) 'r' << 8 | (uint8_t) 'm'),
            HB_SCRIPT_PAHAWH_HMONG = (hb_tag_t) ((uint8_t) 'H' << 24 | (uint8_t) 'm' << 16 | (uint8_t) 'n' << 8 | (uint8_t) 'g'),
            HB_SCRIPT_PALMYRENE = (hb_tag_t) ((uint8_t) 'P' << 24 | (uint8_t) 'a' << 16 | (uint8_t) 'l' << 8 | (uint8_t) 'm'),
            HB_SCRIPT_PAU_CIN_HAU = (hb_tag_t) ((uint8_t) 'P' << 24 | (uint8_t) 'a' << 16 | (uint8_t) 'u' << 8 | (uint8_t) 'c'),
            HB_SCRIPT_PSALTER_PAHLAVI = (hb_tag_t) ((uint8_t) 'P' << 24 | (uint8_t) 'h' << 16 | (uint8_t) 'l' << 8 | (uint8_t) 'p'),
            HB_SCRIPT_SIDDHAM = (hb_tag_t) ((uint8_t) 'S' << 24 | (uint8_t) 'i' << 16 | (uint8_t) 'd' << 8 | (uint8_t) 'd'),
            HB_SCRIPT_TIRHUTA = (hb_tag_t) ((uint8_t) 'T' << 24 | (uint8_t) 'i' << 16 | (uint8_t) 'r' << 8 | (uint8_t) 'h'),
            HB_SCRIPT_WARANG_CITI = (hb_tag_t) ((uint8_t) 'W' << 24 | (uint8_t) 'a' << 16 | (uint8_t) 'r' << 8 | (uint8_t) 'a'),
            HB_SCRIPT_INVALID = (hb_tag_t) ((uint8_t) 0 << 24 | (uint8_t) 0 << 16 | (uint8_t) 0 << 8 | (uint8_t) 0),
            _HB_SCRIPT_MAX_VALUE = (hb_tag_t) ((uint8_t) 0xff << 24 | (uint8_t) 0xff << 16 | (uint8_t) 0xff << 8 | (uint8_t) 0xff)
        } hb_script_t; -}
#integral_t hb_script_t
#num HB_SCRIPT_COMMON
#num HB_SCRIPT_INHERITED
#num HB_SCRIPT_UNKNOWN
#num HB_SCRIPT_ARABIC
#num HB_SCRIPT_ARMENIAN
#num HB_SCRIPT_BENGALI
#num HB_SCRIPT_CYRILLIC
#num HB_SCRIPT_DEVANAGARI
#num HB_SCRIPT_GEORGIAN
#num HB_SCRIPT_GREEK
#num HB_SCRIPT_GUJARATI
#num HB_SCRIPT_GURMUKHI
#num HB_SCRIPT_HANGUL
#num HB_SCRIPT_HAN
#num HB_SCRIPT_HEBREW
#num HB_SCRIPT_HIRAGANA
#num HB_SCRIPT_KANNADA
#num HB_SCRIPT_KATAKANA
#num HB_SCRIPT_LAO
#num HB_SCRIPT_LATIN
#num HB_SCRIPT_MALAYALAM
#num HB_SCRIPT_ORIYA
#num HB_SCRIPT_TAMIL
#num HB_SCRIPT_TELUGU
#num HB_SCRIPT_THAI
#num HB_SCRIPT_TIBETAN
#num HB_SCRIPT_BOPOMOFO
#num HB_SCRIPT_BRAILLE
#num HB_SCRIPT_CANADIAN_SYLLABICS
#num HB_SCRIPT_CHEROKEE
#num HB_SCRIPT_ETHIOPIC
#num HB_SCRIPT_KHMER
#num HB_SCRIPT_MONGOLIAN
#num HB_SCRIPT_MYANMAR
#num HB_SCRIPT_OGHAM
#num HB_SCRIPT_RUNIC
#num HB_SCRIPT_SINHALA
#num HB_SCRIPT_SYRIAC
#num HB_SCRIPT_THAANA
#num HB_SCRIPT_YI
#num HB_SCRIPT_DESERET
#num HB_SCRIPT_GOTHIC
#num HB_SCRIPT_OLD_ITALIC
#num HB_SCRIPT_BUHID
#num HB_SCRIPT_HANUNOO
#num HB_SCRIPT_TAGALOG
#num HB_SCRIPT_TAGBANWA
#num HB_SCRIPT_CYPRIOT
#num HB_SCRIPT_LIMBU
#num HB_SCRIPT_LINEAR_B
#num HB_SCRIPT_OSMANYA
#num HB_SCRIPT_SHAVIAN
#num HB_SCRIPT_TAI_LE
#num HB_SCRIPT_UGARITIC
#num HB_SCRIPT_BUGINESE
#num HB_SCRIPT_COPTIC
#num HB_SCRIPT_GLAGOLITIC
#num HB_SCRIPT_KHAROSHTHI
#num HB_SCRIPT_NEW_TAI_LUE
#num HB_SCRIPT_OLD_PERSIAN
#num HB_SCRIPT_SYLOTI_NAGRI
#num HB_SCRIPT_TIFINAGH
#num HB_SCRIPT_BALINESE
#num HB_SCRIPT_CUNEIFORM
#num HB_SCRIPT_NKO
#num HB_SCRIPT_PHAGS_PA
#num HB_SCRIPT_PHOENICIAN
#num HB_SCRIPT_CARIAN
#num HB_SCRIPT_CHAM
#num HB_SCRIPT_KAYAH_LI
#num HB_SCRIPT_LEPCHA
#num HB_SCRIPT_LYCIAN
#num HB_SCRIPT_LYDIAN
#num HB_SCRIPT_OL_CHIKI
#num HB_SCRIPT_REJANG
#num HB_SCRIPT_SAURASHTRA
#num HB_SCRIPT_SUNDANESE
#num HB_SCRIPT_VAI
#num HB_SCRIPT_AVESTAN
#num HB_SCRIPT_BAMUM
#num HB_SCRIPT_EGYPTIAN_HIEROGLYPHS
#num HB_SCRIPT_IMPERIAL_ARAMAIC
#num HB_SCRIPT_INSCRIPTIONAL_PAHLAVI
#num HB_SCRIPT_INSCRIPTIONAL_PARTHIAN
#num HB_SCRIPT_JAVANESE
#num HB_SCRIPT_KAITHI
#num HB_SCRIPT_LISU
#num HB_SCRIPT_MEETEI_MAYEK
#num HB_SCRIPT_OLD_SOUTH_ARABIAN
#num HB_SCRIPT_OLD_TURKIC
#num HB_SCRIPT_SAMARITAN
#num HB_SCRIPT_TAI_THAM
#num HB_SCRIPT_TAI_VIET
#num HB_SCRIPT_BATAK
#num HB_SCRIPT_BRAHMI
#num HB_SCRIPT_MANDAIC
#num HB_SCRIPT_CHAKMA
#num HB_SCRIPT_MEROITIC_CURSIVE
#num HB_SCRIPT_MEROITIC_HIEROGLYPHS
#num HB_SCRIPT_MIAO
#num HB_SCRIPT_SHARADA
#num HB_SCRIPT_SORA_SOMPENG
#num HB_SCRIPT_TAKRI
#num HB_SCRIPT_BASSA_VAH
#num HB_SCRIPT_CAUCASIAN_ALBANIAN
#num HB_SCRIPT_DUPLOYAN
#num HB_SCRIPT_ELBASAN
#num HB_SCRIPT_GRANTHA
#num HB_SCRIPT_KHOJKI
#num HB_SCRIPT_KHUDAWADI
#num HB_SCRIPT_LINEAR_A
#num HB_SCRIPT_MAHAJANI
#num HB_SCRIPT_MANICHAEAN
#num HB_SCRIPT_MENDE_KIKAKUI
#num HB_SCRIPT_MODI
#num HB_SCRIPT_MRO
#num HB_SCRIPT_NABATAEAN
#num HB_SCRIPT_OLD_NORTH_ARABIAN
#num HB_SCRIPT_OLD_PERMIC
#num HB_SCRIPT_PAHAWH_HMONG
#num HB_SCRIPT_PALMYRENE
#num HB_SCRIPT_PAU_CIN_HAU
#num HB_SCRIPT_PSALTER_PAHLAVI
#num HB_SCRIPT_SIDDHAM
#num HB_SCRIPT_TIRHUTA
#num HB_SCRIPT_WARANG_CITI
#num HB_SCRIPT_INVALID
#num _HB_SCRIPT_MAX_VALUE
#ccall hb_script_from_iso15924_tag , CUInt -> IO <hb_script_t>
#ccall hb_script_from_string , CString -> CInt -> IO <hb_script_t>
#ccall hb_script_to_iso15924_tag , <hb_script_t> -> IO CUInt
#ccall hb_script_get_horizontal_direction , <hb_script_t> -> IO <hb_direction_t>
{- typedef struct hb_user_data_key_t {
            char unused;
        } hb_user_data_key_t; -}
#starttype struct hb_user_data_key_t
#field unused , CChar
#stoptype
-- #synonym_t hb_user_data_key_t , <struct hb_user_data_key_t>
#callback hb_destroy_func_t , Ptr () -> IO ()
