//@AbapCatalog.sqlViewName: 'zuser_1'
//@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'user data definition'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zuser_demo as select from zuser
{
    key user_id as UserId,
    first_name as FirstName,
    last_name as LastName,
    email as Email,
    phone_number as PhoneNumber
}
