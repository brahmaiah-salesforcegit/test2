/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global virtual class GetTaxOpportunity extends AVA_SFCORE.GetTaxBase {
    global List<Account> loacct;
    global List<Opportunity> loOpp;
    global List<OpportunityLineItem> loOppLines;
    global GetTaxOpportunity() {

    }
    global GetTaxOpportunity(Id currOpp) {

    }
    global GetTaxOpportunity(ApexPages.StandardController controller) {

    }
    global virtual AVA_SF_SDK.TaxSvc.BaseAddress FetchDestinationAddress() {
        return null;
    }
    global virtual AVA_SF_SDK.TaxSvc.BaseAddress FetchOriginAddress() {
        return null;
    }
    global override virtual String FetchSignature() {
        return null;
    }
    global override virtual AVA_SF_SDK.TaxSvc.GetTaxRequest FetchTaxData(Boolean commitFlag) {
        return null;
    }
    global virtual void Initialize() {

    }
    global override virtual String ShouldCalcTax() {
        return null;
    }
    global override virtual void UpdateTaxData(AVA_SF_SDK.TaxSvc.GetTaxResult gtres, Boolean FinalizeFlag) {

    }
}
