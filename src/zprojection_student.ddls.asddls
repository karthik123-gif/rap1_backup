    @AccessControl.authorizationCheck: #NOT_REQUIRED
    @EndUserText.label: 'projection cds for student'
    @Metadata.ignorePropagatedAnnotations: true
    @Metadata.allowExtensions: true
    @Search.searchable: true
    @ObjectModel.semanticKey: [ 'studentId' ]
    define root view entity zprojection_student as select from zmst1009_student
    composition [0..*] of zprojection_marks as _Marks
    composition  [0..*] of zprojection_personal as _parent
    composition[0..*] of zmst1009_file_upld as _Attachment
   association [1..1] to zmst1009_sec_2 as _Section on $projection.section1 = _Section.section_data
 association [0..*] to zmst1009_attend as _marks1 
on $projection.studentId = _marks1.student_id
    
    
    
    {
       @Search.defaultSearchElement: true
       @UI.selectionField: [{ position: 10 }]
        key student_id as studentId ,
        @UI.lineItem: [{ position: 70 }]
         @Semantics.imageUrl: true
        student_image_url as Studentimage,
        @Search.defaultSearchElement: true
       student_name as StudentName,
        @Search.defaultSearchElement: true
        age as Age,
        @Search.defaultSearchElement: true
        class as class,
        @Search.defaultSearchElement: true
        avg_marks as avgMarks,
       
//        @Search.defaultSearchElement: true
//         @Consumption.valueHelpDefinition: [{ entity: { name: 'ZV_SECTION', element: 'section1' } }]
//        section_1 as section1,

        // @ObjectModel.text.association: '_Section'
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
        
        case section_1
        when 'A' then 2
        when 'B' then 3
        when 'C' then 1
        else 0 
        end     as overallcriticality,
        
        
//    _Section.section_data as text,
//        @UI.selectionField: [{ position: 20 }]
//@UI.lineItem: [{ position: 30 }]
// @Consumption.valueHelpDefinition: [{ entity: {
//   name: 'zmst1009_sec_2',
//   element: 'section_data'
//} }] 
//@ObjectModel.text.element: [ 'text' ]
//section1,

          
        _Marks,
        _parent,
        _Section,
        _marks1,
        _Attachment
  
        //_Section // Make association public
    }
