public with sharing class Checking 
{
    public Checking(ApexPages.StandardController controller) {}
    
    public string LastName{set;get;}  
    public string MobilePhone{set;get;}      
    public string Company{set;get;}  
    public string Status{set;get;}    
    
        
    Lead Lob = new Lead();
    
    ///// There is No problem if List contains greater than 1000 ////    
    public pageReference Save1()   
    {
        List<String> name = new List<String>();
        List<Lead> StoredList = new List<Lead>();
        
        name.add(LastName);
        
        Map<String, List<Lead>> Leadmap = new Map<String, List<Lead>>();
        Map<String, List<Lead>> Leadmap1 = new Map<String, List<Lead>>();



        for( Lead L : [Select Id,LastName,MobilePhone,Status from Lead where LastName IN : Name ])
        {
            Lead Lob = new Lead();
            Lob.lastname = L.lastname;
            Lob.mobilephone = L.MobilePhone;
            
            StoredList.add(Lob);
            
            Leadmap.put(Lob.lastname, StoredList); 
            Leadmap1.put(Lob.MobilePhone,StoredList);

            if(Leadmap.containsKey(lastname) && Leadmap1.containsKey(Mobilephone))
            {
                
                    L.Status='Resubmitted';
                    Update L;
                    return new pagereference('/'+ l.id);
       

                
            }
                      
              

        }



        //////////// If List Contain less than 1000 contents then///////////////////

        /*
        List<Lead> StoredList  = [Select Id,LastName,MobilePhone from Lead];
        Integer j;
        for(Integer i = 0 ; i< StoredList.size() ; i++)
        {
            if(LastName == StoredList[i].LastName && MobilePhone == StoredList[i].MobilePhone)
            {
                //return new PageReference('http://www.Google.com');
                Lob = [Select Id,LastName,MobilePhone from Lead where LastName = : StoredList[i].LastName ];            
                 Lob.Status='Resubmitted';
                System.debug('List---------->'+Lob);
                j=1;
            }
            else
            {
             
            }  
        }
        if(j==1)
        { 
        Update Lob;
        return new pagereference('/'+ lob.id);
        }*/
               
               //if(StoredList.Size()==0)
               {
               Lob.LastName = LastName;
               Lob.MobilePhone = MobilePhone;
               Lob.Company = Company;
               Lob.Status = Status; 
               
               insert Lob;
               System.debug('Tessssssssssssssssttttttttttttt');
               return new PageReference('/'+Lob.id);
               }

        return null;   
    }
   
   }