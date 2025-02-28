@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds for input data'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zmst1009_cds_data as select from zmst1009_data

{

 @UI.facet: [
        { 
            id: 'Input',
            purpose: #STANDARD,
            type: #IDENTIFICATION_REFERENCE,
            label: 'Master Data',
            position: 10
           // url: 'Studentimage'
          
      }
      ]
      @UI.hidden: false
     @UI: { 
        lineItem: [{position: 10, label: 'Company code'}],
        identification: [{position: 10, label: 'Company code'}],
        selectionField: [{position: 10}]  
    }
    key companycode as Companycode,
    
     @UI: { 
        lineItem: [{position: 20, label: 'Journal entry'}],
        identification: [{position: 20, label: 'Journal entry'}] ,
        selectionField: [{position: 20}]
    }
    key journalentry as Journalentry,
    
    @UI: { 
        lineItem: [{position: 30, label: 'fiscal year'}],
        identification: [{position: 30, label: 'fiscal year'}],
         selectionField: [{position: 20}] 
    } 
    key fiscalyear as Fiscalyear,
    
     @UI: { 
        lineItem: [{position: 40, label: 'Lineitem id'}],
        identification: [{position: 40, label: 'Line item id'}] ,
         selectionField: [{position: 40}]
    } 
    key lineitemid as Lineitemid,
    
     @UI: { 
        lineItem: [{position: 50, label: 'Posting view item'}],
        identification: [{position: 50, label: 'Posting view item'}],
         selectionField: [{position: 50}] 
    } 
    key postingviewitem as Postingviewitem,
    
     @UI: { 
        lineItem: [{position: 60, label: 'Currency'}],
        identification: [{position: 60, label: 'Currency'}],
         selectionField: [{position: 60}] 
    } 
    currency as Currency ,
    
     @UI: { 
        lineItem: [{position: 70, label: 'Transaction key'}],
        identification: [{position: 70, label: 'Transaction key'}],
         selectionField: [{position: 70}] 
    } 
    transactionkey as Transactionkey,
    
     @UI: { 
        lineItem: [{position: 80, label: 'Financial account type'}],
        identification: [{position: 80, label: 'Financial account type '}],
         selectionField: [{position: 80}] 
    } 
    financialaccounttype as Financialaccounttype
    //_association_name // Make association public
    
     }
     group by companycode, journalentry, fiscalyear, postingviewitem, lineitemid, transactionkey, currency,financialaccounttype;
