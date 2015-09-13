global class UpdateInactiveAccountBatchSchedule implements Schedulable
{
    global void execute(SchedulableContext SC)
    {
        ClsUpdateInactiveAccountBatch updateInactiveAccountBatchObj = new ClsUpdateInactiveAccountBatch ();
        Integer BatchSize = 2000;
        database.executebatch(updateInactiveAccountBatchObj,BatchSize);
    }
}