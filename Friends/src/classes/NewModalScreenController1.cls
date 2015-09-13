public with sharing class NewModalScreenController1 
{
 public boolean displayModalScreen {get; set;}     
    
    public void closeModalScreen() {        
        displayModalScreen = false;    
    }     
    public void showModalScreen() {        
        displayModalScreen = true;    
    }
    
}