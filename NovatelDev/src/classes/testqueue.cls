public class testqueue  {
    public Integer counter;
    public static void execute1(){
       // System.debug('Counter: '+counter);
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        req.setMethod('GET');
        Http http = new Http();
        system.debug('start...');
        req .setTimeout(120000);
        HttpResponse resp = http.send(req);
        system.debug('end...');
        String html = resp.getBody();
        System.debug('Request: ' + req.toString());
        System.debug('Body: ' + html);
        
        
    }
    
   
}