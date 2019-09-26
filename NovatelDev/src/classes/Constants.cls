public class Constants{
        public static final Integer DEFAULT_ROWS = 5;
        public static final String SELECT_ONE = Label.Select_One;
        public static final String INVENTORY_LEVEL_LOW = Label.Inventory_Level_Low;
        
        public static final List<SelectOption> PRODUCT_FAMILY = getCountries();
        public static final String DRAFT_ORDER_STATUS = 'Draft';
        public static final String ACTIVATED_ORDER_STATUS = 'Activated';
        public static final String INVENTORY_ANNOUNCEMENTS = 'Inventory Announcements';
        public static final String ERROR_MESSAGE = 'An error has occurred, please take a screenshot with the URL and send it to IT.';
        public static final String STANDARD_PRICEBOOK_ID = '01s6F000007etoy';



        public static  List<SelectOption> getCountries()
        {
          List<SelectOption> options = new List<SelectOption>();
                
           Schema.DescribeFieldResult fieldResult = Product2.Family.getDescribe();
           List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
                
           for( Schema.PicklistEntry f : ple)
           {
              options.add(new SelectOption(f.getLabel(), f.getValue()));
           }       
           return options;
        }
}