public with sharing class TestRadioButtonController 
{
public String recurrValue{get;set;}
public Boolean showpanel{get;set;}
public Boolean recurrenceCheck{get;set;}
 
public void action1()
{
if(recurrenceCheck == true)
{
 showpanel = true;
 
 System.debug('Value0---------------->'+showpanel);
 
}
// System.debug('Value---------------->'+recurrValue);

 }

public void radioaction()
{

System.debug('Value1---------------->'+showpanel);

System.debug('Value2---------------->'+recurrValue);
}


}