trigger OpportunityTrigger on Opportunity (before insert, after insert, before update, 
                                           after update, before delete, after delete) {
	OpportunityFlow oppFlow = new OpportunityFlow();
    oppFlow.executeFlow(trigger.isBefore, trigger.isAfter, trigger.isInsert, 
                        trigger.isUpdate, trigger.isDelete, trigger.New, 
                        trigger.newMap, trigger.Old, trigger.oldMap);
}