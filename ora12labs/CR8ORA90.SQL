CREATE CONTROLFILE REUSE DATABASE ora90
LOGFILE GROUP 4 ('9I21LOG4A.LOG','9I21LOG4B.LOG') SIZE 2M REUSE,
        GROUP 5 ('9I21OG5A.LOG','9I21LOG5B.LOG') SIZE 2M REUSE RESETLOGS
DATAFILE 'C:\9I\ORADATA\ORA90\SYSTEM01.DBF',                                               
         'C:\9I\ORADATA\ORA90\UNDOTBS01.DBF',                                              
         'C:\9I\ORADATA\ORA90\CWMLITE01.DBF',                                              
         'C:\9I\ORADATA\ORA90\DRSYS01.DBF',                                                
         'C:\9I\ORADATA\ORA90\EXAMPLE01.DBF',                                              
         'C:\9I\ORADATA\ORA90\INDX01.DBF',                                                 
         'C:\9I\ORADATA\ORA90\ODM01.DBF',                                                  
         'C:\9I\ORADATA\ORA90\TOOLS01.DBF',                                                
         'C:\9I\ORADATA\ORA90\USERS01.DBF',                                                
         'C:\9I\ORADATA\ORA90\XDB01.DBF',                                                  
         'C:\ORACLE8I\UNDORA9I.DBF',                                                       
         'C:\ORACLE\RBS.DBF' 
;
