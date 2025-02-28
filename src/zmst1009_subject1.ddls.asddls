@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds for subjects'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zmst1009_Subject1 as select from zmst1009_subject

{
    key subject_id as SubjectId,
    subject_name as SubjectName
   // _association_name // Make association public
}
