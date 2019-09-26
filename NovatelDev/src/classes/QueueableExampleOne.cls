public class QueueableExampleOne implements Queueable, Database.AllowsCallouts {
    public Integer counter;
    public void execute(QueueableContext context){
        System.debug('Counter: '+counter);
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        req.setMethod('GET');
        Http http = new Http();
        HttpResponse resp = http.send(req);
        String html = resp.getBody();
        System.debug('Request: ' + req.toString());
        System.debug('Body: ' + html);
        tryToQueue(++counter);
    }
    
    @future(callout=true)
    public static void tryToQueue(Integer counter) {
        QueueableExampleOne job = new QueueableExampleOne();
        job.counter = counter; 
        System.enqueueJob(job);
    }
}