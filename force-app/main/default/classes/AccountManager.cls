@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount(){
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL and process
        String accountId = request.requestURI.substringBeforeLast('/').substringAfterLast('/');
        Account result =  [ SELECT Id, Name, (Select Id, Name from Contacts)
                           	FROM Account
                        	WHERE Id = :accountId
                          ];
        return result;
    }

}