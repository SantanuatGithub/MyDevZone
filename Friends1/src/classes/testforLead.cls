@isTest
private class testforLead
{
static testMethod void testchecker()
{
    Contact c=new Contact(LastName='Santanu');
    insert c; 
    Account a=new Account(Name='Jagannathda');
    insert a;
    Lead l=new Lead(LastName='Santanu,Jagganathda,Subrata',company='a,b,c');
    insert l;
    List<Lead> l1=[select LastName from Lead];    
    Integer test=0;
        
    List<Contact> testlistofcontact=[select LastName from Contact where LastName='Santanu'];
    List<Account> testlistofaccount=[select Name from Account where Name='Jagannathda'];
    List<Converting__c> testlistofdummy;
    
    
    for(Integer i=0;i<l1.size();i++)
         {
             for(Integer j=0;j<testlistofcontact.size();j++)
             {
                 if(l1[i].lastname==testlistofcontact[j].lastname)
                 {
                     test=1;
                     break;
                     
                 }
             }
             if(test==0||test!=1) 
             {
                 for(Integer k=0;k<testlistofaccount.size();k++)
                 {
                      if(l1[i].lastname==testlistofaccount[k].name)
                      {
                          System.debug('HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH');
                          //newLeads[0].LastName.addError('Sorry,Last Name should not match with the Name of Account');
                      }
                      test=2;
                  }
                  if(test==2)
                  {
                         testlistofaccount[0].name=l1[i].lastname;
                         //System.debug('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb'+newleads[0].lastname);
                         test=3;
                         break;
                  }                                                                       
             }
         }             
         if(test==0)
         {
              Converting__C cob=new Converting__C(Your_name__C=l1[0].lastname);
              insert cob;
         }
         if(test==1)
         {
                        Account ac=new Account();
                        ac.Name=l1[0].lastname;
                        insert ac; 
         }
        
    }
}