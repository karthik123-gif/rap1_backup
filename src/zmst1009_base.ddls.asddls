@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds for base amount'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zmst1009_base as select from zmst1009_cds_data
{
    Companycode,
    Journalentry,
    Fiscalyear,
    sum(Currency) as BaseAmount
}
where Lineitemid = 'S'
group by
    Companycode,
    Journalentry,
    Fiscalyear
;
