CLASS lhc_zprojection_student DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS archiveStudent FOR MODIFY
      IMPORTING keys FOR ACTION zprojection_student~archiveStudent RESULT result.

    METHODS calculateAvgMarks FOR MODIFY
      IMPORTING keys FOR ACTION zprojection_student~calculateAvgMarks RESULT result.


ENDCLASS.

CLASS lhc_zprojection_student IMPLEMENTATION.

  METHOD archiveStudent.
  ENDMETHOD.

  METHOD calculateAvgMarks.
  ENDMETHOD.



ENDCLASS.
