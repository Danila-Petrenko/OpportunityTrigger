public abstract class OpportunityModule {
    public void execute(Boolean isBefore, Boolean isAfter, Boolean isInsert, 
                        Boolean isUpdate, Boolean isDelete, List<Opportunity> tNew, 
                        Map<Id, Opportunity> newMap, List<Opportunity> tOld, Map<Id, Opportunity> oldMap) {
    	if (isBefore) {
            if (isInsert) {
                beforeInsert(tNew, newMap, tOld, oldMap);
            } else if (isUpdate) {
                beforeUpdate(tNew, newMap, tOld, oldMap);
            } else if (isDelete) {
                beforeDelete();
            }                
        } else if (isAfter) {
            if (isInsert) {
                afterInsert(tNew, newMap, tOld, oldMap);
            } else if (isUpdate) {
                afterUpdate(tNew, newMap, tOld, oldMap);
            } else if (isDelete) {
                afterDelete();
            }
        }
    }
    public virtual void beforeInsert(List<Opportunity> tNew, Map<Id, Opportunity> newMap, 
                                     List<Opportunity> tOld, Map<Id, Opportunity> oldMap) {}
    
    public virtual void afterInsert(List<Opportunity> tNew, Map<Id, Opportunity> newMap, 
                                    List<Opportunity> tOld, Map<Id, Opportunity> oldMap) {}
    
    public virtual void beforeUpdate(List<Opportunity> tNew, Map<Id, Opportunity> newMap, 
                                     List<Opportunity> tOld, Map<Id, Opportunity> oldMap) {}
    
    public virtual void afterUpdate(List<Opportunity> tNew, Map<Id, Opportunity> newMap, 
                                    List<Opportunity> tOld, Map<Id, Opportunity> oldMap) {}
    
    private virtual void beforeDelete() {}
    
    private virtual void afterDelete() {}
}