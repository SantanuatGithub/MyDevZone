trigger AddActiveMember on CampaignMember (after insert) 
{
    set<Id>cmIdSet = new set<Id>();
    set<Id>contactIdSet = new set<Id>();
    set<Id>deleteCampMemberSet = new set<Id>();
    CampaignMember cmObj = new CampaignMember();
    Map<Id,Id> CampMemberMap = new Map<Id,Id>();
    
    for(CampaignMember campMemberObj : trigger.new)
    {
        cmIdSet.add(campMemberObj.Id);
        contactIdSet.add(campMemberObj.ContactId);
        CampMemberMap.put(campMemberObj.ContactId,campMemberObj.Id);
    }
    List <CampaignMember> delcampaignMemberList = new List <CampaignMember>();
    List <CampaignMember> campaignMemberList = [Select Id,CampaignId from CampaignMember where Id IN: cmIdSet];
    List <Contact> activeContactList = [Select Id from Contact where Id IN:contactIdSet and active__c = true];
    List <Contact> inactiveContactList = [Select Id from Contact where Id IN:contactIdSet and active__c = false];
    
    /*for(CampaignMember campaignMemberObj : campaignMemberList)
    {
        for(Contact conObj : activeContactList)
        {
            campaignMemberObj.ContactId = conObj.Id;
        }
    }*/
    if(inactiveContactList.size()>0)
    {
        for(Contact conObj : inactiveContactList)
        {
            deleteCampMemberSet.add(CampMemberMap.get(conObj.Id));
        }
    }
    if(deleteCampMemberSet.size()>0)
    {
        delcampaignMemberList = [Select Id from CampaignMember where ID IN:deleteCampMemberSet];
        if(delcampaignMemberList.size()>0)
        {
            try
            {
                //delete delcampaignMemberList;
                CamPaignPageReference.redirectToCM();
            }catch(DMLException ex)
            {
                System.debug(ex.getMessage());
            }
        }
    }
}