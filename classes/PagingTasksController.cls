public class PagingTasksController{

    public List<Task> tasks;
    public Integer CountTotalRecords{get;set;}
    public String QueryString {get;set;}
    public Integer OffsetSize = 0;
    private Integer QueryLimit = 3;
    public List<Task> lstTasks;
    public String searchText {get;set;} 
   
    public PagingTasksController (){
        //CountTotalRecords= [select count() from Task];
    }
   


    public List<Task> getTasks(){
        if(tasks == null){
            tasks = new List<Task>();
        }
        return tasks;
    }
   
    public void findTasks(){
        String qStr2 = 'Select count() from Task where Subject like \'%'+searchText+'%\' OR Status like \'%'+searchText+'%\'';
        CountTotalRecords = Database.countQuery(qStr2);
        queryTasks();
    }
   
    public void  queryTasks(){
        String qStr = 'Select OwnerId,Subject,Status,Priority from Task where Subject like \'%'+searchText+'%\' OR Status like \'%'+searchText+'%\' Order By Subject,Status limit ' + QueryLimit + ' offset ' + OffsetSize;
        tasks = Database.query(qStr);
        tasks.sort();

    }

    public Boolean getDisablePrevious(){
        if(OffsetSize>0){
            return false;
        }
        else return true;
    }

    public Boolean getDisableNext() {
        if (OffsetSize + QueryLimit < countTotalRecords){
            return false;
        }
        else return true;
    }

    public PageReference Next() {
        OffsetSize += QueryLimit;
        queryTasks();
        return null;
    }

    public PageReference Previous() {
        OffsetSize -= QueryLimit;
        queryTasks();
        return null;
    }

   public PageReference save() {
        update tasks;
        return ApexPages.CurrentPage();
    }
   
}