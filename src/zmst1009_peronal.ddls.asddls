@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'personal details of student'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zmst1009_peronal as select from zmst1009_pd

{
    key student_id as StudentId,
    key parent_id as ParentId,
    parent_name as ParentName,
    parent_age as ParentAge,
    contact as Contact,
    student_image_url as StudentImageUrl
   // _association_name // Make association public
}
