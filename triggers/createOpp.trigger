trigger createOpp on Account(after update)
 {
    // declare a list to hold Opportunities
    List<Opportunity> opty = new List<Opportunity>();
    
    
    for(Account a : trigger.new)
    {
        Opportunity opp = new opportunity();
        //opp.Id = a.id;
//      opp.name = a.name;
        opp.StageName = a.Name;       
        opp.CloseDate = a.ship_date__c;
        opty.add(opp);
    }
   
   insert opty;
 
 }