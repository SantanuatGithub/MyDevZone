global class ClsUpdateInactiveAccountBatch implements Database.Batchable<sObject>
{
    List <Account> accountList = new List<account>();
    
    
    global ClsUpdateInactiveAccountBatch()
    {
        
    }
    
   global Database.QueryLocator Start (Database.BatchableContext BC)
   {
     String query  = 'Select Id,Name,Status__c from Account where Status__c = \'Inactive\'';
     return Database.getQueryLocator(query);  
   }
   
   global void execute (Database.BatchableContext BC,List<Account> Scope)
   {
       for(Account acct : Scope)
       {
           acct.Name = acct.Name+'_Inactive';
           accountList.add(acct);
           //update acct;// this is not the best prctice to write the dml statement in for loop
       }
       try
       {
           update accountList; //This is the best prctice to avoid the volume limitation error
       }catch(DMLException ex)
       {
           System.debug(ex.getMessage());
       }
   }
   
   global void finish(Database.BatchableContext BC)
   {
   
   } 
}