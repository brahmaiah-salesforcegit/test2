public class AttachmentTest{
    public static ContentVersion insertattachment(){
        String csv = 'Id,Name\n';
        for ( List<Account> accts : [ SELECT id, name FROM Account LIMIT 10 ] ) {
          for ( Account acct : accts ) {
            csv += acct.id + ',' + acct.name.escapeCsv() + '\n';
          }
        }
         
        ContentVersion file = new ContentVersion(
          title = 'accounts.csv',
          versionData = Blob.valueOf( csv ),
          pathOnClient = '/accounts.csv'
        );
         
        //insert file;
        System.debug( file.pathOnClient  );
        return file;
    }
}