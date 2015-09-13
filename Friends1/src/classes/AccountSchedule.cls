global class AccountSchedule implements Schedulable
{
    global void execute(Schedulablecontext sc)
    {
        List<Account> Ac = new List<Account>();
         List<Account> Ac1 = new List<Account>();
        Ac = [Select Id,Name,AnnualRevenue,Modified_amount__c from Account where AnnualRevenue>100];// name='Thereja'];
        /*if(Ac[0].AnnualRevenue>100)
        Ac[0].Modified_amount__c = Ac[0].AnnualRevenue;
        update Ac;
        */
        for(Integer i = 0;i<Ac.size();i++)
        {
                Ac[i].Modified_amount__c = Ac[i].AnnualRevenue;
                Ac1.add(Ac[i]);
       
        }
        update Ac1;
     }
}