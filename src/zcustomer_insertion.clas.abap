CLASS zcustomer_insertion DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcustomer_insertion IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  MODIFY ENTITIES OF zmst1009_customer
  ENTITY Customer
  CREATE
  FROM VALUE #( (  %cid = 'CID1' Name = 'Customer 1' %control-Name = if_abap_behv=>mk-on ) )
  MAPPED DATA(ls_mapped)
  REPORTED DATA(ls_reported)
  FAILED DATA(ls_failed).

if ls_mapped-customer is not initial.
      out->write( ls_mapped-customer[ 1 ]-CustomerUuid ).

COMMIT ENTITIES RESPONSE OF zmst1009_customer
        FAILED DATA(ls_commit_failed)
        REPORTED DATA(ls_commit_reported).
        if ls_commit_failed is INITIAL and ls_commit_reported IS INITIAL.
        out->write( 'data got inserted' ).
        ENDIF.

        ENDIF.
  ENDMETHOD.
ENDCLASS.
