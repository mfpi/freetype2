{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include "harfbuzz/hb.h"
module Bindings.Harfbuzz.HbIcu where
import Foreign.Ptr
#strict_import

import Bindings.Harfbuzz.Hb
#ccall hb_icu_script_to_script , <enum UScriptCode> -> IO <hb_script_t>
#ccall hb_icu_script_from_script , <hb_script_t> -> IO (<enum UScriptCode>)
#ccall hb_icu_get_unicode_funcs , IO (Ptr <struct hb_unicode_funcs_t>)
