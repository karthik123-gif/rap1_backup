CLASS lhc_zmst109_file1 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zmst109_file1 RESULT result.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR zmst109_file1 RESULT result.

    METHODS uploadfile FOR MODIFY
      IMPORTING keys FOR ACTION zmst109_file1~uploadfile RESULT result.

ENDCLASS.

CLASS lhc_zmst109_file1 IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD uploadFile.
  ENDMETHOD.

ENDCLASS.
