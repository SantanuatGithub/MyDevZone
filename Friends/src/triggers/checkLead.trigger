trigger checkLead on Lead (before insert,before update) 
{

    List<Lead> comingLead=Trigger.new;
    List<MarketingActivity__c> activityList=new List<MarketingActivity__c>();
    activityList=[select Name from MarketingActivity__c];
    
    for(List<Lead> storeLead:[Select LastName from lead])
    {
        for(Integer i=0;i<comingLead.size();i++)
        {
            for(Integer j=0;j<storeLead.size();j++)
            {
                if(comingLead[i].LastName==storeLead[j].LastName)
                {
                    List<Lead>oldlead=[select id from Lead where LastName=:comingLead[i].LastName];
                    List<LeadActivity__c> junction=[Select LeadName__c, LeadName__r.Id, MarketingActivityName__c,MarketingActivityName__r.Name  from LeadActivity__c where  LeadName__r.Id=:oldLead[0].Id];                    
                    if(junction.size()<=0)
                    {
                        System.debug('Inner');
                        cominglead[i].Lastname.adderror('Sorry,You have no marketing activity');
                    }
                    //List<MarketingActivity__c> mact=[Select Name from MarketingActivity__c where id=:junction[0].MarketingActivityName__c];
                    //System.debug('oldlead id------------------>'+oldLead[0].Id);
                    System.debug('LeadActivity----------jj------->'+junction);
                    //System.debug('Marketing Activity Name------------->'+mact[0].Name);
                   
                }
            }
        } 
    }

}