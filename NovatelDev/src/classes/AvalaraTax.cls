public class AvalaraTax{
    static string rVal = 'GetTax:';
    /*------------------------------------------------------------
@Description: Below method should be used to Calculate tax for line Item.
@Inputs:        "Input 1" - Order Id
------------------------------------------------------------*/ 
   /* Public static void CalucalteTax(String OrderId){
       // List<Apttus_Config2__LineItem__c> updateLineItemList = new List<Apttus_Config2__LineItem__c>();
        Decimal totalTax=0;
        Apttus_Config2__ProductConfiguration__c prodConfig = [select id,name from Apttus_Config2__ProductConfiguration__c where Apttus_Config2__OrderId__c =:OrderId limit 1];
        List<Apttus_Config2__LineItem__c> lineItemsList = [select id,name,Line_Item_Tax__c,Apttus_Config2__ProductId__c,Apttus_Config2__ProductId__r.ProductCode,Apttus_Config2__NetPrice__c,Apttus_Config2__LineNumber__c,Apttus_Config2__ConfigurationId__c,Apttus_Config2__ConfigurationId__r.Apttus_QPConfig__Proposald__c,Apttus_Config2__Quantity__c,Apttus_Config2__Description__c from Apttus_Config2__LineItem__c where Apttus_Config2__ConfigurationId__c=:prodConfig.Id];
        for(Apttus_Config2__LineItem__c lineItems:lineItemsList){ 
            AVA_SF_SDK.TaxSvc.GetTaxRequest gtr = new AVA_SF_SDK.TaxSvc.GetTaxRequest();
            gtr.Addresses = new AVA_SF_SDK.TaxSvc.ArrayOfBaseAddress();
            
            gtr.Addresses.BaseAddress = new List<AVA_SF_SDK.TaxSvc.BaseAddress>();
            
            AVA_SF_SDK.TaxSvc.BaseAddress oraddr = new AVA_SF_SDK.taxSvc.BaseAddress();
            system.debug('---userID---'+userInfo.getUserId());
            system.debug('---userID---'+userInfo.getUserName());
            
            //Contact objContact = [select id,accountId,User__c from Contact where User__c=: UserInfo.getUserId() limit 1];
            //Account AccountAddress = [select id,name,Billing_Address_1__c,Billing_Address_2__c,Billing_City__c,Billing_Country__c,Billing_State__c,Billing_ZIP_Postal_Code__c from Account where id=: objContact.accountId Limit 1];
            //system.debug('---AccountAddress---'+AccountAddress); 
            system.debug('---OrderId---'+OrderId);
            Apttus_Config2__Order__c orderAdressDetails = [select id,name,APTSMD_BillingStreet__c,APTSMD_BillingCity__c,APTSMD_BillingState__c,APTSMD_BillingCountry__c,APTSMD_BillingPostalCode__c from Apttus_Config2__Order__c where id=:OrderId limit 1];  
            system.debug('---orderAdressDetails---'+orderAdressDetails); 
            oraddr.Line1 = orderAdressDetails.APTSMD_BillingStreet__c;
            oraddr.City = orderAdressDetails.APTSMD_BillingCity__c;
            oraddr.Region = orderAdressDetails.APTSMD_BillingState__c;
            oraddr.PostalCode = orderAdressDetails.APTSMD_BillingPostalCode__c;
            oraddr.AddressCode = 'Destination';
            
            gtr.Addresses.BaseAddress.add(oraddr);
            
            
            gtr.OriginCode = oraddr.AddressCode;
            
            
            gtr.CompanyCode = 'student123';//inmor
            gtr.CustomerCode = 'TestCustomer';
            gtr.DetailLevel = 'Document';
            gtr.DocCode ='1234' ;//orderAdressDetails.name;
            gtr.DocType = 'Salesinvoice';
            gtr.DocDate = DateTime.now().date();
            gtr.Lines = new AVA_SF_SDK.TaxSvc.ArrayOfLine();
            gtr.Lines.Line = new List<AVA_SF_SDK.TaxSvc.Line>();
            
            
            system.debug('lineItems--->'+lineItems);
            AVA_SF_SDK.TaxSvc.Line litem = new AVA_SF_SDK.TaxSvc.Line();
            
            
            litem.Amount = '1000'//lineItems.Apttus_Config2__NetPrice__c;
            system.debug('--->litem.Amount--->'+litem.Amount);
            litem.Description = 'test desc';//lineItems.Apttus_Config2__Description__c;
            litem.ItemCode = '1234';//lineItems.Apttus_Config2__ProductId__r.ProductCode;
            litem.No = 1234;//String.valueOf(lineItems.Apttus_Config2__LineNumber__c);
            litem.Qty ='1';//lineItems.Apttus_Config2__Quantity__c;
            gtr.Lines.Line.add(litem);
            
            
            
            AVA_SF_SDK.TaxSvc.Profile prf = new AVA_SF_SDK.TaxSvc.Profile();
            prf.Machine =  Label.ProfileMachine;//sf
            prf.Name =  Label.ProfileName;//Forsysinc
            prf.Client = 'ForsysInc';
            system.debug('---prf---'+prf);
            
            AVA_SF_SDK.TaxSvc.UsernameToken_element up = new AVA_SF_SDK.TaxSvc.UsernameToken_element();
            up.Username = Label.AvalaraUserName;//forsys   brahmap333@gmail.com
            up.Password =  Label.AvalaraPassword;//AvaTax#2017   Brahma123
            system.debug('----up----'+up);
            
            AVA_SF_SDK.TaxSvc.Security sec = new AVA_SF_SDK.TaxSvc.Security();
            sec.UsernameToken = up;
            system.debug('----sec---'+sec);
            
            AVA_SF_SDK.TaxSvc.TaxSvcSoap taxsvc = new AVA_SF_SDK.TaxSvc.TaxSvcSoap('https://development.avalara.net');
            taxsvc.Profile = prf;
            taxsvc.Security = sec;
            //taxSoap.endpoint_x = 'https://development.avalara.net/1.0/tax/get';
            system.debug('---taxsvc---'+taxsvc);
            
            AVA_SF_SDK.TaxSvc.GetTaxResult tax = new AVA_SF_SDK.TaxSvc.GetTaxResult();
            
            
            
            AVA_SF_SDK.TaxSvc.GetTaxResult gtres = null;
            try
            {
                gtres = taxsvc.GetTax(gtr);
                rVal += gtres.ResultCode;
                system.debug('gtres:'+gtres);
            }
            catch(Exception ex)
            {
                rVal += 'Excepted';
            }
            
            
            system.debug('----Total Tax Calculated---'+gtres.TotalTaxCalculated);
            //return gtres.TotalTax;
            AVA_SF_SDK.TaxSvc.PostTaxRequest PostTaxRequest = new AVA_SF_SDK.TaxSvc.PostTaxRequest();
            PostTaxRequest.Commit_x = true;
            PostTaxRequest.CompanyCode = 'student123';//inmor
            PostTaxRequest.DocCode = 'TestDoc';
            PostTaxRequest.DocDate = system.today();
            PostTaxRequest.DocType = 'Salesinvoice';
            //PostTaxRequest.HashCode = 
            PostTaxRequest.NewDocCode = 'TestDoc';
            PostTaxRequest.TotalAmount = gtres.TotalAmount;
            PostTaxRequest.TotalTax = gtres.TotalTaxCalculated;
            
            AVA_SF_SDK.TaxSvc.PostTaxResult PostTax = new AVA_SF_SDK.TaxSvc.PostTaxResult();
            
            PostTax = taxsvc.PostTax(PostTaxRequest);
            
            system.debug('PostTax Result----'+PostTax);
            
            lineItems.Line_Item_Tax__c = gtres.TotalTaxCalculated;
            totalTax+=gtres.TotalTaxCalculated;
            system.debug('----lineItems---'+lineItems.Line_Item_Tax__c);
            updateLineItemList.add(lineItems);
        }
        update updateLineItemList;
        
        Apttus_Config2__Order__c orderAdressDetails = [select APTSMD_Tax_On_Order_Amount__c from Apttus_Config2__Order__c where id=:OrderId limit 1];
        orderAdressDetails.APTSMD_Tax_On_Order_Amount__c = totalTax;
        update orderAdressDetails;
        EstimateTaxCalculation.saveLineItemAmountOnOrder(OrderId);
        
        
    }
    */
    
    
}