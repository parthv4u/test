public class SearchController
{
   public Task l;
   public List<Task> searchResults {get; set; }
   public SearchController() {

   }

  public string searchText
  {
   get
   {
     if (searchText==null) searchText = '';
     return searchText;
   }
  set;
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
        String qry ='Select Id,Subject,Status from Task where Subject like \'%'+searchText+'%\' OR Status like \'%'+searchText+'%\' Order By Subject,Status';   
        SearchResults = Database.query(qry);
    return null;
    }
   
   public PageReference save() {
   update SearchResults ; 
      return ApexPages.CurrentPage();
    }

  }