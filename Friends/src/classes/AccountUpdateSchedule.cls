global class AccountUpdateSchedule implements Schedulable 
{
    global void execute(SchedulableContext SC)
    {
        ClsaccountupdateBatch accountupdateBatchObj = new ClsaccountupdateBatch();
        Integer batchSize = 200;
        database.executebatch(accountupdateBatchObj);
    }
}