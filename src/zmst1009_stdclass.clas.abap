CLASS zmst1009_stdclass DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZMST1009_STDCLASS IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    " Declare an internal table to store student data
    DATA: it_students TYPE STANDARD TABLE OF zmst1009_student WITH EMPTY KEY,
          it_Assessment TYPE STANDARD TABLE OF zmst1009_asment WITH EMPTY KEY,
          it_subject TYPE STANDARD TABLE OF zmst1009_subject WITH EMPTY KEY,
           it_parent TYPE STANDARD TABLE OF zmst1009_pd WITH EMPTY KEY,
           it_attend TYPE STANDARD TABLE OF zmst1009_attend WITH EMPTY KEY,
            it_section TYPE STANDARD TABLE OF zmst1009_section WITH EMPTY KEY,
          lv_existing_id TYPE zmst1009_student-student_id,
          lv_new_id TYPE zmst1009_student-student_id,
          lv_count TYPE i.

    TRY.
      " Populate student data (without student_id, we will generate it dynamically)
      it_students = VALUE #(
        ( student_name = 'Narendra' age = 20 class = 10 section_1 = 'A' avg_marks = '85.50'
        student_image_url = 'https://static.vecteezy.com/system/resources/previews/008/846/306/non_2x/student-with-laptop-sitting-online-education-concept-remote-studying-concept-png.png'  )
        ( student_name = 'Uday' age = 19 class = 12 section_1 = 'B' avg_marks = '90.25'
         student_image_url = 'https://img.freepik.com/premium-photo/portrait-smiling-young-college-student-with-books-backpack-against-white-background_662251-2926.jpg?w=2000' )
        ( student_name = 'Ravi Nandan' age = 21 class = 11 section_1 = 'C' avg_marks = '95.75' )
        ( student_name = 'Nagamani' age = 22 class = 12 section_1 = 'A' avg_marks = '88.60'
        student_image_url = 'https://th.bing.com/th/id/OIP.0jqUbZSzecbxT5MjiV1e5AHaE7?w=2000&h=1333&rs=1&pid=ImgDetMain'  )
        ( student_name = 'Grace' age = 20 class = 11 section_1 = 'B' avg_marks = '91.80'
        student_image_url = 'https://as2.ftcdn.net/v2/jpg/05/52/94/89/1000_F_552948967_rfWkVCstu3t9ypSnpt2ZePVnuqoi6D6o.jpg'  )
        ( student_name = 'Mary' age = 20 class = 11 section_1 = 'B' avg_marks = '91.80'  )
      ).

      LOOP AT it_students INTO DATA(ls_student).
        " Get the current maximum student_id from the table
        SELECT MAX( student_id ) FROM zmst1009_student
          INTO @lv_existing_id.

        " Generate new student_id by incrementing the maximum ID value
        IF lv_existing_id IS INITIAL.
          lv_new_id = '00001'. " Start with 00001 if no records exist
        ELSE.
          lv_new_id = lv_existing_id + 1.
        ENDIF.

        " Assign the new student_id to the current student record
        ls_student-student_id = lv_new_id.

        " Insert the new student record into the table
        INSERT zmst1009_student FROM @ls_student.

        IF sy-subrc = 0.
          out->write( |Student { ls_student-student_id } inserted successfully.| ).
        ELSE.
          out->write( |Error inserting Student { ls_student-student_id }. Error Code: { sy-subrc }.| ).
        ENDIF.

      ENDLOOP.

    CATCH cx_sy_itab_line_not_found.
      out->write( |Error: Line not found in the internal table.| ).
    CATCH cx_sy_dynamic_osql_error.
      out->write( |Error: Issue with SQL operation.| ).
    ENDTRY.
    it_Assessment = VALUE #(  ( assesment_id = '1'  assesment_n0 = '1' )
                               ( assesment_id = '2' assesment_n0 = '2' )
                               ( assesment_id = '3'  assesment_n0 = '3' )

).
DELETE FROM zmst1009_asment.
INSERT zmst1009_asment FROM TABLE @it_assessment.
out->write( |{ sy-dbcnt } entries in zmst1009_asment modified| ).
COMMIT WORK.
 it_subject = VALUE #(  ( subject_id = '1'  subject_name = 'Telugu' )
                               ( subject_id = '2'  subject_name = 'Hindi' )
                                ( subject_id = '3'  subject_name = 'English' )
                                 ( subject_id = '4'  subject_name = 'Maths' )
                                  ( subject_id = '5'  subject_name = 'Science' )
                                   ( subject_id = '6'  subject_name = 'Social' )

).
DELETE FROM zmst1009_subject.
INSERT zmst1009_subject FROM TABLE @it_subject.
out->write( |{ sy-dbcnt } entries in zmst1009_subject modified| ).
COMMIT WORK.
it_parent = VALUE #(  ( student_id = '1'  parent_id = '1'  parent_name = 'Harsha' parent_age = '34' contact = '8976543890' )
                      ( student_id = '2'  parent_id = '2'  parent_name = 'Vamsi' parent_age = '35' contact = '9087469873 ' )
                       ( student_id = '3'  parent_id = '3'  parent_name = 'Rani' parent_age = '30' contact = '8765309890' )
                       ( student_id = '4'  parent_id = '4'  parent_name = 'Ramesh' parent_age = '34' contact = '8976543890' )


).
DELETE FROM zmst1009_pd.
INSERT zmst1009_pd FROM TABLE @it_parent.
out->write( |{ sy-dbcnt } entries in zmst1009_subject modified| ).
COMMIT WORK.

it_attend = VALUE #(  ( student_id = '1'  assesment_id = '1'  attendance_id = '1' subject_id = '1' student_name = 'Uday' no_of_workingdays = '30' attendance_percent = '58.60' )
                       ( student_id = '2'  assesment_id = '1'  attendance_id = '2' subject_id = '1' student_name = 'Ravi' no_of_workingdays = '30' attendance_percent = '58.60' )
 ( student_id = '3'  assesment_id = '1'  attendance_id = '3' subject_id = '1' student_name = 'Ravi' no_of_workingdays = '30' attendance_percent = '58.60' )
 ( student_id = '4'  assesment_id = '1'  attendance_id = '4' subject_id = '1' student_name = 'Ravi' no_of_workingdays = '30' attendance_percent = '58.60' )


).
DELETE FROM zmst1009_attend.
INSERT zmst1009_attend FROM TABLE @it_attend.
out->write( |{ sy-dbcnt } entries in zmst1009_attend modified| ).
COMMIT WORK.


it_section = VALUE #(  (  section_1 = 'A' )
                        (  section_1 = 'B' )
                           (  section_1 = 'C' )
).
DELETE FROM zmst1009_section.
INSERT zmst1009_section FROM TABLE @it_section.
out->write( |{ sy-dbcnt } entries in zmst1009_section modified| ).
COMMIT WORK.
  ENDMETHOD.
ENDCLASS.
