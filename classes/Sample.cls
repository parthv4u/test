public class Sample {

  public list<Employee_Setting__mdt> listEmpSettings{get;set;}
  public sample() {
    listEmpSettings=[Select DeveloperName,Name__c from Employee_Setting__mdt];
   }
 }