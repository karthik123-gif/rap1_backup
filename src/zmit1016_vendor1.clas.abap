CLASS zmit1016_vendor1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZMIT1016_VENDOR1 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
 data: it_emp type STANDARD TABLE OF zmit1016_vendor with empty key.
     TRY.
        IT_EMP = VALUE #( ( vendorid   = '10'
                            vendorname = 'uday'
                            vendorno   = '101'
                            vendorcity =  'hyd'
                            vendorcountry = 'IND'
                            vendorwork    = 'server')
                           ( vendorid   = '11'
                            vendorname = 'Narendra'
                            vendorno   = '103'
                            vendorcity =  'hyd'
                            vendorcountry = 'US'
                            vendorwork    = 'Manager')
                           ( vendorid   = '12'
                            vendorname = 'udaykiran'
                            vendorno   = '102'
                            vendorcity =  'hyd'
                            vendorcountry = 'IND'
                            vendorwork    = 'server')
                           ( vendorid   = '13'
                            vendorname = 'ravi'
                            vendorno   = '110'
                            vendorcity =  'hyd'
                            vendorcountry = 'índ'
                            vendorwork    = 'server') ).
         INSERT zmit1016_vendor from table @it_emp .
     ENDTRY.

  ENDMETHOD.
ENDCLASS.
