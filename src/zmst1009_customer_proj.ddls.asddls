@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'customer projection view'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity zmst1009_customer_proj provider contract transactional_query
 as projection on zmst1009_customer
{
    key CustomerUuid,
    Name,
    City,
    Email,
    CreatedBy,
    LastChangedBy,
    CreatedAt,
    ChangedAt
}
