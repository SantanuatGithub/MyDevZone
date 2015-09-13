trigger LeadInsert on Lead (before Insert) 
{
    List<String> info = new List<String>();
    Integer j = 0;
    for(Integer i=0;i<Trigger.new.size();i++)
    {
        info.add(Trigger.new[i].FirstName);
        info.add(Trigger.new[i].LastName);
        info.add(Trigger.new[i].MobilePhone);
    }
    Map<String, List<Lead>> leadmap = new Map<String, List<Lead>>();    
    List<Lead> leadlist = new List<Lead>(); 
    
    List<Lead> ListOfLeads=[Select id,LastName,Firstname,MobilePhone,isImported__c from Lead where LastName IN : info and FirstName IN : info and Mobilephone IN : info];
 
    
    for(Lead ob : Trigger.new)
    {
        if(ob.isimported__c==True && ListOfLeads.size()>0)
        {
            for(Lead c : ListOfLeads)
            {
                Lead leadobj = new Lead();
                leadobj.lastname = c.lastname;
                leadlist.add(leadobj);
                leadmap.put(leadobj.lastname, leadlist); 
                j=1;
            }
        }
        if(ob.isimported__c!=True && ListOfLeads.size()>0)
        {
            for(Lead obj :Trigger.new)
            {
                 obj.isDuplicate__c = True;
            }
        }
    }

    if(j==1)
    {
        for(Lead l : trigger.new)
        {
            if(leadmap.containsKey(l.lastname))
            {
                l.lastname.addError('Duplicate Lead');
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