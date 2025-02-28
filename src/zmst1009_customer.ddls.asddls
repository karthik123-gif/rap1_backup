@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds ffor customer data'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity zmst1009_customer as select from zmst1009_cust
{
    key customer_uuid as CustomerUuid,
    name as Name,
    city as City,
    email as Email,
    @Semantics.user.createdBy: true
    created_by as CreatedBy,
    @Semantics.user.lastChangedBy: true
    last_changed_by as LastChangedBy,
    @Semantics.systemDateTime.createdAt: true
    created_at as CreatedAt,
    @Semantics.systemDateTime.lastChangedAt: true
    changed_at as ChangedAt
}
