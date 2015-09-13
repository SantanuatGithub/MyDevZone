public class MatchingLead2
{
    public void matchlead(List<Lead> newleads)
    {
        Integer test=0;
        List<Lead> listoflead=[select LastName,MobilePhone,LeadSource,Status,Company from lead];
        for(Integer i=0;i<newleads.size();i++)
         {
             for(Integer j=0;j<listoflead.size();j++)
             {
                 if(newleads[i].LastName==listoflead[j].LastName&&newleads[i].MobilePhone==listoflead[j].MobilePhone)
                 {
                     //newLeads[0].LastName.addError('Sorry,Now I am checking you');
                     test=1;
                     
                     break;      
                 }
             }
         }
         if(test==1)
         {
           
              List<Lead> equallead=[Select id,status from Lead where LastName=:newleads[0].LastName]; 
             // equallead.status='Resubmitted';
              System.debug('XXXXXXXXXXXXXXXXXXXXXXXXX'+equallead);
              listoflead[0].status='Resubmitted';
              update listoflead;
                            //update equallead;

         }
         if(test==0)
         {
             newLeads[0].LastName.addError('Sorry,Now I am checking you for false');
         }
                  
         
    }
}