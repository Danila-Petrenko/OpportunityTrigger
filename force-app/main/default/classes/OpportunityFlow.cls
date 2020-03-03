public with sharing class OpportunityFlow {
    public void executeFlow(Boolean isBefore, Boolean isAfter, Boolean isInsert, 
                            Boolean isUpdate, Boolean isDelete, List<Opportunity> tNew, 
                            Map<Id, Opportunity> newMap, List<Opportunity> tOld, Map<Id, Opportunity> oldMap) {
    	OpportunityModule oppValidation, oppMain;
        oppValidation = new OppModuleVal();
        oppMain = new OppModuleMain();
    	OpportunityModule[] oppModules = new OpportunityModule[] {
            oppValidation,
            oppMain
        };
        for(OpportunityModule oppModule : oppModules) {
            oppModule.execute(isBefore, isAfter, isInsert, isUpdate, 
                              isDelete, tNew, newMap, tOld, oldMap);
        }
    }
}