CLASS zmst1009_datac DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZMST1009_DATAC IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


  DATA: lt_master1 TYPE STANDARD TABLE OF zmst1009_data WITH EMPTY KEY,
    TRY.
        " Populate the internal table lt_master1 with data
        lt_master1 = VALUE #(
          ( companycode = '1110' journalentry = '94000001' fiscalyear = '2024' postingviewitem = '1' currency = '1250' lineitemid = ' ' transactionkey = '' )

        ).

        " Insert new entries from the internal tables
        INSERT zmst1009_data FROM TABLE @lt_master1 ACCEPTING DUPLICATE KEYS.
        IF sy-subrc = 4.
          out->write( |Some entries in zmst1009_data were duplicates and were not inserted.| ).
        ELSE.
          out->write( |All entries in zmst1009_data were inserted successfully.| ).
        ENDIF.

        " Commit the changes to the database
        COMMIT WORK.


  ENDMETHOD.
ENDCLASS.
