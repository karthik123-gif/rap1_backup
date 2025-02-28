@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'parent fro ed1'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZMIT1016_projection as projection on zmit1016_ed1
{
    key CourseUuid,
    @Search.defaultSearchElement: true
    CourseId,
     @Search.defaultSearchElement: true
    CourseName,
     @Search.defaultSearchElement: true
    CourseLength,
     @Search.defaultSearchElement: true
    Country,
    CurrencyCode,
    LastChangedAt,
    LocalLastChangedAt,
    /* Associations */
    _Country,
    _Currency,
    _Schedule
}
