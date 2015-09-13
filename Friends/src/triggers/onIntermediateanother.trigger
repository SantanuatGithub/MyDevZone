trigger onIntermediateanother on Intermediateanother__c (after Insert) 
{

     for(List<Intermediateanother__c> Ianotherlist : [Select Id ,DeletedId__c from Intermediateanother__c])
     {
          for(Intermediateanother__c Ianother :  Ianotherlist)
          {
               for(List<Lead> duplicateList : [select isExit__c,id,LastName from lead])
               {
                   for(Lead l1 : duplicatelist)
                   {
                        if(l1.id == Ianother.deletedid__c)
                        delete L1;
                    
                   }
               }
           
           }   
     } 
}