trigger LeadInsertFromUI on Lead (before Insert)
{
            List<String> name = new List<String>();
    
    List<Lead> StoredList = new List<Lead>();
    
    String LN = Trigger.new[0].Lastname ;
    String MP = Trigger.new[0].MobilePhone ;
    /*for(Integer i = 0 ; i< Trigger.new.size() ; i++)
    { 
        Name.add(Trigger.new[0].LastName);
        Name.add(Trigger.new[0].MobilePhone);
    }*/
    
    Map<String, List<Lead>> Leadmap  = new Map<String, List<Lead>>();
    Map<String, List<Lead>> Leadmap1 = new Map<String, List<Lead>>();

    for( List<Lead> O : [Select Id,LastName,MobilePhone,isDuplicate__c,Status from Lead where LastName =: LN ])
    {
       for(Integer i = 0; i< O.size(); i++)
       {
           //List<Lead> L1 = [Select Id,LastName,MobilePhone,Status from Lead where MobilePhone = :O[i].MobilePhone ];
          
          if(O[i].MobilePhone  == MP ){
              
          
              
                  
        Lead Lob = new Lead();
        Lob.lastname = O[i].lastname;
        Lob.mobilephone = O[i].MobilePhone;

        StoredList.add(Lob);

        Leadmap.put(Lob.lastname, StoredList); 
        Leadmap1.put(Lob.MobilePhone,StoredList);
        
        for(Lead Lob1 : Trigger.new)
        {
        if(Leadmap.containsKey(Lob1.lastname) && Leadmap1.containsKey(Lob1.Mobilephone))
        {
                System.debug('LastName & Id--------->'+O[i].Lastname+' ' +O[i].id);
               // if(O.size()>0)
                {
                //<<will keep this code>>Lob1.lastname.addError('Sorry,This  record is duplicate Please Click on Name for update (duplicate : <a href ="/'+O[i].id+'" > '+ O[i].LastName +'--'+O[i].Mobilephone+ '</a>)');
                Lob1.isDuplicate__c=True;
                }
                //else
                {
                 
                     //String Link = '<a href ="/'+O[i].id+'" > '+ O[i].LastName +'--'+O[i].Mobilephone+ '</a>'    
                }
                //Lob1.lastname.addError('A record is duplicate (duplicate : <a href ="/apex/duplicatelist" onClick=show()><Script Language ="JavaScript"> function show(){alert("hi");}</scipt> '+ O[i].LastName +'--'+O[i].Mobilephone+ '</a>)');
                 // Lob1.lastname.addError('A record is duplicate (duplicate : <a href ="/'+O[i].id+'" onClick = "show()" ><script type="text/javascript">function show(){for(int k =0;k<3;k++){ alert("Pagla tumi to bhaloi khel dekhale"+k);}}</script> '+ O[i].LastName +'--'+O[i].Mobilephone+ '</a>)');

        }

    }
    }}}
                 
    
//Lead Lob = new Lead();   
/*List<Lead> StoredList = Trigger.new; 
System.debug('asasdasd'+StoredList[0].LastName );
 Lead Lob = [Select Id,LastName,MobilePhone,Status from Lead where LastName = :StoredList[0].LastName ];

if(Lob.LastName == Trigger.new[0].LastName && Lob.MobilePhone == Trigger.new[0].MobilePhone)
{
    Trigger.new[0].Lastname.addError('A record is duplicate (duplicate : <a href ="/'+Lob.id+'" > '+Lob.LastName +'--'+Lob.Mobilephone+ '</a>)');
}
*/   
}