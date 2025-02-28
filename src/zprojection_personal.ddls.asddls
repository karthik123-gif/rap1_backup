@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'projection for personal details'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@Search.searchable: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zprojection_personal as select from zmst1009_peronal
association  to parent zprojection_student as _student on $projection.StudentId = _student.studentId
{   
 @Search.defaultSearchElement: true 
     @UI.lineItem: [{ position: 10 }]
    key StudentId,
     @Search.defaultSearchElement: true 
     @UI.lineItem: [{ position: 20 }]
     
    key ParentId,
    
     @Search.defaultSearchElement: true 
     @UI.lineItem: [{ position: 30 }]
    ParentName,
    
     @Search.defaultSearchElement: true 
     @UI.lineItem: [{ position: 40 }]
    ParentAge,
    
     @Search.defaultSearchElement: true 
     @UI.lineItem: [{ position: 10 }]
    Contact,
     _student
}
