@EndUserText.label: 'cds for consuming data from web api'
//@ObjectModel.query.implementedBy: 'ABAP:ZCL_CE_GET_PRODUCTS'
@ObjectModel.query.implementedBy: 'ABAP:ZMST1009_WEBAPI'
@Search.searchable: true
define custom entity zmst1009_consumption

{
@UI.facet: [{  
                id: 'Product',
                purpose: #STANDARD,
                label: 'student reference',
                type: #IDENTIFICATION_REFERENCE
    
               }]

 @UI.selectionField: [{ position: 10 }]
    @UI. lineItem: [{position: 10, label: 'Product'}]
    @UI.identification: [{position: 10, label: 'Product'}]
    @Search.defaultSearchElement: true

 key Product                 : abap.char( 10 );
      @OData.property.valueControl: 'ProductType_vc'
       @UI.selectionField: [{ position: 20 }]
    @UI. lineItem: [{position: 20, label: 'Product Type'}]
    @UI.identification: [{position: 10, label: 'Product Type'}] 
     @Search.defaultSearchElement: true
      ProductType             : abap.char( 2 );
      ProductType_vc          : rap_cp_odata_value_control;
      
      @OData.property.valueControl: 'ProductCategory_vc'
      ProductCategory         : abap.char( 40 );
      ProductCategory_vc      : rap_cp_odata_value_control;
      @OData.property.valueControl: 'CreatedByUser_vc'
      CreatedByUser           : abap.char( 10 );
      CreatedByUser_vc        : rap_cp_odata_value_control;
      @OData.property.valueControl: 'CreationDateTime_vc'
      CreationDateTime        : tzntstmpl;
      CreationDateTime_vc     : rap_cp_odata_value_control;
      @OData.property.valueControl: 'LastChangedByUser_vc'
      LastChangedByUser       : abap.char( 10 );
      LastChangedByUser_vc    : rap_cp_odata_value_control;
      @OData.property.valueControl: 'LastChangedDateTime_vc'
      LastChangedDateTime     : tzntstmpl;
      LastChangedDateTime_vc  : rap_cp_odata_value_control;
      @OData.property.valueControl: 'Price_vc'
      @Semantics.amount.currencyCode: 'Currency'
       @UI.selectionField: [{ position: 30 }]
    @UI. lineItem: [{position: 30, label: 'Price'}]
    @UI.identification: [{position: 30, label: 'Price'}]
     @Search.defaultSearchElement: true
      Price                   : abap.curr( 16, 2 );
      Price_vc                : rap_cp_odata_value_control;
      @OData.property.valueControl: 'Currency_vc'
      @Semantics.currencyCode : true
       @UI.selectionField: [{ position: 40 }]
    @UI. lineItem: [{position: 40, label: 'Currency'}]
    @UI.identification: [{position: 40, label: 'Currency'}]
      Currency                : abap.cuky;
      Currency_vc             : rap_cp_odata_value_control;
      @OData.property.valueControl: 'Height_vc'
      @Semantics.quantity.unitOfMeasure: 'DimensionUnit'
      @UI.selectionField: [{ position: 40 }]
    @UI. lineItem: [{position: 40, label: 'Currency'}]
    @UI.identification: [{position: 40, label: 'Currency'}]
      
      Height                  : abap.dec( 13, 3 );
      Height_vc               : rap_cp_odata_value_control;
      @OData.property.valueControl: 'Width_vc'
      @Semantics.quantity.unitOfMeasure: 'DimensionUnit'
      Width                   : abap.dec( 13, 3 );
      Width_vc                : rap_cp_odata_value_control;
      @OData.property.valueControl: 'Depth_vc'
      @Semantics.quantity.unitOfMeasure: 'DimensionUnit'
      Depth                   : abap.dec( 13, 3 );
      Depth_vc                : rap_cp_odata_value_control;
      @OData.property.valueControl: 'DimensionUnit_vc'
      @Semantics.unitOfMeasure: true
      DimensionUnit           : abap.unit( 3 );
      DimensionUnit_vc        : rap_cp_odata_value_control;
      @OData.property.valueControl: 'ProductPictureURL_vc'
      ProductPictureURL       : abap.char( 255 );
      ProductPictureURL_vc    : rap_cp_odata_value_control;
      @OData.property.valueControl: 'ProductValueAddedTax_vc'
      ProductValueAddedTax    : abap.int1;
      ProductValueAddedTax_vc : rap_cp_odata_value_control;
      @OData.property.valueControl: 'Supplier_vc'
      @UI.selectionField: [{ position: 50 }]
    @UI. lineItem: [{position: 50, label: 'Supplier'}]
    @UI.identification: [{position: 40, label: 'Supplier'}]
      
      Supplier                : abap.char( 10 );
      Supplier_vc             : rap_cp_odata_value_control;
      @OData.property.valueControl: 'ProductBaseUnit_vc'
      ProductBaseUnit         : abap.char( 3 );
      ProductBaseUnit_vc      : rap_cp_odata_value_control;
      @OData.property.valueControl: 'Weight_vc'
      @Semantics.quantity.unitOfMeasure: 'WeightUnit'
      Weight                  : abap.dec( 13, 3 );
      Weight_vc               : rap_cp_odata_value_control;
      @OData.property.valueControl: 'WeightUnit_vc'
      @Semantics.unitOfMeasure: true
      WeightUnit              : abap.unit( 3 );
      WeightUnit_vc           : rap_cp_odata_value_control;
      @OData.property.valueControl: 'OriginalLanguage_vc'
      OriginalLanguage        : abap.char( 2 );
      OriginalLanguage_vc     : rap_cp_odata_value_control;
}
