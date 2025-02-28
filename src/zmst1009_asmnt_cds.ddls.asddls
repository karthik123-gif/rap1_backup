@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds for student assesment'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zmst1009_asmnt_cds as select from zmst1009_asment

{
    key assesment_id as AssesmentId,
    assesment_n0 as AssesmentN0
    
   // _association_name // Make association public
}
