public with sharing class myDevicesController {

public String Page {get; set;}
    public String OpenPageURL {get; set;}
    
    public void myDevicesController ()
    {
        Page = '' ;
        OpenPageURL = '' ;
    }
    
    public PageReference redirect()
    {
        if(Page == 'google')
        {
            OpenPageURL = 'https://www.google.co.in/' ;
            //System.debug('url------>'+OpenPageURL);
        }
        if(Page == 'blog')
        {
            OpenPageURL = 'http://www.globalfoundries.com/' ;
        }
        return null;
    }
}