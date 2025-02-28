@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds  for drop down'
@Metadata.ignorePropagatedAnnotations: true


define root view entity zv_section as select from  zmst1009_student
{
     
    key min(section_1) as section1,
    
   // MIN(section_1) ensures a single value per group.
   //This satisfies the unique key requirement.
   //  key distinct section_1 as section1
   case 
        when section_1 = 'A' then 'A'
        when section_1 = 'B' then 'B'
        when section_1 = 'C' then 'C'
        else null
    end as section_validation
    
}
  where section_1 = 'A' or section_1 = 'B' or section_1 = 'C'
  
group by section_1

