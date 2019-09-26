/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global abstract class AddressValidationBase {
    global Id apCurPage {
        get;
        set;
    }
    global List<AVA_SFCORE__TaxNowSetting__c> loCfg;
    global AVA_SFCORE.PageAddress oaOriginal {
        get;
        set;
    }
    global AVA_SFCORE.PageAddress oaValidated {
        get;
        set;
    }
    global AddressValidationBase() {

    }
    global abstract void FetchOriginalAddress();
    global virtual System.PageReference RedirectPage() {
        return null;
    }
    global abstract System.PageReference UpdateAddress();
    global abstract void UpdateStdController(AVA_SF_SDK.AddressSvc.ValidAddress param0);
    global virtual System.PageReference ValidateAddress() {
        return null;
    }
}
