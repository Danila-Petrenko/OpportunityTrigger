public class OppModuleMain extends OpportunityModule {
	public override void beforeInsert(List<Opportunity> tNew, Map<Id, Opportunity> newMap, 
                                      List<Opportunity> tOld, Map<Id, Opportunity> oldMap) {
        //some code here
    }
    
    public override void afterInsert(List<Opportunity> tNew, Map<Id, Opportunity> newMap, 
                                     List<Opportunity> tOld, Map<Id, Opportunity> oldMap) {
  		//some code here                               
    }
    
    public override void beforeUpdate(List<Opportunity> tNew, Map<Id, Opportunity> newMap, 
                                      List<Opportunity> tOld, Map<Id, Opportunity> oldMap) {
    	//some code here                                      
    }
    
    public override void afterUpdate(List<Opportunity> tNew, Map<Id, Opportunity> newMap, 
                                     List<Opportunity> tOld, Map<Id, Opportunity> oldMap) {
    	//somecode here                                     
    }
}