trigger trgr_CreateTask on Account (after update,after insert) {

   List<Task> newTasks = new List<Task>();
   
   for(Account updateaccount : trigger.new){
       if(updateaccount.Account_Comments__c != NULL){
           newTasks.add(new Task 
		   (
               ActivityDate = Date.today(),

               Status = 'Not Started',
               Type = 'Other',
               Priority = 'Normal',
               Subject = 'Trigger Comment Changed!',
               Description = updateaccount.Account_Comments__c
		   ));
       }
   }

   INSERT newTasks;
}