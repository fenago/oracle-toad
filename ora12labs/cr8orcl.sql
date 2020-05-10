CREATE CONTROLFILE REUSE DATABASE orcl
LOGFILE GROUP 1 ('oraLOG1A.ORA','/u01/app/oracle/oraLOG4B.ORA') SIZE 100m,
        GROUP 2 ('oraLOG2A.ORA','/u01/app/oracle/oraLOG5B.ORA') SIZE 100m RESETLOGS
DATAFILE 'C:\ORACLE\PRODUCT\10.1.0\ORADATA\ORCL\SYSTEM01.DBF',                                                            
         'C:\ORACLE\PRODUCT\10.1.0\ORADATA\ORCL\UNDOTBS01.DBF',                                                           
         'C:\ORACLE\PRODUCT\10.1.0\ORADATA\ORCL\SYSAUX01.DBF',                                                            
         'C:\ORACLE\PRODUCT\10.1.0\ORADATA\ORCL\EXAMPLE01.DBF',                                                           
         'C:\ORACLE\RMAN.DBF'                                                                                            

;
