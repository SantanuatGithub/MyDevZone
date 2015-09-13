public class leadUpdateClass
{
    public static void executeLeadUpdate(List<Lead> newLeadList, List<Lead> existingLeadList)
    {
        for(lead newlead: newLeadList)
        {
            for(lead existinglead : existingLeadList)
            {
                if(newlead.lastName == existinglead.lastName && newlead.MobilePhone == existinglead.MobilePhone)
                {
                   existinglead.status='Resubmitted';
                   try
                   {
                       update existinglead;
                       System.debug('Existinglead--->'+existingLead);
                        
                   }
                   catch(DMLException e)
                   {
                       System.debug('Error--->'+e);
                   }
                }
             }
        }
    
    } 
}