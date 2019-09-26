/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global virtual class Contact_MailToValidation extends AVA_SFCORE.Contact_AddrValidation {
    global Id apCurPage {
        get;
        set;
    }
    global List<Contact> oContact;
    global Contact_MailToValidation() {

    }
    global Contact_MailToValidation(Id currAcct) {

    }
    global Contact_MailToValidation(ApexPages.StandardController controller) {

    }
    global Contact_MailToValidation(Contact testAccount) {

    }
    global override virtual void FetchOriginalAddress() {

    }
    global override System.PageReference UpdateAddress() {
        return null;
    }
    global override void UpdateStdController(AVA_SF_SDK.AddressSvc.ValidAddress ovaValAddr) {

    }
}
