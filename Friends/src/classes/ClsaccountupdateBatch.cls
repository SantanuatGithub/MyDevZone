global class ClsaccountupdateBatch implements Database.Batchable<sObject>
{
    List<account> accountList = new List<Account>();
    global ClsaccountupdateBatch ()
    {
    }
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        String query = 'SELECT Id,Name,Active__c FROM Account where status__c = \'Inactive\'';
        return Database.getQueryLocator(query);
    }
  
    global void execute(Database.BatchableContext BC, List<Account> scope)
    {
         for(Account acct : scope)
         {
             acct.Name = acct.Name + '_Inactive';
             accountList.add(acct);
             
         }
         try
         {
             update accountList;
         }catch(Exception ex)
         {
             System.debug(ex.getmessage());
         }
    }  
    global void finish(Database.BatchableContext BC)
    {
    }
}