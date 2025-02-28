CLASS zmit1016_up1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZMIT1016_UP1 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
     DATA: lt_course TYPE STANDARD TABLE OF zmit1016_ec WITH EMPTY KEY,
          lt_schedule TYPE STANDARD TABLE OF zmit1016_sc WITH EMPTY KEY.
    TRY.
         lt_course = VALUE #( ( course_uuid = cl_system_uuid=>create_uuid_x16_static( )
                                course_id = 'BC400'
                                course_name = 'ABAP Development'
                                course_length = 5
                                country = 'DE'
                                price = 1000
                                currency_code = 'EUR' )
                                ( course_uuid = cl_system_uuid=>create_uuid_x16_static( )
                                course_id = 'BC401'
                                course_name = 'HANA ABAP Development'
                                course_length = 5
                                country = 'DE'
                                price = 1100
                                currency_code = 'EUR' )
                                ( course_uuid =
cl_system_uuid=>create_uuid_x16_static( )
course_id = 'BC402'
course_name = 'ABAP Objects'
course_length = 5
country = 'DE'
price = 1000
currency_code = 'EUR' )
( course_uuid =
cl_system_uuid=>create_uuid_x16_static( )
course_id = 'BC403'
course_name = 'ABAP Advanced Development'
course_length = 5
country = 'DE'
price = 1000
currency_code = 'EUR' ) ).
DELETE FROM zmit1016_ec.
INSERT zmit1016_ec FROM TABLE @lt_course.
out->write( |{ sy-dbcnt } entries in zmit1016_ec modified| ).
lt_schedule = VALUE #(  ( schedule_uuid =
cl_system_uuid=>create_uuid_x16_static( )
course_uuid = lt_course[ 1 ]-course_uuid
course_begin = '20200301'
trainer = 'Narayana'
is_online = abap_false
location = 'Walldorf' )
( schedule_uuid =
cl_system_uuid=>create_uuid_x16_static( )
course_uuid = lt_course[ 2 ]-course_uuid
course_begin = '20200308'
trainer = 'Ravi'
is_online = abap_true
location = 'VLC' )
( schedule_uuid =
cl_system_uuid=>create_uuid_x16_static( )
course_uuid = lt_course[ 3 ]-course_uuid
course_begin = '20200308'
trainer = 'uday'
is_online = abap_true
location = 'VLC' )
( schedule_uuid =
cl_system_uuid=>create_uuid_x16_static( )
course_uuid = lt_course[ 4 ]-course_uuid
course_begin = '20200308'
trainer = 'Narendra'
is_online = abap_true
location = 'VLC' )
*( schedule_uuid =
*cl_system_uuid=>create_uuid_x16_static( )
*course_uuid = lt_course[ 5 ]-course_uuid
*course_begin = '20200308'
*trainer = 'Sudhakar'
*is_online = abap_true
*location = 'VLC' )
).
DELETE FROM zmit1016_sc.
INSERT zmit1016_sc FROM TABLE @lt_schedule.
out->write( |{ sy-dbcnt } entries in zmit1016_sc modified| ).
COMMIT WORK.
CATCH cx_uuid_error.
    ENDTRY.

  ENDMETHOD.
ENDCLASS.
