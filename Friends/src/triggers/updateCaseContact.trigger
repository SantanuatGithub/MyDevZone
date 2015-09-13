trigger updateCaseContact on EmailMessage (before insert) {

    Set<string> fromAddressSet = new set<string>();
    Id contactId = '0039000000MohCS';
    List<Case> caseList = new List<case>();
    
    
    /*for(EmailMessage message : trigger.new)
    {
        if(message.FromAddress == 'drsantanu47@gmail.com')
            fromAddressSet.add(message.FromAddress);
    }
    
    caseList = [Select Id,
                       contact 
                       from Case
                       where SuppliedEmail = :fromAddressSet];
    */
    
    caseList = [Select Id,
                       ContactId
                       from Case
                       where Id = :trigger.new[0].parentId];
                       
                       
    for(Case caseObj : caseList)
    {
        caseObj.ContactId = contactId;
    }
    
    try
    {
        update caseList;
    }catch(DMLException ex)
    {
        System.debug(ex.getMessage());
    }
      

}