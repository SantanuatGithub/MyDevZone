public with sharing class NewModalScreenController 
{
 public boolean displayPopup {get; set;}     
    
    public void closePopup() {        
        displayPopup = false;    
    }     
    public void showPopup() {        
        displayPopup = true;    
    }
    public pagereference hideScreen()
    {
        displayPopup = false;
        return null;
    }
}