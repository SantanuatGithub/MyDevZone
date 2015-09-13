public class AccountCreation
{
    public void createAccount()
    {
        partnerSoapSforceCom.Soap myPartnerSoap = new partnerSoapSforceCom.Soap();
        // call login
        partnerSoapSforceCom.LoginResult partnerLoginResult = myPartnerSoap.login('project@success.com', 'whatispassw0rd');

system.debug('partnerLoginResult ************************' + partnerLoginResult.serverUrl );
        
       soapSforceComSchemasClassTestwebser.SessionHeader_element ss=new soapSforceComSchemasClassTestwebser.SessionHeader_element();
        ss.sessionId=partnerLoginResult.SessionId;
        
        
        soapSforceComSchemasClassTestwebser s = new soapSforceComSchemasClassTestwebser();
        soapSforceComSchemasClassTestwebser.TestWebService a = new soapSforceComSchemasClassTestwebser.TestWebService();
        a.SessionHeader=ss;
        String acctId = a.makeAccount('Swati');
        
        system.debug('ACCTID ************************' + acctId);
    }
}