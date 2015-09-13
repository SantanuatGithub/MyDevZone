public with sharing class ClsShowContact {

    public boolean showContactTable { get; set; }

    public List<Contact> conList { get; set; }

    public String conId { get; set; }
   
    public pagereference queryContact()
    {
        if(conId!= NULL){}
             conList = [Select Associate_Id__c,
                                            Lastname,
                                            Department,
                                            Phone
                                            from Contact
                                            where Associate_Id__c =:conId];
            if(conList.size()>0)
                showContactTable = true;
             else
                 showContactTable = false;
            System.debug('conList-------->'+conList);
            return null;
    }
}