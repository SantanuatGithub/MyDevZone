trigger LeadInsertFromBackend on Lead (before insert) 
{
    List<String> info = new List<String>();
    List<Boolean> bool = new List<Boolean>();
    Integer j = 0;
    for(Integer i=0;i<Trigger.new.size();i++)
    {
        info.add(Trigger.new[i].FirstName);
        info.add(Trigger.new[i].LastName);
        info.add(Trigger.new[i].MobilePhone);
        bool.add(Trigger.new[i].isImported__c);
    }
    Map<String, List<Lead>> leadmap = new Map<String, List<Lead>>();    
    List<Lead> leadlist = new List<Lead>(); 
    
    for(Lead ob : Trigger.new)
    {
        if(ob.isimported__c==True)
        {
    for(Lead c : [Select id,LastName,Firstname,MobilePhone,isImported__c from Lead where LastName IN : info and FirstName IN : info and Mobilephone IN : info])
    {
   
    //if(c.isImported__c == True)
    //{
    Lead leadobj = new Lead();
    leadobj.lastname = c.lastname;
    leadlist.add(leadobj);
    leadmap.put(leadobj.lastname, leadlist); 
    j=1;
    }
    }}

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
  
}