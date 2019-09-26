/*------------------------------------------------------------
@Author:       Apttus
@Description:  Utility class for CEB- Ecommerce
------------------------------------------------------------*/
public class AvalaraIntegrationUtils
{
    /*------------------------------------------------------------
@Description: Below method should be used to validate address.
@Inputs:        "Input 1" - AddressDetailsWrapper
------------------------------------------------------------*/ 
    public static APTSMD_AvalaraAddressWrapper validatedAddress(AddressDetailsWrapper address, String UserName,String Password,String EndPointUrl)
    {
        AVA_SF_SDK.AddressSvc.BaseAddress Ba = new AVA_SF_SDK.AddressSvc.BaseAddress();
        Ba.Line1 = address.Line1;
        Ba.City = address.City;
        Ba.Country = address.Country;
        Ba.PostalCode = address.PostalCode;
        Ba.Region = address.State;
        Ba.AddressCode = address.AddressCode;
         System.debug('___aa___'+address);
        System.debug('___ba___'+Ba);
        
        AVA_SF_SDK.AddressSvc.ValidateRequest vreq= new AVA_SF_SDK.AddressSvc.ValidateRequest();
            vreq.Address=Ba;
            vreq.Date_x=system.today();
            vreq.Taxability=true;   
        System.debug('___vreq___'+vreq);
        
        
        AVA_SF_SDK.AddressSvc.Profile prf = new AVA_SF_SDK.AddressSvc.Profile();
            prf.Machine = Label.ProfileMachine;
            prf.Name = Label.ProfileName;
        system.debug('---prf---'+prf);

        AVA_SF_SDK.AddressSvc.UsernameToken_element up = new AVA_SF_SDK.AddressSvc.UsernameToken_element();
            up.Username = UserName;
            up.Password = Password;
        system.debug('----up----'+up);

        AVA_SF_SDK.AddressSvc.Security sec = new AVA_SF_SDK.AddressSvc.Security();
            sec.UsernameToken = up;
        system.debug('----sec---'+sec);


        AVA_SF_SDK.AddressSvc.AddressSvcSoap addSvc=new AVA_SF_SDK.AddressSvc.AddressSvcSoap(EndPointUrl);
            addSvc.Profile = prf;
            addSvc.Security = sec;
        system.debug('---addsvc---'+addSvc);

        
        //Edited by JBandojo - to return the JSON response instead of only Error/Success.
        AVA_SF_SDK.AddressSvc.ValidateResult vres = new AVA_SF_SDK.AddressSvc.ValidateResult();
            vres=addSvc.Validate(vreq);
        system.debug('---vres---'+vres);
        system.debug('---vres---'+vres.ResultCode);
        APTSMD_AvalaraAddressWrapper response = new APTSMD_AvalaraAddressWrapper();
        response.suggestAddress=true;

        if(vres.ResultCode!='Success')
        {
            response.suggestAddress=false;
        }
        if (vres.ValidAddresses != null)
        {
            if (vres.ValidAddresses.ValidAddress[0].Line1 == address.Line1 && vres.ValidAddresses.ValidAddress[0].City == address.City && vres.ValidAddresses.ValidAddress[0].Region == address.State && vres.ValidAddresses.ValidAddress[0].PostalCode.contains(address.PostalCode)) {
                response.suggestAddress=false;
            }
        }
        vres.ValidAddresses.ValidAddress[0].Country=address.Country;
        system.debug('line1'+vres.ValidAddresses.ValidAddress[0].Line1+'fff'+address.Line1);
        system.debug('City'+vres.ValidAddresses.ValidAddress[0].City+'fff'+address.City);
        system.debug('Region'+vres.ValidAddresses.ValidAddress[0].Region+'fff'+address.State);
        system.debug('PostalCode'+vres.ValidAddresses.ValidAddress[0].PostalCode+'fff'+address.PostalCode);


        system.debug('---vresAddress---'+response.suggestAddress);
        system.debug('--response.result--->'+response.result);
        system.debug('--vres---->'+vres);
        response.result=vres;
        system.debug('Response---->'+response);
        response.inputAddress=address;
        return response;
        
       
    }
}