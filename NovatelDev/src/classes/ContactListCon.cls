//controller for the above VF page

public with sharing class ContactListCon{


public List<contact> contacts {get;set;}
  
    public pageReference fetchList()
    {
         contacts = [SELECT Id,firstname,lastname FROM Contact limit 25];
        return null;
    }  
}