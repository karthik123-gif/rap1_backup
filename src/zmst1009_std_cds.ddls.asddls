@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Student CDS'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@Search.searchable: true  // Enables global search

define root view entity zmst1009_std_cds as select from zmst1009_student
 association [1..1] to zmst1009_sec_2 as _Section on $projection.section1 = _Section.section_data
//association [0..*] to zmst1009_mark as _Marks on $projection.studentId = _Marks.StudentId
//composition [0..*] of zmst1009_mark as _Marks
{


@UI.facet: [{  
                id: 'student',
                purpose: #STANDARD,
                label: 'student reference',
                type: #IDENTIFICATION_REFERENCE
    
               }]

   @EndUserText.label: 'student Id'
    @Search.defaultSearchElement: true
    @UI.selectionField: [{ position: 10 }]
    @UI. lineItem: [{position: 10, label: 'student Id'}]
    @UI.identification: [{position: 10, label: 'student Id'}] 
    key student_id as studentId,

    @UI.lineItem: [{ position: 70 }]
    @Semantics.imageUrl: true
    student_image_url as Studentimage,
     @EndUserText.label: 'Student Name'
     @UI. lineItem: [{position: 20 }]
    @UI.identification: [{position: 20}]
    @Search.defaultSearchElement: true
   @Search.fuzzinessThreshold: 0.7
    student_name as StudentName,
     @EndUserText.label: 'Age'
     @UI. lineItem: [{position: 20 }]
    @UI.identification: [{position: 20}]
    @Search.defaultSearchElement: true
    age as Age,
    @EndUserText.label: 'Class'
     @UI. lineItem: [{position: 20 }]
    @UI.identification: [{position: 20}]
    @Search.defaultSearchElement: true
    class as class,
    @EndUserText.label: 'Avg marks'
     @UI. lineItem: [{position: 20 }]
    @UI.identification: [{position: 20}]
    @Search.defaultSearchElement: true
    avg_marks as avgMarks,
      @EndUserText.label: 'section'
         @Search.defaultSearchElement: true
    @Consumption.valueHelpDefinition: [{ 
        entity: { 
            name: 'zmst1009_sec_2', 
            element: 'section_data' 
        } 
    }]
  // @ObjectModel.foreignKey.association: '_Section'
    @UI.lineItem: [{ position: 20 }]
    section_1 as section1,
  
        _Section
   //  _Marks
     
 }
