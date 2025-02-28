CLASS zdemo11 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.



CLASS ZDEMO11 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA: lt_master1 TYPE STANDARD TABLE OF zkna1_pkg WITH EMPTY KEY,
          lt_item    TYPE STANDARD TABLE OF zknb1_pkg WITH EMPTY KEY.

    TRY.
        " Populate the internal table lt_master1 with data
        lt_master1 = VALUE #(
          ( client = '100' kunnr = '0000000001' name1 = 'TATA CROMA DEALER' name2 = 'DE' land1 = 'IN' pstlz = '560089' regio = 'KA' telf1 = '1234567890' )
          ( client = '100' kunnr = '0000000002' name1 = 'TATA CROMA DEALER -2' name2 = 'DE' land1 = 'IN' pstlz = '560078' regio = 'MH' telf1 = '0987654321' )
          ( client = '100' kunnr = '0000000003' name1 = 'Domestic US Customer 1' name2 = 'DE' land1 = 'US' pstlz = '30315-1400' regio = 'GA' telf1 = '5551234567' )
          ( client = '100' kunnr = '0000000004' name1 = 'Domestic US Customer 2' name2 = 'DE' land1 = 'US' pstlz = '30315-1408' regio = 'GA' telf1 = '5557654321' )
          ( client = '100' kunnr = '0000000005' name1 = 'Domestic US Customer 3' name2 = 'DE' land1 = 'US' pstlz = '30315-1401' regio = 'GA' telf1 = '5559876543' )
          ( client = '100' kunnr = '0000000006' name1 = 'Domestic US Customer 4' name2 = 'DE' land1 = 'US' pstlz = '30315-1402' regio = 'GA' telf1 = '5556789012' )
        ).

        " Populate the internal table lt_item with data
        lt_item = VALUE #(
          ( client = '100' kunnr = '0000000001' bukrs = '0001' ernam = 'USER1' erdat = '20250128' )
          ( client = '100' kunnr = '0000000002' bukrs = '0002' ernam = 'USER2' erdat = '20250128' )
          ( client = '100' kunnr = '0000000003' bukrs = '0003' ernam = 'USER3' erdat = '20250128' )
          ( client = '100' kunnr = '0000000004' bukrs = '0004' ernam = 'USER4' erdat = '20250128' )
          ( client = '100' kunnr = '0000000005' bukrs = '0005' ernam = 'USER5' erdat = '20250128' )
          ( client = '100' kunnr = '0000000006' bukrs = '0006' ernam = 'USER6' erdat = '20250128' )
        ).

        " Insert new entries from the internal tables
        INSERT zkna1_pkg FROM TABLE @lt_master1 ACCEPTING DUPLICATE KEYS.
        IF sy-subrc = 4.
          out->write( |Some entries in zkna1_pkg were duplicates and were not inserted.| ).
        ELSE.
          out->write( |All entries in zkna1_pkg were inserted successfully.| ).
        ENDIF.

        INSERT zknb1_pkg FROM TABLE @lt_item ACCEPTING DUPLICATE KEYS.
        IF sy-subrc = 4.
          out->write( |Some entries in zknb1_pkg were duplicates and were not inserted.| ).
        ELSE.
          out->write( |All entries in zknb1_pkg were inserted successfully.| ).
        ENDIF.

        " Commit the changes to the database
        COMMIT WORK.

      CATCH cx_root INTO DATA(lx_exception).
        " Handle exceptions
        out->write( |An error occurred: { lx_exception->get_text( ) }| ).
    ENDTRY.

  ENDMETHOD.
ENDCLASS.
