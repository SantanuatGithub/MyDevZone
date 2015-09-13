public with sharing class createrows {

    public decimal tuitionAmount {get;set;}
    public String transMethod{get;set;}


    
    public createrows(ApexPages.StandardController controller) {}
    
    public class ABC
    {
        public decimal tuitionAmount {get;set;}
        public String transMethod{get;set;}
    }
    //List<ABC> Listofrows{get;set;} 
    List<ABC>ListofRows = new List<ABC>();
    public List<ABC> getListofRows()
    {
        return ListofRows;
    }
    /*public pagereference addRow1()
    {
        ABC ob = new ABC();
        ob.tuitionAmount = 60.2;
        ob.transMethod = '';
        ListofRows.add(ob);
        return null;
    }*/        
    public pagereference addRow()
    {
        
        ABC ob = new ABC();
        ob.tuitionAmount = 0;
        ob.transMethod = '';
        ListofRows.add(ob);
        return null;

    }
    Boolean display = false;
    Boolean displayLoader = True;
    public Boolean getDisplayloader()
    {
    return displayLoader;
    }
    public Boolean getdisplay()
    {
        return display;
    }
    public pagereference cal()
    {
        System.debug('-----------------------------');
        return null;
    }
    public decimal output{get;set;}
    public decimal amount{get;set;}
    /*private decimal amount = 0.0;
    public decimal getAmount()
    {
        return amount;
    }
    public void setAmount(Decimal amount)
    {
        amount=this.amount;
    }*/
    public decimal input{get;set;}
    public pagereference calculate()
    {
         displayLoader = True;

        output = amount+input+11254785;    
        //displayLoader = False;
    return null;
    }
    public pagereference next()
    {
        display = True;    
        System.debug('------------------>'+display);
    return null;
    }
    
    
 
 }