@isTest
private class OppModuleValTest {
    private Account testAccount;

    private void makeData(){
        testAccount = new Account(Name = 'TestName',
                                  Description = 'This is a test account');
        insert testAccount;
    }

    @isTest
    private static void oppWithAcc() {
        OppModuleValTest omvt = new OppModuleValTest();
        omvt.makeData();

        Opportunity testOpp = new Opportunity(Name = 'TestOpp',
                                              CloseDate = System.Today() + 2,
                                              StageName = 'Prospecting',
                                              AccountId = omvt.testAccount.Id,
                                              Description = '');
        Test.startTest();
        insert testOpp;
        Test.stopTest();
        testOpp = [SELECT Id, Description FROM Opportunity WHERE Name = 'TestOpp'];
        System.assert(testOpp != null);
        System.assertEquals('"This is a test account" - Account Description.', testOpp.Description);
    }
}
