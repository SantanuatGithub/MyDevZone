trigger leadTrigger on Lead (before insert,before update) 
{
      List<Lead> leads=Trigger.new;
    //MatchingLead matchob=new MatchingLead(); 
    //MatchingLead.matchlead1(leads);
   
   //=====================
   //if(Trigger.isInsert)
   //{
     //Lead [] leads=Trigger.new;
    for(List<Lead> listoflead :[select Id,LastName,MobilePhone,LeadSource,Status,Company from lead])
        {
            for(Integer i=0;i<leads.size();i++)
            {   
                for(Integer j=0;j<listoflead.size();j++)
                {
                     if(leads[i].LastName==listoflead[j].LastName && leads[i].MobilePhone == listoflead[j].MobilePhone)
                     {
                          
                         
                          leads[i].status='Resubmitted';
                         
                           //break;
                           System.debug('IDDDDD-->'+listoflead[j].id);
                          System.debug('DDDDDDDDDDDDDDDDDDDDDDDD'+leads);
                         //leads[0].LastName.addError('Sorry,This is the existing Lead');
                         break;
                     }
                     
                         
                 }
            }
        }
             //} 
      
                         
}