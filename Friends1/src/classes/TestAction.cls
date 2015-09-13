public with sharing class TestAction {

//public ID takerId{get;set;}

    public TestAction(ApexPages.StandardController controller) {

    }
    public PageReference CheckTakerId()
    {
        System.debug('INNNNNNNNNNNNNNNN');
        String takerID = System.CurrentPageReference().getParameters().get('firstParam');
        System.debug('takerID---->'+takerID);
        return null;
    }

}