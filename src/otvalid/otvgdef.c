/***************************************************************************/
/*                                                                         */
/*  otvgdef.c                                                              */
/*                                                                         */
/*    OpenType GDEF table validation (body).                               */
/*                                                                         */
/*  Copyright 2004 by                                                      */
/*  David Turner, Robert Wilhelm, and Werner Lemberg.                      */
/*                                                                         */
/*  This file is part of the FreeType project, and may only be used,       */
/*  modified, and distributed under the terms of the FreeType project      */
/*  license, LICENSE.TXT.  By continuing to use, modify, or distribute     */
/*  this file you indicate that you have read the license and              */
/*  understand and accept it fully.                                        */
/*                                                                         */
/***************************************************************************/


#include "otvalid.h"
#include "otvcommn.h"


  /*************************************************************************/
  /*                                                                       */
  /* The macro FT_COMPONENT is used in trace mode.  It is an implicit      */
  /* parameter of the FT_TRACE() and FT_ERROR() macros, used to print/log  */
  /* messages during execution.                                            */
  /*                                                                       */
#undef  FT_COMPONENT
#define FT_COMPONENT  trace_otvgdef


  /*************************************************************************/
  /*************************************************************************/
  /*****                                                               *****/
  /*****                      UTILITY FUNCTIONS                        *****/
  /*****                                                               *****/
  /*************************************************************************/
  /*************************************************************************/

#define AttachList    otv_O_x_Ox, "AttachList"
#define LigCaretList  otv_O_x_Ox, "LigCaretList"

  /* sets valid->extra1 (0)           */

  static void
  otv_O_x_Ox( FT_Bytes       table,
              OTV_Validator  valid )
  {
    FT_Bytes           p = table;
    FT_Bytes           Coverage;
    FT_UInt            GlyphCount;
    OTV_Validate_Func  func;


    OTV_ENTER;

    OTV_LIMIT_CHECK( 4 );
    Coverage   = table + FT_NEXT_USHORT( p );
    GlyphCount = FT_NEXT_USHORT( p );

    OTV_TRACE(( " (GlyphCount = %d)\n", GlyphCount ));

    otv_Coverage_validate( Coverage, valid );
    if ( GlyphCount != otv_Coverage_get_count( Coverage ) )
      FT_INVALID_DATA;

    OTV_LIMIT_CHECK( GlyphCount * 2 );

    valid->nesting_level++;
    func          = valid->func[valid->nesting_level];
    valid->extra1 = 0;

    for ( ; GlyphCount > 0; GlyphCount-- )
      func( table + FT_NEXT_USHORT( p ), valid );

    valid->nesting_level--;

    OTV_EXIT;
  }


  /*************************************************************************/
  /*************************************************************************/
  /*****                                                               *****/
  /*****                       LIGATURE CARETS                         *****/
  /*****                                                               *****/
  /*************************************************************************/
  /*************************************************************************/

#define  CaretValue  otv_CaretValue_validate, "CaretValue"

  static void
  otv_CaretValue_validate( FT_Bytes       table,
                           OTV_Validator  valid )
  {
    FT_Bytes  p = table;
    FT_UInt   CaretValueFormat;


    OTV_ENTER;

    OTV_LIMIT_CHECK( 4 );

    CaretValueFormat = FT_NEXT_USHORT( p );

    OTV_TRACE(( " (format = %d)\n", CaretValueFormat ));

    switch ( CaretValueFormat )
    {
    case 1:     /* CaretValueFormat1 */
      /* skip Coordinate, no test */
      break;

    case 2:     /* CaretValueFormat2 */
      /* skip CaretValuePoint, no test */
      break;

    case 3:     /* CaretValueFormat3 */
      p += 2;   /* skip Coordinate */

      OTV_LIMIT_CHECK( 2 );

      /* DeviceTable */
      otv_Device_validate( table + FT_NEXT_USHORT( p ), valid );
      break;

    default:
      FT_INVALID_DATA;
    }

    OTV_EXIT;
  }


  /*************************************************************************/
  /*************************************************************************/
  /*****                                                               *****/
  /*****                         GDEF TABLE                            *****/
  /*****                                                               *****/
  /*************************************************************************/
  /*************************************************************************/

  FT_LOCAL_DEF( void )
  otv_GDEF_validate( FT_Bytes      table,
                     FT_Bytes      gsub,
                     FT_Bytes      gpos,
                     FT_Validator  ftvalid )
  {
    OTV_ValidatorRec  validrec;
    OTV_Validator     valid = &validrec;
    FT_Bytes          p     = table;
    FT_UInt           table_size;
    FT_Bool           need_MarkAttachClassDef;

    OTV_OPTIONAL_TABLE( GlyphClassDef );
    OTV_OPTIONAL_TABLE( AttachListOffset );
    OTV_OPTIONAL_TABLE( LigCaretListOffset );
    OTV_OPTIONAL_TABLE( MarkAttachClassDef );


    valid->root = ftvalid;

    FT_TRACE3(( "validating GDEF table\n" ));
    OTV_INIT;

    OTV_LIMIT_CHECK( 12 );

    if ( FT_NEXT_ULONG( p ) != 0x10000UL )          /* Version */
      FT_INVALID_FORMAT;

    /* MarkAttachClassDef has been added to the OpenType */
    /* specification without increasing GDEF's version,  */
    /* so we use this ugly hack to find out whether the  */
    /* table is needed actually.                         */

    need_MarkAttachClassDef =
      otv_GSUBGPOS_have_MarkAttachmentType_flag( gsub ) ||
      otv_GSUBGPOS_have_MarkAttachmentType_flag( gpos );

    if ( need_MarkAttachClassDef )
      table_size = 12;              /* OpenType >= 1.2 */
    else
      table_size = 10;              /* OpenType < 1.2  */

    OTV_OPTIONAL_OFFSET( GlyphClassDef );
    OTV_SIZE_CHECK( GlyphClassDef );
    if ( GlyphClassDef )
      otv_ClassDef_validate( table + GlyphClassDef, valid );

    OTV_OPTIONAL_OFFSET( AttachListOffset );
    OTV_SIZE_CHECK( AttachListOffset );
    if ( AttachListOffset )
    {
      OTV_NEST2( AttachList, AttachPoint );
      OTV_RUN( table + AttachListOffset, valid );
    }

    OTV_OPTIONAL_OFFSET( LigCaretListOffset );
    OTV_SIZE_CHECK( LigCaretListOffset );
    if ( LigCaretListOffset )
    {
      OTV_NEST3( LigCaretList, LigGlyph, CaretValue );
      OTV_RUN( table + LigCaretListOffset, valid );
    }

    if ( need_MarkAttachClassDef )
    {
      OTV_OPTIONAL_OFFSET( MarkAttachClassDef );
      OTV_SIZE_CHECK( MarkAttachClassDef );
      if ( MarkAttachClassDef )
        otv_ClassDef_validate( table + MarkAttachClassDef, valid );
    }

    FT_TRACE4(( "\n" ));
  }


/* END */