trigger onIntermediate on Intermediate__c (after insert) 
{
    List<Intermediateanother__c> Ianother = new List<Intermediateanother__c>();
    Ianother = [Select Id ,DeletedId__c from Intermediateanother__c]; 
   
    for(List<Intermediate__c> Interlist:[select Name,relatedid__c,DuplicateId__c from Intermediate__c ])
    {
        for(Intermediate__c Inter : Interlist)
        {
           for(List<Lead> duplicateList : [select isExit__c,id,LastName from lead])
           {
               for(Lead l1 : duplicatelist)
               {
                   if( l1.id==Inter.relatedid__c)
                   {
                       System.debug('aaaaaaaaaaaaaaaaaaa');
                       system.debug('asasas'+duplicatelist[0].Lastname);
                       system.debug('Inter.Relatedid__c------------>'+Interlist[0].Relatedid__c);
                       system.debug('L1.id-------->'+duplicateList[0].id);
                       List<Lead>changedList=[Select status from Lead where Id=:Interlist[0].Relatedid__c];                    
                       ChangedList[0].status='Resubmitted';
                                             System.debug('Leader------>'+ChangedList);
                       update ChangedList;
                        
                        System.debug('naaaaaaaaaaaaaaaa-->'+Interlist[0].Name);
                        
                        /*List<Lead>DelList=[Select Id,status,Name,Lastname from Lead where Id=: Ianother[0].deletedId__c];//Id = :InterList[0].DuplicateId__c];
                        delete delList;
                        System.debug('DeletedList-------------->'+dellist);
                         System.debug('Ianother[0].deletedId__c-------------->'+Ianother[0].deletedId__c);
                        */


                    }
               
               }
           
            }
        
        }
    
    }

}