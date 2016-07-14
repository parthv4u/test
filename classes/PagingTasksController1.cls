public class PagingTasksController1{

    public List<Task> Tasks;

   
    public Task del;
    public Task taskDel;
    public Integer CountTotalRecords{get;set;}
    public String QueryString {get;set;}
    public Integer OffsetSize = 0;
    private Integer QueryLimit =3 ;
    public List<Task> lstTasks {get;set;}
    public String searchText {get;set;}
    public String rowIndex {get;set;}
    public Date mydate;
    public Integer totalCount {get;set;}
    public string sortField = 'Subject';  // default sort column
    private string sApplySOQL = '';
     public List<Task> delattendeeList {get;set;}

    public List<Task> delAttendees {get; set;}

    public PagingTasksController1(ApexPages.StandardController controller) {

     taskDel= (Task)controller.getRecord();
     Tasks = [Select id,Subject,Status,ActivityDate from Task where OwnerId =: taskDel.Id];
    // this.Tasks=Tasks[0];
     totalCount = Tasks.size();

     delattendeeList = new List<Task>();
     delattendees = new List<Task>();
      }


      // the current sort direction. defaults to ascending
       public String sortDir {
        get  { if (sortDir == null) {  sortDir = 'asc'; } return sortDir;  }
        set;
      }

     // the current field to sort by. defaults to role name
      public String getsortField() {
        return sortField;
    }

    // the current field to sort by.
     public void setsortField(string value) {
        sortField = value;
     }
            
    // toggles the sorting of query from asc<-->desc
    public void toggleSort() {
        // simply toggle the direction
        sortDir = sortDir.equals('asc') ? 'desc' : 'asc';
      
        integer iIndex = sApplySOQL.indexOf('Order By');
        if (iIndex > -1){
          sApplySOQL = sApplySOQL.substringBefore('Order By');
          sApplySOQL = sApplySOQL + ' Order By ' + sortField + ' ' + sortDir +  ' limit ' + QueryLimit + ' offset ' + OffsetSize;
        }
        tasks = Database.query(sApplySOQL );
    }
  
     public PagingTasksController1 (){
        //CountTotalRecords= [select count() from Task];
        //String qStr2= '7/23/2014';
          
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
        
        String qStr2= searchText;
        Set<Id> ownerIds = new Set<Id>();
        String strnormal = '';
        try{
             mydate = date.parse(qStr2);
        }catch(Exception e)
        { }
           
        String strDate = '';
        if(mydate != null) {
         // strnormal = String.valueOf(mydate );
          String[] qstr3 = String.valueOf(mydate).split(' ',2); 
          strDate = ' ActivityDate =  '+ qstr3[0] + ' ';
        }else{
       
           strDate  =  'Subject like \'%'+searchText +'%\' OR Status like \'%' +searchText+ '%\' Order By '  + sortField;
        }
       
       /* if (ownerIds != null && ownerIds.size() > 0){
       
          String qStr = 'Select OwnerId,Subject,Status,ActivityDate from Task where '+strDate+' limit ' + QueryLimit + ' offset ' + OffsetSize +' and OwnerId in :ownerIds';
          System.debug(qStr); 
          tasks = Database.query(qStr);         
        } */
       
           //String qStr ='Select OwnerId,Subject,Status,ActivityDate from Task where \''+strDate +'\' limit ' + QueryLimit + ' offset ' + OffsetSize;
           String qStr = 'Select OwnerId,Subject,Status,ActivityDate from Task where '+strDate+' limit ' + QueryLimit + ' offset ' + OffsetSize;
             System.debug(qStr); 
          tasks = Database.query(qStr);         
                  
            //  String qStr = 'Select OwnerId,Subject,Status,Priority from Task where Subject like \'%'+searchText+'%\' OR Status like \'%'+searchText+ '%\' Order By ' + sortField;

       //tasks.sort();

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
       
      public void deleteRow(){
         delete new Task(Id = rowIndex);
         for (Integer i = 0; i < Tasks.size(); i++) {
           if (Tasks[i].Id == rowIndex) {
            Tasks.remove(i);
            break;
           }
         }
      } 
       
       
       
       
    
    /*  public void deleteRow(){

         rowIndex = String.valueOf(ApexPages.currentPage().getParameters().get('rowIndex'));
         System.debug('rowIndex ------------'+rowIndex );
         if(rowIndex!=null)
         {
         Task check=[Select id from Task where id=: rowIndex];
         System.debug('row to be deleted ' + check);
         delete check;
         Tasks=[Select Subject,Status,ActivityDate,OwnerId from Task ];
         update Tasks;
           }
         }*/
      }