global class GSP_LogInfoData_Batch implements Database.Batchable<sObject>{

   global Database.QueryLocator start(Database.BatchableContext BC) {
         
        String query = 'SELECT Id, Name FROM contact limit 1';
        system.debug('hello'+ Database.getQueryLocator(query));
        return Database.getQueryLocator(query);
    }
     
    global void execute(Database.BatchableContext BC, List<Contact> conList) {
        
        List<Contact> conupdate = new List<Contact>();
        for (Contact conobj : conList)
        {
            conobj.CurrencyIsoCode='GBP - British Pound';
            conupdate.add(conobj);
            
        }
        GSP_LogHelper.log(Database.insert(conupdate,false));
        GSP_LogHelper.flush();
        
    }   
     
    global void finish(Database.BatchableContext BC) {
        // execute any post-processing operations like sending email
    }
}