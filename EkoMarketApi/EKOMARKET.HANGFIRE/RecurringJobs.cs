using Hangfire;

namespace EKOMARKET.HANGFIRE
{
    public static class RecurringJobs
    {
        [Obsolete]
        public static void DatabaseBackupOperation()
        {

            RecurringJob.RemoveIfExists(nameof(UpdatePricesJobManager));
            RecurringJob.AddOrUpdate<UpdatePricesJobManager>(nameof(UpdatePricesJobManager),
                job => job.Process(), "59 23 * * *", TimeZoneInfo.Local);
        }

    }
}
