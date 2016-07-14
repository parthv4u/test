trigger Testtask on Account (after insert,after update) {

   List <task> taskToInsert = new List <task> ();

   for (Account a : Trigger.new) {
   
   task t = new task ();
   t.ActivityDate = a.ship_date__c; 
   t.Subject = 'please email me';
   t.OwnerId = a.OwnerId;
   t.WhatId = a.id;
   taskToInsert.add(t);
}
insert taskToInsert;
}