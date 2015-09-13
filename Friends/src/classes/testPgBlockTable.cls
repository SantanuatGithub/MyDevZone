public with sharing class testPgBlockTable
{

    
    integer i =1;
    
    public class generateRows
    {     
        public boolean isSelected{get;set;}
        public string type{get;set;}
        public string name{get;set;}
        public string size{get;set;}
        public date moddate{get;set;}
    } 
    
    List <generateRows> rowList = new List<generateRows>();
    generateRows generateRowsObj = new generateRows();
    public List<generateRows> getRowList()
    {
        return rowList;
    } 
     //public List<generateRows> contactList{get;set;}
     public testPgBlockTable()
    {
    for(integer i =0;i<1;i++)
    {
          generateRowsObj = new generateRows();
           generateRowsObj.isSelected = true;
           generateRowsObj.type ='Seller';
           generateRowsObj.name ='S Pal';
           generateRowsObj.size = '5';
           rowList.add(generateRowsObj);
           
    }    }
    
}