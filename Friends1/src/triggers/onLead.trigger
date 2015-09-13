trigger onLead on Lead (before Insert,after Insert)
{
     Intermediate__c Inter = new Intermediate__c();
     Intermediateanother__c Ianother = new Intermediateanother__c();
     
     for(List<Lead> storedLead :[Select LastName,Id,MobilePhone,isExit__c,status from Lead])
     {
         for(Lead L1:storedLead)
         {
             for(Lead L2:Trigger.new)
             {
                 if(L1.LastName==L2.LastName && L1.MobilePhone==L2.MobilePhone)
                 {
                     Inter.Name = L2.LastName;
                     Inter.LastName__c = L2.LastName ;
                     Inter.Mobilephone__c = L2.MobilePhone;
                     Inter.isExit__c = True;
                     Inter.status__c = L2.status;
                     
                     if(Trigger.isBefore)
                     {
                         Inter.RelatedId__c = L1.Id; 
                     }
                     System.debug('id----------->'+ L1.Id);           
                 } 
             }
         }   
    }  
    insert Inter;
}