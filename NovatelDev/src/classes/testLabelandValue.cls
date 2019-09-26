public class testLabelandValue{
   // List<String> myPicklist;
public static void testdata(){
   // myPicklist = new List<String>();
      Schema.DescribeFieldResult field = customer__c.country__c.getDescribe();

      for (Schema.PicklistEntry f : field.getPicklistValues())
        system.debug(f.getLabel()+'>>>'+f.getValue());

    }
}