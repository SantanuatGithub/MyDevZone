public with sharing class ClsCustomizeAccount {

    public String feedback{get;set;}

    public ClsCustomizeAccount(ApexPages.StandardController controller) {
        
    }
    
    Public Pagereference AccountSaving()
    {
          if((String.isBlank(feedback)))
          {
              ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL,'Blank Field')); 
           }
          return null;
    }

}