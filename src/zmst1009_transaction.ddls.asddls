@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds for transaction key'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zmst1009_transaction as select from zmst1009_cds_data
{
    Companycode,
    Journalentry,
    Fiscalyear,
    sum(Currency) as IGST
}
where Transactionkey = 'JIS' and Lineitemid = 'T'
group by
    Companycode,
    Journalentry,
    Fiscalyear
;
