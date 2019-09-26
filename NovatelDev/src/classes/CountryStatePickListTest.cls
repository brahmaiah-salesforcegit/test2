public class CountryStatePickListTest{

public Contact tmpContact{get;set;}
        Map<String,String> maplabelVal=new Map<String,String>();
       public CountryStatePickListTest(){
        // Get the object type of the SObject.
        Schema.sObjectType objType = Contact.getSObjectType();
        // Describe the SObject using its object type.
        Schema.DescribeSObjectResult objDescribe = objType.getDescribe();
        // Get a map of fields for the SObject
        map<String, Schema.SObjectField> fieldMap = objDescribe.fields.getMap();
        // Get the list of picklist values for this field.
        list<Schema.PicklistEntry> values = fieldMap.get('MailingCountryCode').getDescribe().getPickListValues();
        // Add these values to the selectoption list.
        for (Schema.PicklistEntry a : values){
           maplabelVal.put(a.getLabel(), a.getValue());
        }
        system.debug('MAP: '+maplabelVal);
        system.debug('ISO CODE: '+maplabelVal.get('Andorra'));
        system.debug('------------------------>'+tmpContact);
 
}


public List<SelectOption> getCountries()
{
  Schema.sObjectType objType = Contact.getSObjectType();
  Schema.DescribeSObjectResult objDescribe = objType.getDescribe();
  map<String, Schema.SObjectField> fieldMap = objDescribe.fields.getMap();
  list<Schema.PicklistEntry> values = fieldMap.get('MailingCountry').getDescribe().getPickListValues();

  List<SelectOption> options = new List<SelectOption>();
  for (Schema.PicklistEntry v : values){
    options.add(new SelectOption(v.getLabel(), v.getLabel()));
  }
  return options;
}
}