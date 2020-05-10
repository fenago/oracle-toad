CREATE CONTROLFILE REUSE DATABASE oracle
LOGFILE GROUP 4 ('log4orca.ora','log4orcb.ORA') SIZE 500K,
        group 5 ('log5orca.ora','log5orcb.ora') size 500k resetlogs
DATAFILE 'C:\ORAWIN95\database\sys1orcl.ORA','C:\ORAWIN95\Database\tmp1orcl.ORA','C:\ORAWIN95\DATABASE\JERDATA.DBF',
'c:\orawin95\database\usr1orcl.ora','c:\orawin95\database\rbs1orcl.ora',
'c:\orawin95\dbs\jerindx.dbf','c:\orawin95\jerind2.dbf','c:\orawin95\dbs\jerin2.dbf'
;
