public class ExtPosition{
 
public List<String> title {get;set;}
public String OutputString {get;set;}
public String EnterData {get;set;}
public String prod{get;set;}
List<Account> pos = new List<Account>([select Name,Id from Account]);

public ExtPosition()
{
   title = new List<String>();
   {
   For (Account p : pos)
   {
    title.add(p.Name);
   }

   }
}

 public void EnterData()
 {
    OutputString=EnterData;
 }

//List<String>
 public void productSearch()
 {
     prod='Arun';
 }   
    
}