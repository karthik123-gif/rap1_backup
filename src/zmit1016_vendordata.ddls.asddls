@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'vendor data'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZMIT1016_vendordata as select from zmit1016_vendor
{
          key vendorid  ,
           vendorname ,
           vendorno  ,
           vendorcity ,
           vendorcountry, 
         vendorwork    
}
