@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'projection cds for marks'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@Search.searchable: true
//@Analytics: {dataCategory: #CUBE}
//@Analytics.query: true

@UI.presentationVariant: [{
    sortOrder: [{ by: 'Marks', direction: #DESC }],
   visualizations: [{ qualifier: 'MarksChart' }]
}]
@UI.chart: [{ 
qualifier: 'MarksChart',
chartType: #COLUMN,          
    measures: ['Marks'],        
    dimensions: ['SubjectId']
     }]        
    
define view entity zprojection_marks as select from zmst1009_mark
//composition of target_data_source_name as _association_name
composition [0..*] of zmst1009_attend1 as _attend
association  to parent zprojection_student as _student on $projection.StudentId = _student.studentId

{   
 @Consumption.valueHelpDefinition: [{ entity: { name: 'zmst1009_std_cds', element: 'studentId' } }]
    // @Search.defaultSearchElement: true
    // @ObjectModel.text.element: [ 'StudentName' ]
    @UI.lineItem: [{ position: 10 }]
    key StudentId,
     @Consumption.valueHelpDefinition: [{ entity: { name: 'zmst1009_asmnt_cds', element: 'AssesmentId' } }]
     @Search.defaultSearchElement: true 
     @UI.lineItem: [{ position: 10 }]
    key AssesmentId,
    @UI.lineItem: [{ position: 10 }]
     @Consumption.valueHelpDefinition: [{ entity: { name: 'zmst1009_Subject1', element: 'SubjectId' } }]
     //@Search.defaultSearchElement: true
     @ObjectModel.text.element: [ 'subjectName' ]
    key SubjectId,
    _subject.SubjectName as subjectName,
    
    @Search.defaultSearchElement: true
    @UI.lineItem: [{ position: 10 }]
    //subjectName,
      @UI.dataPoint: { title: 'Marks', criticality: 'Criticality' }  
      
    Marks,
    
     @UI.hidden: true  // Hide in UI, only used for criticality calculation
    cast(
        case 
            when Marks >= 75 then 3  // Green (Good)
            when Marks >= 50 then 2  // Yellow (Neutral)
            else 1                   // Red (Bad)
        end as abap.int4
    ) as Criticality,
    
    /* Associations */
    _assessment,
    _student,
    _subject,
    _attend
  //  _association_name // Make association public
}
