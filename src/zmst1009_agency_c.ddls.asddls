@EndUserText.label: 'cds for agency data consumption'
@ObjectModel.query.implementedBy: 'ABAP:ZAGENCY_CONSUMPTION'
@Search.searchable: true
define custom entity zmst1009_agency_c
 
{

@UI.facet: [{  
                id: 'Agency',
                purpose: #STANDARD,
                label: 'student reference',
                type: #IDENTIFICATION_REFERENCE
    
               }]

@OData.property.valueControl: 'AgencyId_vc'
 @UI.selectionField: [{ position: 10 }]
    @UI. lineItem: [{position: 10, label: 'Agency Id'}]
    @UI.identification: [{position: 10, label: 'Agency Id'}]
@Search.defaultSearchElement: true
  key AgencyId : abap.numc(6);
  AgencyId_vc : rap_cp_odata_value_control;
  
  @OData.property.valueControl: 'Name_vc'
  @Search.defaultSearchElement: true
  @UI.selectionField: [{ position: 20 }]
    @UI. lineItem: [{position: 20, label: 'Name'}]
    @UI.identification: [{position: 20, label: 'Name'}]
  Name : abap.char(31);
  Name_vc: rap_cp_odata_value_control;
  
   @OData.property.valueControl: 'Street_vc'
   @Search.defaultSearchElement: true
   @UI.selectionField: [{ position: 30 }]
    @UI. lineItem: [{position: 30, label: 'Street'}]
    @UI.identification: [{position: 30, label: 'Street'}]
  Street: abap.char(30);
  Street_vc: rap_cp_odata_value_control;
  
   @OData.property.valueControl: 'PostalCode_vc'
   @Search.defaultSearchElement: true
   @UI.selectionField: [{ position: 40 }]
    @UI. lineItem: [{position: 40, label: 'PostalCode'}]
    @UI.identification: [{position: 40, label: 'PostalCode'}]
  PostalCode: abap.char(10);
  PostalCode_vc: rap_cp_odata_value_control;
  
   @OData.property.valueControl: 'City_vc'
   @UI.selectionField: [{ position: 50 }]
    @UI. lineItem: [{position: 50, label: 'City'}]
    @UI.identification: [{position: 50, label: 'City'}]
  City: abap.char(25);
  City_vc: rap_cp_odata_value_control;
  
   @OData.property.valueControl: 'Country_vc'
   @UI.selectionField: [{ position: 60 }]
    @UI. lineItem: [{position: 60, label: 'Country'}]
    @UI.identification: [{position: 60, label: 'Country'}]
  Country: abap.char(3);
  Country_vc: rap_cp_odata_value_control;
  
   @OData.property.valueControl: 'PhoneNumber_vc'
   @UI.selectionField: [{ position: 70 }]
    @UI. lineItem: [{position: 70, label: 'PhoneNumber'}]
    @UI.identification: [{position: 70, label: 'PhoneNumber'}]
  PhoneNumber: abap.char(30);
  PhoneNumber_vc: rap_cp_odata_value_control;
  
   @OData.property.valueControl: 'WebAddress_vc'
   @UI.selectionField: [{ position: 80 }]
    @UI. lineItem: [{position: 80, label: 'WebAddress'}]
    @UI.identification: [{position: 80, label: 'WebAddress'}]
  WebAddress: abap.char(255);
  WebAddress_vc: rap_cp_odata_value_control;
  
}
