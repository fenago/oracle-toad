create controlfile reuse database oracle
logfile group 1 ('c:\oracle\contxx1a.log','c:\oracle8i\contxx1b.log') size 2m,
        group 2 ('c:\oracle\contxx2a.log','c:\oracle8i\contxx2b.log') size 2m reuse RESETLOGS
datafile 'C:\9I\ORADATA\ORACLE\SYSTEM01.dbf',
'C:\9I\ORADATA\ORACLE\UNDOTBS01.dbf',
'C:\9I\ORADATA\ORACLE\DRSYS01.dbf',
'C:\9I\ORADATA\ORACLE\EXAMPLE01.dbf',
'C:\9I\ORADATA\ORACLE\INDX01.dbf',
'C:\9I\ORADATA\ORACLE\ODM01.dbf',
'C:\9I\ORADATA\ORACLE\TOOLS01.dbf',
'C:\9I\ORADATA\ORACLE\USERS01.dbf',
'C:\9I\ORADATA\ORACLE\XDB01.dbf',
'C:\9I\ORADATA\ORACLE\OEM_REPOSITORY.dbf',
'C:\ORACLE\USERDATA2.dbf',
'C:\ORACLE\JERINDEX.dbf',
'C:\ORACLE\PERSON.dbf'