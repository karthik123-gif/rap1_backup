@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds for marks'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity zmst1009_mark as select from zmst1009_marks
//association  to parent zmst1009_std_cds as _student on $projection.StudentId = _student.studentId
association [0..1] to zmst1009_std_cds as _student on _student.studentId = zmst1009_marks.student_id
association [0..1] to zmst1009_asmnt_cds as _assessment on _assessment.AssesmentId = zmst1009_marks.assesment_id
association [0..1] to zmst1009_Subject1 as _subject on _subject.SubjectId = zmst1009_marks.subject_id


{
     @Consumption.valueHelpDefinition: [{ entity: { name: 'zmst1009_std_cds', element: 'studentId' } }]
    // @Search.defaultSearchElement: true
    // @ObjectModel.text.element: [ 'StudentName' ]
    @UI.lineItem: [{ position: 10 }]
    key student_id as StudentId,
   // _student.StudentName as StudentName,
    
     @Consumption.valueHelpDefinition: [{ entity: { name: 'zmst1009_asmnt_cds', element: 'AssesmentId' } }]
     @Search.defaultSearchElement: true 
     @UI.lineItem: [{ position: 10 }]
     key assesment_id as AssesmentId,
     
     @UI.lineItem: [{ position: 10 }]
     @Consumption.valueHelpDefinition: [{ entity: { name: 'zmst1009_Subject1', element: 'SubjectId' } }]
     //@Search.defaultSearchElement: true
     @ObjectModel.text.element: [ 'subjectName' ]
    key subject_id as SubjectId,
    _subject.SubjectName as subjectName,
    
    @Search.defaultSearchElement: true
    @UI.lineItem: [{ position: 10 }]
    marks as Marks,
    
    //@ObjectModel.text.association: '_student'
    //student_id,
    
    //  concat('-' , _student.StudentName ) as student_id,
   //  concat( concat( student_id, '-' ), _student.StudentName ) as StudentDisplay,
    _student , 
    _assessment,
    _subject
    

}
