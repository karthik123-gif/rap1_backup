@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds for CGST'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zmst1009_cgst as select from zmst1009_cds_data
{
    Companycode,
    Journalentry,
    Fiscalyear,
    sum(Currency) as CGST
}
where Transactionkey = 'JIC' and Lineitemid = 'T'
group by
    Companycode,
    Journalentry,
    Fiscalyear
;
