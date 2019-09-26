public with sharing class dependentCountryandState {

    public String tmpState { get; set; }

    public String tmpContact { get; set; }
    public String field { get; set; }

     public List<SelectOption> getCountries()
    {
        Schema.sObjectType objType = Contact.getSObjectType();
        Schema.DescribeSObjectResult objDescribe = objType.getDescribe();
        map<String, Schema.SObjectField> fieldMap = objDescribe.fields.getMap();
        system.debug('fieldMap      '+fieldMap );
        system.debug('keys         '+fieldMap.keySet());
        list<Schema.PicklistEntry> values = fieldMap.get('MailingCountryCode').getDescribe().getPickListValues();

        List<SelectOption> options = new List<SelectOption>();
        for (Schema.PicklistEntry v : values){
            options.add(new SelectOption(v.getValue(), v.getLabel()));
        }
        return options;
    }
    
    public List<SelectOption> getFields()
    {
        Schema.sObjectType objType = Contact.getSObjectType();
        Schema.DescribeSObjectResult objDescribe = objType.getDescribe();
        map<String, Schema.SObjectField> fieldMap = objDescribe.fields.getMap();
        system.debug('fieldMap      '+fieldMap );
        system.debug('keys         '+fieldMap.keySet());
        Set<String> keys=fieldMap.keySet();
        list<Schema.PicklistEntry> values = fieldMap.get('MailingCountryCode').getDescribe().getPickListValues();

        List<SelectOption> options = new List<SelectOption>();
        for (String key : keys){
            options.add(new SelectOption('fieldName', key));
        }
        return options;
    }

    public List<SelectOption> getStates()
    {
        Schema.sObjectType objType = Contact.getSObjectType();
        Schema.DescribeSObjectResult objDescribe = objType.getDescribe();
        map<String, Schema.SObjectField> fieldMap = objDescribe.fields.getMap();
        list<Schema.PicklistEntry> values = fieldMap.get('MailingStateCode').getDescribe().getPickListValues();

        List<SelectOption> options = new List<SelectOption>();
        for (Schema.PicklistEntry v : values){
            system.debug('v.getValue()   --->'+v.getValue());
            system.debug('v.getLabel()()   --->'+v.getLabel());
            options.add(new SelectOption(v.getValue(), v.getLabel()));
        }
        system.debug('options'+options);
        return options;
    }
    public void getValues(){
        system.debug('-->'+tmpState);
                system.debug('-->'+tmpContact);
    }

}