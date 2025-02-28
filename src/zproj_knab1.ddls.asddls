@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'projection on top of cds'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity zproj_knab1 as select from zknab1_cds
{
    key kunnr,
    name1,
    name2,
    land1,
    pstlz,
    regio,
    telf1,
    bukrs,
    ernam,
    erdat
}
