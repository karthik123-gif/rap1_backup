CLASS lhc_zfile_sample DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zfile_sample RESULT result.
    METHODS uploadfile FOR MODIFY
      IMPORTING keys FOR ACTION zfile_sample~uploadfile RESULT result.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR zfile_sample RESULT result.

ENDCLASS.

CLASS lhc_zfile_sample IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.


  METHOD uploadFile.
    DATA: lv_max_size TYPE i VALUE 10485760, " 10 MB in bytes
          lv_file_size TYPE i,
          lt_messages TYPE TABLE OF symsg,
          ls_message  TYPE symsg.

    " Read the file size from the keys
    READ ENTITIES OF zfile_sample IN LOCAL MODE
      ENTITY zfile_sample
      FIELDS ( Attachment ) WITH CORRESPONDING #( keys )
      RESULT DATA(lt_files).

    LOOP AT lt_files INTO DATA(ls_file).
      " Get the file size
      lv_file_size = xstrlen( ls_file-Attachment ).

      " Check if the file size exceeds the allowed limit
      IF lv_file_size > lv_max_size.
        ls_message-msgid = 'ZUPLOAD'.
        ls_message-msgno = '001'.
        ls_message-msgty = 'E'. " Error message
        ls_message-msgv1 = 'File size exceeds the allowed limit of 10 MB.'.
        APPEND ls_message TO lt_messages.
      ELSE.
        " File size is within the limit, proceed with upload
        result = VALUE #( ( %tky = ls_file-%tky ) ).
      ENDIF.
    ENDLOOP.

    " Add error messages if any
*    IF lt_messages IS NOT INITIAL.
*      cl_abap_behv=>add_messages( it_messages = lt_messages ).
*    ENDIF.
  ENDMETHOD.
    METHOD get_instance_features.
  ENDMETHOD.

ENDCLASS.
