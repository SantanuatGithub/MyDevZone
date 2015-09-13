public class forLead
{
        
    public void checker(List<Lead> newleads)   //newleads List takes the leads from CSV file
    {
        //Variable Declaration
        
        List<Contact> listofcontact=[select LastName from Contact ];
        List<Account> listofaccount=[select Name from Account];
        List<Converting__c> listofdummy; 
        Integer test=0; 
        
        //Loop 
              
        for(Integer i=0;i<newleads.size();i++)
         {
             for(Integer j=0;j<listofcontact.size();j++)
             {
                 //Checking the Lastname of Contact with the Lastname of Lead
                              
                 if(newleads[i].lastname==listofcontact[j].lastname) //IF TRUE  
                 {
                     System.debug('hhhhhhhheeeeellllpppppppxxxxxxxx'+newleads[0].lastname);
                     test=1;
                     break;
                     
                 }
             }
             if(test==0||test!=1)
             { 
                 for(Integer k=0;k<listofaccount.size();k++)
                 {
                      //System.debug('asdasdasdasdadsadsad'+listofaccount[k].name);
                      //Checking the Name of Account with the Lastname of Lead
                  
                      if(newLeads[i].lastname==listofaccount[k].name) //IF TRUE
                      {
                          System.debug('HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH');
                          newLeads[0].LastName.addError('Sorry,Last Name should not match with the Name of Account');
                      
                      }
                      test=2;
                  }    
                  if(test==2)
                  {
                         listofaccount[0].name=newleads[i].lastname;
                         System.debug('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb'+newleads[0].lastname);
                         test=3;
                         break;
                  }                                                                       
             
             }
         }             
         if(test==1)
         {
              Converting__C cob=new Converting__C(Name=newleads[0].lastname);
              insert cob;
         }
         if(test==3)
         {
                        Account a=new Account();
                        a.Name=newleads[0].lastname;
                        insert a; 
         }
        
    }

    public void matchlead(List<Lead> newleads)
    {
         List<Lead> listoflead=[select LastName,MobilePhone,LeadSource,Status from lead];
        
         for(Integer i=0;i<newleads.size();i++)
         {
             for(Integer j=0;j<listoflead.size();j++)
             {
                 if(newleads[i].LastName==listoflead[j].LastName&&newleads[i].MobilePhone==listoflead[j].MobilePhone)
                 {
                     newLeads[0].LastName.addError('Sorry,Now I am checking you');
                          
                 }
             }
         }

                                       
    }
}