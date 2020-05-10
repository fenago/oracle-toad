-- Use Select * from V$LOGFILE to see if redo logs are active
alter database
add logfile 'c:\orawin\rdbms71\redo2.dbf' size 500K
/
