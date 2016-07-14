public class LogACallController {    
    //method to create task    
    @AuraEnabled
    public static void saveTask(Task task) {
        
            insert new Task(
                Subject = task.Subject, Type = task.Type,                   
                ActivityDate = task.ActivityDate, Description = task.Description,
                Status = 'Completed');      
            //return 'Task Created Successfully';
    }
}