/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global virtual class Account_BillToValidation extends AVA_SFCORE.Account_AddrValidation {
    global Id apCurPage {
        get;
        set;
    }
    global String countryFieldName;
    global List<Account> oAccount;
    global String stateFieldName;
    global Account_BillToValidation() {

    }
    global Account_BillToValidation(Id currAcct) {

    }
    global Account_BillToValidation(ApexPages.StandardController controller) {

    }
    global Account_BillToValidation(Account testAccount) {

    }
    global override virtual void FetchOriginalAddress() {

    }
    global override System.PageReference UpdateAddress() {
        return null;
    }
    global override void UpdateStdController(AVA_SF_SDK.AddressSvc.ValidAddress ovaValAddr) {

    }
}
