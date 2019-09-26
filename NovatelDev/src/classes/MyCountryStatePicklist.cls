public class MyCountryStatePicklist{
    public String countrycode{get;set;}
    public String statecode{get;set;}
    public string name{get;set;}
    public string code{get;set;}
    public string timeStampValue;
    
    public void saveNames(){
    system.debug('name    '+name);
    }
    
    public void receiveInput() {
    String input = Apexpages.currentPage().getParameters().get('type');
    }
   }