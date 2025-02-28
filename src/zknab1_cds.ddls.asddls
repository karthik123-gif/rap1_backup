@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds of both kna1 and knb1'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zknab1_cds as select from zkna1_pkg as KNA1
  inner join zknb1_pkg as KNB1
    on KNA1.kunnr = KNB1.kunnr
{
  key KNA1.kunnr,
      KNA1.name1,
      KNA1.name2,
      KNA1.land1,
      KNA1.pstlz,
      KNA1.regio,
      KNA1.telf1,
      KNB1.bukrs,
      KNB1.ernam,
      KNB1.erdat
}
