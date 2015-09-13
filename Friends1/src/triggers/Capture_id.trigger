trigger Capture_id on Lead (before insert) {
    
   Intermediate__c i = new Intermediate__c();
   for(Lead l: Trigger.new){
      l.captured_id__c = i.id;
   }
}