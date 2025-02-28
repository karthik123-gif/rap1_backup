@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds for file upload'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zmst109_file1 as select from zmst1009_file

{
    @UI.facet: [{  
                id: 'Attachment',
                purpose: #STANDARD,
                label: 'Attachment reference',
                type: #IDENTIFICATION_REFERENCE
    
               }]
               @EndUserText.label: 'Attachment Id'
          @UI: {
          lineItem: [{position: 10, label: 'Attachment Id'}],
         identification: [{position: 10, label: 'Attachment Id'}] ,
         selectionField: [{position: 10}]
         
      }      
        key  attachment_id as AttachmentId,
//         @UI: {
//          lineItem: [{position: 20, label: 'customerId'}],
//         identification: [{position: 20, label: 'customerId'}] ,
//         selectionField: [{position: 20}]
//      }
//        key customer_uuid as customerId ,
        @EndUserText.label: 'Student Id'
         @UI: {
          lineItem: [{position: 20, label: 'Student Id'}],
         identification: [{position: 20, label: 'Student Id'}] ,
         selectionField: [{position: 20}]
      }
        key id as Id,
         @UI: {
          lineItem: [{position: 30, label: 'Comments'}],
         identification: [{position: 30, label: 'Comments'}] ,
         selectionField: [{position: 30}]
      }
        comments as Comments,
        @Semantics.largeObject:{
        mimeType: 'MimeType',
        fileName: 'Filename',
        contentDispositionPreference: #INLINE
       // acceptableMimeTypes: [ 'application/pdf' , 'image/png', 'image/jpeg' ]
        }
        @UI.fieldGroup: [{ qualifier: 'upload' }]
         @UI: {
          lineItem: [{position: 40, label: 'Attachment'}],
         identification: [{position: 40, label: 'Attachment'}] ,
         selectionField: [{position: 40}]
      }
        attachment as Attachment,
//         @UI: {
//          lineItem: [{position: 50, label: 'Mime type'}]
////         identification: [{position: 50, label: 'Mime type'}] ,
////         selectionField: [{position: 50}]
//      }
        @Semantics.mimeType: true
        mimetype as Mimetype,
//         @UI: {
////          lineItem: [{position: 60, label: 'File name'}],
////         identification: [{position: 60, label: 'File name'}] ,
//         selectionField: [{position: 60}]
//      }
        filename as Filename
        
        }
       
        //_association_name // Make association public
    
