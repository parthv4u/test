trigger SumTotalOnAccount on Account (after insert, after update, after delete) {

    set<Id> set_Id = new set<Id>();
   
    List<Account>acc_list = new List<Account>();
    
    if(Trigger.isInsert || Trigger.isUpdate) 
    {
        for(Account a:trigger.new){
            
        }

     }
    else if(Trigger.isDelete){
        for(Account acc:Trigger.old){

        }

     }
     
    if(Trigger.isAfter && (Trigger.isUpdate || Trigger.isInsert || Trigger.isDelete)){
        acc_list=[SELECT Id, Account_Number__c, (SELECT Id FROM Tasks) FROM Account WHERE Id IN :set_Id];

     for(Account acc: acc_list){
        if(acc.Tasks.size()>0)
            acc.Account_Number__c = acc.Tasks.size();
        else
            acc.Account_Number__c = 0;
     }
        if(!acc_list.isEmpty())
            update acc_list;
        }

}