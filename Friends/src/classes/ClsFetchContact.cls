global class ClsFetchContact
{
      webservice static Id fetchContactId(Id caseId)
      {
          Case caseObj = [Select ContactId
                                  from Case
                                  where Id =:caseId];
          
        return caseObj.ContactId;
      }
}