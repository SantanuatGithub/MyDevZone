public  class MatchingLead
{
    public static void matchlead1(List<Lead> newleads)
    {
        System.debug('newleads--'+newleads);
        //List<Lead> listoflead = [select LastName,MobilePhone,LeadSource,Status,Company from lead];
        //List<Lead> list2Insert = new List<lead>();
        //List<Lead> list2Update = new List<lead>();
          List<Lead> duplicatelist=new List<Lead>();
                    
           
        for(List<Lead> listoflead :[select LastName,MobilePhone,LeadSource,Status,Company from lead])
        {
            for(Integer i=0;i<newleads.size();i++)
            {   
                for(Integer j=0;j<listoflead.size();j++)
                {
                     if(newleads[i].LastName==listoflead[j].LastName && newleads[i].MobilePhone == listoflead[j].MobilePhone)
                     {
                        
                        
                        
                           
                         System.debug('DDDDDDDDDDDDDDDDDDDDDDDD'+duplicatelist);
                         newleads[0].LastName.addError('Sorry,This is the existing Lead');
                     }
                 }
            }
        }
          
              }
}


/*duplicatelist[0].MobilePhone=newleads[0].MobilePhone;
                         duplicatelist[0].Company=newleads[0].Company;
                         duplicatelist[0].Status='Resubmitted';*/