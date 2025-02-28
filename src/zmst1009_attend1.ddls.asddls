@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds for student attendance'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@Search.searchable: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zmst1009_attend1 as select from zmst1009_attend
association to parent  zprojection_marks as _marks1 on $projection.StudentId = _marks1.StudentId 
                                                    and $projection.AssessmentID = _marks1.AssesmentId
                                                     and $projection.SbjectId = _marks1.SubjectId 
association to zprojection_student as _student on $projection.StudentId = _student.studentId
     {
     
      @Search.defaultSearchElement: true
    @UI.lineItem: [{ position: 10 }]
    
    key student_id as StudentId,
    
     @Search.defaultSearchElement: true
    @UI.lineItem: [{ position: 10 }]
    
    key assesment_id as AssessmentID,
    
     @Search.defaultSearchElement: true
    @UI.lineItem: [{ position: 10 }]
    
    key subject_id  as SbjectId,
    
     @Search.defaultSearchElement: true
    @UI.lineItem: [{ position: 10 }]
    
    key attendance_id as AttendanceId,
    
//     @Search.defaultSearchElement: true
//    @UI.lineItem: [{ position: 10 }]
//    
//    student_name as StudentName,
    
     @Search.defaultSearchElement: true
    @UI.lineItem: [{ position: 10 }]
    no_of_workingdays as NoOfWorkingdays,
     @Search.defaultSearchElement: true
    @UI.lineItem: [{ position: 10 }]
    attendance_percent as AttendancePercent,
    _marks1,
    _student
   
}
