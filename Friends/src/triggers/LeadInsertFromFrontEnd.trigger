trigger LeadInsertFromFrontEnd on Lead (before insert) 
{
       List<String> name = new List<String>();
        List<Lead> StoredList = new List<Lead>();
        
        String LN = Trigger.new[0].Lastname ;
        String MP = Trigger.new[0].MobilePhone ;
        String FN =  Trigger.new[0].FirstName;
        
         List<Lead> ListOfLeads = new List<Lead>();       
         ListOfLeads  = [Select Lastname,Firstname,Status,isDuplicate__c,isImported__c from Lead where LastName = :LN and FirstName = :FN and MobilePhone = :MP ];
         for(Lead l:Trigger.new)
         {
         if(l.isImported__c!=True && Listofleads.size()>0)
         {  
         
           
         System.debug('List------------>'+ListOfLeads);
         
             System.debug('YYYYYEEEEEEEESSSSSSSSS');
             //ListofLeads[0].isDuplicate__c = True;
             for(Lead obj :Trigger.new)
             {
                 obj.isDuplicate__c = True;
                 

             }
             
         }           
        }
        if(listofleads.size()==0)
        {
        for(Lead Lob : Trigger.new)
        {
            Lob.isImported__c = false;
        }
        }
}