/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class AddressSvc {
    global AddressSvc() {

    }
global class AddressSvcSoap {
    global String clientCert_x;
    global String clientCertName_x;
    global String clientCertPasswd_x;
    global String endpoint_x;
    global Map<String,String> inputHttpHeaders_x;
    global Map<String,String> outputHttpHeaders_x;
    global AVA_SF_SDK.AddressSvc.Profile Profile;
    global AVA_SF_SDK.AddressSvc.Security Security;
    global Integer timeout_x {
        get;
        set;
    }
    global AddressSvcSoap(String SvcURL) {

    }
    global AVA_SF_SDK.AddressSvc.IsAuthorizedResult IsAuthorized(String Operations) {
        return null;
    }
    global AVA_SF_SDK.AddressSvc.PingResult Ping(String Message) {
        return null;
    }
    global AVA_SF_SDK.AddressSvc.ValidateResult Validate(AVA_SF_SDK.AddressSvc.ValidateRequest ValidateRequest) {
        return null;
    }
}
global class ArrayOfMessage {
    global List<AVA_SF_SDK.AddressSvc.Message> Message;
    global ArrayOfMessage() {

    }
}
global class ArrayOfValidAddress {
    global List<AVA_SF_SDK.AddressSvc.ValidAddress> ValidAddress;
    global ArrayOfValidAddress() {

    }
}
global class BaseAddress {
    global String AddressCode;
    global String City;
    global String Country;
    global String Latitude;
    global String Line1;
    global String Line2;
    global String Line3;
    global String Longitude;
    global String PostalCode;
    global String Region;
    global Integer TaxRegionId;
    global BaseAddress() {

    }
}
global class IsAuthorizedResponse_element {
    global AVA_SF_SDK.AddressSvc.IsAuthorizedResult IsAuthorizedResult;
    global IsAuthorizedResponse_element() {

    }
}
global class IsAuthorizedResult {
    global Datetime Expires;
    global AVA_SF_SDK.AddressSvc.ArrayOfMessage Messages;
    global String Operations;
    global String ResultCode;
    global String TransactionId;
    global IsAuthorizedResult() {

    }
}
global class IsAuthorized_element {
    global String Operations;
    global IsAuthorized_element() {

    }
}
global class Message {
    global String Details;
    global String HelpLink;
    global String Name;
    global String RefersTo;
    global String Severity;
    global String Source;
    global String Summary;
    global Message() {

    }
}
global class PingResponse_element {
    global AVA_SF_SDK.AddressSvc.PingResult PingResult;
    global PingResponse_element() {

    }
}
global class PingResult {
    global AVA_SF_SDK.AddressSvc.ArrayOfMessage Messages;
    global String ResultCode;
    global String TransactionId;
    global String Version;
    global PingResult() {

    }
}
global class Ping_element {
    global String Message;
    global Ping_element() {

    }
}
global class Profile {
    global String Adapter;
    global String Client;
    global String Machine;
    global String Name;
    global Profile() {

    }
}
global class Security {
    global AVA_SF_SDK.AddressSvc.UsernameToken_element UsernameToken;
    global Security() {

    }
}
global class UsernameToken_element {
    global String Password {
        get;
        set;
    }
    global String Username {
        get;
        set;
    }
    global UsernameToken_element() {

    }
}
global class ValidAddress {
    global String AddressCode;
    global String AddressType;
    global String CarrierRoute;
    global String City;
    global String Country;
    global String County;
    global String FipsCode;
    global String GeocodeType;
    global String Latitude;
    global String Line1;
    global String Line2;
    global String Line3;
    global String Line4;
    global String Longitude;
    global String PostalCode;
    global String PostNet;
    global String Region;
    global Integer TaxRegionId;
    global String ValidateStatus;
    global ValidAddress() {

    }
}
global class ValidateRequest {
    global AVA_SF_SDK.AddressSvc.BaseAddress Address;
    global Boolean Coordinates;
    global Date Date_x;
    global Boolean Taxability;
    global String TextCase;
    global ValidateRequest() {

    }
}
global class ValidateResponse_element {
    global AVA_SF_SDK.AddressSvc.ValidateResult ValidateResult;
    global ValidateResponse_element() {

    }
}
global class ValidateResult {
    global AVA_SF_SDK.AddressSvc.ArrayOfMessage Messages;
    global String ResultCode;
    global Boolean Taxable;
    global String TransactionId;
    global AVA_SF_SDK.AddressSvc.ArrayOfValidAddress ValidAddresses;
    global ValidateResult() {

    }
}
global class Validate_element {
    global AVA_SF_SDK.AddressSvc.ValidateRequest ValidateRequest;
    global Validate_element() {

    }
}
}
