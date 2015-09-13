trigger cancelDelete on Connect__c (before delete) 
{
    for(Connect__c con : Trigger.old)
    {
        con.addError('You can not delete any contact . For Getting any information Please contact to System Administrator.');
    }
}