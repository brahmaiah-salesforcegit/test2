public class avalaraController
 {

   

//string variable to show api result
    public string result{get;set;}
//string variable to hold amount of line item
    public String amount { get; set; }
//string varriable to hold quantity of line item
    public String count { get; set; }
//string varriable to hold postal code of address
    public String PostalCode { get; set; }
//line 1 of address
    public String Line1 { get; set; }
//line 2 of address
    public String Line2 { get; set; }
   

//method to get tex value from avalara tex api    
public String RestRequest(String body,String endPoint,String method){
        
         Blob headerValue = Blob.valueOf('2000194029'+':'+'237D0AE76BF693BB');
         String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
                
         //accessing end point for avalara request type
        
         Http h=new Http();
         HttpRequest req = new HttpRequest();
         req.setMethod(method);
  
         req.setHeader('Authorization', authorizationHeader);
         req.setEndPoint(endPoint);
         req.setBody(body);
         HttpResponse res = h.send(req);
         result = res.getBody();
         return result;



}

//method to get Text
       public void getTex(){
//calling method to create json body for request body from user provided data
        
         String texString = createTexRequestBody();
         RestRequest(texString ,'https://development.avalara.net/1.0/tax/get' ,'POST');
               }
  //method to validate address             
      public void validateAddress() {
     
        string endpoint = 'https://development.avalara.net/1.0/address/validate?Line1='+EncodingUtil.urlEncode(Line1+Line2,'UTF-8')+'&PostalCode='+EncodingUtil.urlEncode(PostalCode,'UTF-8');
        RestRequest('' ,endPoint ,'GET');
    }
 //method to create json string for rest request body        
      public String createTexRequestBody(){
      
      
       JSONGenerator gen= JSON.createGenerator(true);
        gen.writeStartObject();
        gen.writeStringField('DocDate', '2013-06-19');
        gen.writeStringField('CustomerCode', 'CUST1');
        gen.writeFieldName('Addresses');
        gen.writeStartArray();
        gen.writeStartObject();
        gen.writeStringField('AddressCode', '1');
        gen.writeStringField('Line1',Line1 );
        gen.writeStringField('Line2', Line2 );
        
        gen.writeStringField('PostalCode',PostalCode);
        gen.writeEndObject();
        gen.writeEndArray();
        gen.writeFieldName('Lines');
        gen.writeStartArray();
        gen.writeStartObject();
        gen.writeStringField('LineNo', '1');
        gen.writeStringField('DestinationCode', '1');
        gen.writeStringField('OriginCode', '1');
        gen.writeNumberField('Qty',Integer.valueOf(count));
        gen.writeNumberField('Amount',Integer.valueOf(amount));
        
        gen.writeEndObject();
        gen.writeEndArray();
        gen.writeEndObject();
        return gen.getAsString();
      
      
      }

}