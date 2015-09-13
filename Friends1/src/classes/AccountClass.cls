public class AccountClass
{
    //List<Account> Ac = new List<Account>();
    public void method(){
    List<Account> Ac  = [Select Id,Name,AnnualRevenue,Modified_amount__c from Account where AnnualRevenue>100];// name='Thereja'];
    for(Integer i = 0;i<Ac.size();i++)
        {
                Ac[i].Modified_amount__c = Ac[i].AnnualRevenue;
       
        }
        update Ac;   
        }
}