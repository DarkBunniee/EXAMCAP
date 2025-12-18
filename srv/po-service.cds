using { example.db as db } from '../db/schema';


service POService @(requires: 'authenticated-user') {
  // @(odata.draft.enabled: true)
  entity POHeaders
   @(
    odata.draft.enabled:true,  // CRUD managed by SAP is enabled 
    //  it will prohibit all the other user
    restrict: [
            { grant: '*', to: ['AdminRole'] },
            { grant: 'READ', to: ['ApproverRole'] }  // ensbled grant for only adminrole 
        ]
  ) as projection on db.POHeader;
  entity POItems   as projection on db.POItem;

}
