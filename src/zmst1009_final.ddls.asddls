@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Final CDS for Calculated Data'
define view entity zmst1009_final as select from zmst1009_cds_data as Base

left outer join zmst1009_ACCTYPE as TotalAmount
    on Base.Companycode = TotalAmount.Companycode 
    and Base.Journalentry = TotalAmount.Journalentry
    and Base.Fiscalyear = TotalAmount.Fiscalyear

left outer join zmst1009_base as BaseAmount
    on Base.Companycode = BaseAmount.Companycode 
    and Base.Journalentry = BaseAmount.Journalentry
    and Base.Fiscalyear = BaseAmount.Fiscalyear

left outer join zmst1009_transaction as IGST
    on Base.Companycode = IGST.Companycode 
    and Base.Journalentry = IGST.Journalentry
    and Base.Fiscalyear = IGST.Fiscalyear

left outer join zmst1009_cgst as CGST
    on Base.Companycode = CGST.Companycode 
    and Base.Journalentry = CGST.Journalentry
    and Base.Fiscalyear = CGST.Fiscalyear

left outer join zmst1009_sgst as SGST
    on Base.Companycode = SGST.Companycode 
    and Base.Journalentry = SGST.Journalentry
    and Base.Fiscalyear = SGST.Fiscalyear

{
    key Base.Companycode,
    key Base.Journalentry,
    key Base.Fiscalyear,
    
  // Avoids NULL values affecting calculations.
  
    coalesce(TotalAmount.TotalAmount, 0) as TotalAmount,
    coalesce(BaseAmount.BaseAmount, 0) as BaseAmount,
    coalesce(IGST.IGST, 0) as IGST,
    coalesce(CGST.CGST, 0) as CGST,
    coalesce(SGST.SGST, 0) as SGST
}
group by Base.Companycode, Base.Journalentry, Base.Fiscalyear,
    TotalAmount.TotalAmount,
    BaseAmount.BaseAmount,
    IGST.IGST,
    CGST.CGST,
    SGST.SGST;


