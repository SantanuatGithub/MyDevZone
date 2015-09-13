public with sharing class DownloadExcelController {

    public String excelSheetName{get;set;}
    private String excelSheetFormatName = 'application/vnd.ms-excel#SalesForceExport';
    private Integer count;
    private String firstExcel;
    
    public DownloadExcelController(ApexPages.StandardController controller) {
     
     count = 1;
     
     
    }
   
   public PageReference dwldExcel()
   {
            /*if(count == 1)
            {
            System.debug('count1-->'+count);
            count = 2;
            excelSheetName = excelSheetFormatName +'_1.xls';
            return new pageReference('/apex/downloadExcel');
            }
            else if(count == 2)
            {
            System.debug('count2-->'+count);
            count = 0;
            excelSheetName = excelSheetFormatName +'_2.xls';
            return new pageReference('/apex/downloadExcel');
            }*/
            //excelSheetName = excelSheetFormatName +'_1.xls';
            return new pageReference('/apex/downloadExcel');
            
            //return null;
            
         
        
     
     
   }  

}