CREATE CONTROLFILE REUSE DATABASE oracle
LOGFILE GROUP 4 ('c:\oracLE\oraLOG4A.log','C:\oracle\oraLOG4B.LOG') SIZE 100m,
        GROUP 5 ('c:\oraCLE\oraLOG5A.log','C:\oracle\oraLOG5B.LOG') SIZE 100M RESETLOGS
DATAFILE 'c:\9I\ORADATA\ORACLE\SYSTEM01.dbf',                                              
         'c:\9I\ORADATA\ORACLE\UNDOTBS01.dbf',                                             
         'c:\9I\ORADATA\ORACLE\DRSYS01.dbf',                                               
         'c:\9I\ORADATA\ORACLE\EXAMPLE01.dbf',                                             
         'c:\9I\ORADATA\ORACLE\INDX01.dbf',                                                
         'c:\9I\ORADATA\ORACLE\ODM01.dbf',                                                 
         'c:\9I\ORADATA\ORACLE\TOOLS01.dbf',                                               
         'c:\9I\ORADATA\ORACLE\USERS01.dbf',                                               
         'c:\9I\ORADATA\ORACLE\XDB01.dbf',                                                 
         'c:\9I\ORADATA\ORACLE\OEM_REPOSITORY.dbf',                                        
         'c:\ORACLE\USERDATA2.dbf' 
;
