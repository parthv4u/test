public class TaskSearchController
    {
       public apexpages.standardController controller{get;set;}
       public Task l;
       public List<Task> searchResults {get; set; }

      public string searchText
      {
       get
       {
         if (searchText==null) searchText = '';
         return searchText;
       }
      set;
       }

     public TaskSearchController(ApexPages.StandardController controller)
     {
        this.controller = controller;
        this.l = (Task) controller.getRecord();
      }

    public PageReference search()
    {
      if(SearchResults == null)
      {
        SearchResults = new List<Task>();
      }
     else
     {
        SearchResults.Clear();
     }

String qry ='Select Id,Subject,Status,ActivityDate from Task where Subject like \'%'+searchText+'%\' OR Status like \'%'+searchText+'%\' Order By Subject,Status,ActivityDate';


    SearchResults = Database.query(qry);
   //System.debug(SearchResults);
   return null;
    }
   }