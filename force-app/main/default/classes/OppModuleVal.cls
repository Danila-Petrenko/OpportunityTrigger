public class OppModuleVal extends OpportunityModule {
    private static Map<Id, Account> mapOfAccounts = new Map<Id, Account>();

    public override void beforeInsert(List<Opportunity> tNew, Map<Id, Opportunity> newMap, 
                                      List<Opportunity> tOld, Map<Id, Opportunity> oldMap) {

        for(Account acc : [SELECT Id, Description FROM Account WHERE Id IN :getAccountIds(tNew)])
            mapOfAccounts.put(acc.Id, acc);
        System.debug(mapOfAccounts);
        for(Opportunity opp : tNew) 
            if(opp.AccountId != null)
                opp.Description = '"' + mapOfAccounts.get(opp.AccountId).Description + '" - Account Description.';
    }
    
    public override void afterInsert(List<Opportunity> tNew, Map<Id, Opportunity> newMap, 
                                     List<Opportunity> tOld, Map<Id, Opportunity> oldMap) {
        for(Opportunity opp : tNew) 
            if (opp.AccountId !=null && !infoMatch(mapOfAccounts, opp))
                opp.addError('Opportunity Info doesn`t match to related account info!');
    }
    
    public override void beforeUpdate(List<Opportunity> tNew, Map<Id, Opportunity> newMap, 
                                      List<Opportunity> tOld, Map<Id, Opportunity> oldMap) {
    	//some code here                                      
    }
    
    public override void afterUpdate(List<Opportunity> tNew, Map<Id, Opportunity> newMap, 
                                     List<Opportunity> tOld, Map<Id, Opportunity> oldMap) {
    	//somecode here                                     
    }
    
    private Set<Id> getAccountIds(List<Opportunity> tNew) {
        Set<Id> accountIds = new Set<Id>();
        for(Opportunity opp : tNew) 
            if(opp.AccountId != null || opp.AccountId != '')
                accountIds.add(opp.AccountId);
        return accountIds;
    }

    private Boolean infoMatch(Map<Id,Account> accountInfo, Opportunity opp) {
        Boolean isMatch = false;
        if (opp.Description == '"' + mapOfAccounts.get(opp.AccountId).Description + '" - Account Description.') 
            isMatch = true;
        return isMatch;
    }
}