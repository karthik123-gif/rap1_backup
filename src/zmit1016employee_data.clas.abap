CLASS zmit1016employee_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZMIT1016EMPLOYEE_DATA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
     data: it_emp type STANDARD TABLE OF zmit1016_empdata with empty key.
     TRY.
        IT_EMP = VALUE #( ( EMPNO = '1000'
                           EMPNAME = 'HARI'
                           DEPT  = 'SAP'
                           CITY = 'NY'
                           COUNTRY = 'US')
                           ( EMPNO = '1001'
                           EMPNAME = 'OM'
                           DEPT  = 'SAP'
                           CITY = 'NY'
                           COUNTRY = 'US')
                           ( EMPNO = '1002'
                           EMPNAME = 'NAMO'
                           DEPT  = 'AI'
                           CITY = 'NY'
                           COUNTRY = 'US')
                           ( EMPNO = '1003'
                           EMPNAME = 'JAY'
                           DEPT  = 'SAP'
                           CITY = 'NJ'
                           COUNTRY = 'US')
                           ( EMPNO = '1004'
                           EMPNAME = 'LEE'
                           DEPT  = 'AI'
                           CITY = 'NJ'
                           COUNTRY = 'US') ).
         INSERT zmit1016_empdata from table @it_emp .
     ENDTRY.

  ENDMETHOD.
ENDCLASS.
