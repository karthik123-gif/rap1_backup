@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds for financial account type'
@Metadata.ignorePropagatedAnnotations: true
define view entity zmst1009_ACCTYPE as select from zmst1009_cds_data
{
    Companycode,
    Journalentry,
    Fiscalyear,
    sum(Currency) as TotalAmount
}
where Financialaccounttype = 'K'
group by
    Companycode,
    Journalentry,
    Fiscalyear
;
