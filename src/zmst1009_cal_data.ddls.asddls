@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS for Calculated Data'
define view entity zmst1009_cal_data 
as select from zmst1009_cds_data


{
  key Companycode,

  key Journalentry,
 
  key Fiscalyear,
 // @UI.lineItem: [ {position: 10,   }]
  sum( case Financialaccounttype when 'K'  then Currency else 0 end ) as total_AMT,
  sum( case Lineitemid when 'S' then Currency else 0 end ) as BASE_AMT,
  sum( case Transactionkey when 'JIS'  then Currency else 0 end ) as IGST,
  sum( case Transactionkey when 'JIC' then Currency else 0 end ) as CGST,
  sum( case Transactionkey when 'JII' then Currency else 0 end ) as SGST
}
group by 
    Companycode,
    Journalentry,
    Fiscalyear



//{
//    @UI.lineItem: [{position: 10, label: 'Company Code'}]
//    key companycode,
//
//    @UI.lineItem: [{position: 20, label: 'Journal Entry'}]
//    key journalentry,
//
//    @UI.lineItem: [{position: 30, label: 'Fiscal Year'}]
//    key fiscalyear,
//
//    @UI.lineItem: [{position: 40, label: 'Line Item ID'}]
//    key lineitemid,
//
//    @UI.lineItem: [{position: 45, label: 'Posting View Item'}]
//    key postingviewitem,  
//
//    @UI.lineItem: [{position: 50, label: 'Calculated Amount'}]
//    case 
//        when financialaccounttype = 'K' then currency
//        when lineitemid = 'S' then currency
//        when lineitemid = 'T' and transactionkey = 'JIS' then currency 
//        when lineitemid = 'T' and transactionkey = 'JIC' then currency 
//        when lineitemid = 'T' and transactionkey = 'JII' then currency 
//        else cast(0 as abap.dec(13,2))
//    end as CalculatedAmount
//}
