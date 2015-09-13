public without sharing class AccountLocker {
    public AccountLocker(ApexPages.StandardController controller) {

    }



    private String accountId; 
    List<AccountTeammember> accteammemberList = new List<AccountTeammember>();
    List<User> userList = new List<User>();
    List<AccountShare> accountshareList = new List<AccountShare>();
    List<AccountShare> accountsharingList= new List<AccountShare>();
    public List<User> getUserList()
    {
        return userList;
    }
   /* public AccountLocker(ApexPages.StandardController controller) 
    {
       accountId = ApexPages.currentPage().getParameters().get('accId');
       system.debug('accid------------>'+accountId);
        accteammemberList = [select Id,
                                    UserId
                                    from AccountTeammember 
                                    where AccountId = :accountId
                            ];
         accountshareList  = [select Id,
                                    UserOrGroupId,
                                    AccountAccessLevel 
                                    from AccountShare 
                                    where AccountId = :accountId
                            ];
                                           
        if(accteammemberList.size()>0)
        {
           for(AccountTeammember accteammember : accteammemberList )
           {
                   userList = [Select Id,
                                      Name 
                                      from User 
                                      where Id = :accteammember.UserId
                               ]; 
           }
        }
         
    }*/
  public void onload()
  {
       accountshareList  = [select Id,
                                    UserOrGroupId,
                                    AccountAccessLevel 
                                    from AccountShare 
                                    where AccountId = '00190000003y9VM'
                            ];
                            System.debug('accList----------->'+accountshareList);
                             accountshareList[0].AccountAccessLevel='Read';
        update accountshareList;
          

  }
}