trigger onLeadanother on Lead (after Insert) 
{
    Intermediateanother__c Ianother = new Intermediateanother__c(); 
    
    for( Lead L2 : Trigger.new)
    {
        Ianother.Name=L2.lastName;
        Ianother.deletedid__c=l2.id;
    }
    insert ianother;
}