{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include "harfbuzz/hb.h"
module Bindings.Harfbuzz.HbGlib where
import Foreign.Ptr
#strict_import

import Bindings.Harfbuzz.Hb
#ccall hb_glib_script_to_script , <GUnicodeScript> -> IO <hb_script_t>
#ccall hb_glib_script_from_script , <hb_script_t> -> IO <GUnicodeScript>
#ccall hb_glib_get_unicode_funcs , IO (Ptr <struct hb_unicode_funcs_t>)
