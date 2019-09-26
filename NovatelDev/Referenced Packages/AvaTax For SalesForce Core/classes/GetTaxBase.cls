/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global abstract class GetTaxBase {
    global Id apCurPage;
    global List<AVA_SFCORE__TaxNowSetting__c> loCfg;
    global List<String> TNStatuses;
    global GetTaxBase() {

    }
    global AVA_SF_SDK.TaxSvc.GetTaxResult CalcTax(Boolean finalizeFlag) {
        return null;
    }
    global System.PageReference CalcTax() {
        return null;
    }
    global virtual String FetchSignature() {
        return null;
    }
    global abstract AVA_SF_SDK.TaxSvc.GetTaxRequest FetchTaxData(Boolean param0);
    global System.PageReference Finalize() {
        return null;
    }
    global System.PageReference RedirectPage() {
        return null;
    }
    global abstract String ShouldCalcTax();
    global abstract void UpdateTaxData(AVA_SF_SDK.TaxSvc.GetTaxResult param0, Boolean param1);
}
