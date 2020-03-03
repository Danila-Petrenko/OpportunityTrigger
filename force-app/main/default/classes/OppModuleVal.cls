public class OppModuleVal extends OpportunityModule {
    public override void beforeInsert(List<Opportunity> tNew, Map<Id, Opportunity> newMap, 
                                      List<Opportunity> tOld, Map<Id, Opportunity> oldMap) {
        if(isValid(tNew)) {
            //some code here
        } else {
            //otherwise here
        }
    }
    
    public override void afterInsert(List<Opportunity> tNew, Map<Id, Opportunity> newMap, 
                                     List<Opportunity> tOld, Map<Id, Opportunity> oldMap) {
        if(isValid(tNew)) {
            afterInsertCheck(tNew, tOld);
        } else {
            System.debug('Opportunity is not valid');
        }
    }
    
    public override void beforeUpdate(List<Opportunity> tNew, Map<Id, Opportunity> newMap, 
                                      List<Opportunity> tOld, Map<Id, Opportunity> oldMap) {
    	//some code here                                      
    }
    
    public override void afterUpdate(List<Opportunity> tNew, Map<Id, Opportunity> newMap, 
                                     List<Opportunity> tOld, Map<Id, Opportunity> oldMap) {
    	//somecode here                                     
    }
    
    private boolean isValid(List<Opportunity> tNew) {
        return true;
    }

    private void afterInsertCheck(List<Opportunity> tNew, List<Opportunity> tOld) {}
}