@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS for Section 2'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@ObjectModel.resultSet.sizeCategory: #XS
define view entity zmst1009_sec_2 as select from zmst1009_section
{
    @UI.textArrangement: #TEXT_ONLY
    @ObjectModel.text.element: ['section_data']
    
    key section_1 as section_data,   // Key for section
    description as Description       // Text associated with the key
}
