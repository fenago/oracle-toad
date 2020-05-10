/*  select * from V$logfile to see the number of active logfiles.          */

    select * from V$logfile;

/*  TO see the current log sequence number look at the V$log view.         */

    select * from V$log;

/*  Delete an unused "NOT CURRENT" logfile as indicated above              */


