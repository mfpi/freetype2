{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include "harfbuzz/hb.h"
module Bindings.Harfbuzz.HbOtFont where
import Foreign.Ptr
#strict_import

import Bindings.Harfbuzz.Hb
#ccall hb_ot_font_set_funcs , Ptr <struct hb_font_t> -> IO ()
