-- Look at init.ora in c:\oraNT\rdbms7X OR RDBMS80 for
 control file locations.
select * from V$DATAFILE;
select * from V$logfile;
-- copy all of these files using the copy command in dos.
-- For example;  copy c:\oraNT\dbs\dbs1.ora c:\oraNT\dbs\dbs1.bkp
