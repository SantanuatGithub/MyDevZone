trigger UpdateLead on Lead (before insert) 
{
    List <Lead> leadList = new List<Lead>(); 
        //leadUpdateClass.executeLeadUpdate(Trigger.new,leadlist);
      
    
        leadList = [Select Id,LastName,MobilePhone,LeadSource,Status,Company from lead where LastName =: Trigger.new[0].LastName limit 1];
        if(leadList.size()>0){
            Lead ll = Trigger.new.remove(0);
            /*Lead l2 = new Lead(id=leadList[0].Id, MobilePhone =Trigger.new[i].MobilePhone );
            update l2;*/
        }
     
}