public class objectController1
{
    
    public  string searchTxt {get; set;}
    String queryString;
    
    public void searchrecords() {
        
        
        system.debug('selectedObject ---selectedField--------'+selectedObject+'---'+selectedField );
        
        //string staging = rfq.Name;
        queryString = 'SELECT Id, name';
        
        if (selectedObject!= null && selectedObject!= '')
        {
            queryString += ' from  '+ selectedObject+'';
        }
        
        if ( searchTxt != null && searchTxt!= '')
        {
            if (selectedField != null && selectedField != '') {
                queryString += ' where ' + selectedField +' = '+searchTxt;
                system.debug('queryString -----'+queryString );
            }
            
        }
        
        system.debug('queryString -----------'+queryString );
        
        lstQuery= database.query(queryString);
        
        
    }
    
    public Map <String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
    public String selectedObject {get; set;}
    public list<sobject >lstQuery{get; set;}
    public String selectedField {get; set;}
    
    Public objectController1()
    {
        selectedObject = 'account';
    }
    
    
    public List<SelectOption> getObjectNames()
    
    {
        List<SelectOption> objNames = new List<SelectOption>();
        
        List<String> entities = new List<String>(schemaMap.keySet());
        
        entities.sort();
        
        for(String name : entities)
        {
            objNames.add(new SelectOption(name,name));
        }
        return objNames;
    }
    
    
    public List<SelectOption> getObjectFields()
    {
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        
        Schema.SObjectType ObjectSchema = schemaMap.get(selectedObject);
        
        Map<String, Schema.SObjectField> fieldMap = ObjectSchema.getDescribe().fields.getMap();
        
        List<SelectOption> fieldNames = new List<SelectOption>();
        
        for (String fieldName: fieldMap.keySet())
        {
            fieldNames.add(new SelectOption(fieldName,fieldName));
            
            //fieldMap.get(fieldName).getDescribe().getLabel();//It provides to get the object fields label.
        }
        return fieldNames;
    }
}