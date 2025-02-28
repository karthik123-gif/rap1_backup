@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds for sgst'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zmst1009_sgst as select from zmst1009_cds_data
{
    Companycode,
    Journalentry,
    Fiscalyear,
    sum(Currency) as SGST
}
where Transactionkey = 'JII' and Lineitemid = 'T'
group by
    Companycode,
    Journalentry,
    Fiscalyear
;
