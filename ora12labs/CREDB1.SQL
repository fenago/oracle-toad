REM #############################
REM  File: credb1
REM  Purpose: Uniform database environment in Class rooms
REM  Created : 19th April 1999
REM 
REM  Following values may need to be updated appropriately.
REM  $DB_NAME	Example db01
REM 		The database name to be same for instance and service names.
REM  $ORADATA  	HOME/DATA unix in classes
REM 		Data directory containing datafile, control file and log files
REM 		In class rooms you may use DISK1, 2, 3 etc., to
REM 		simulate multiple disks.
REM  $ORABASE 	Example : $HOME
REM  		Directory where the administrative sudirectories will be created
REM  		The admin. sudirectories are BDUMP, CDUMP, UDUMP, PFILE
REM 
REM #############################

spool $HOME/LABS/createdb1.log
set echo on
connect INTERNAL/oracle
CREATE ROLLBACK SEGMENT SYSROL TABLESPACE "SYSTEM" 
        STORAGE (INITIAL 100K NEXT 100K);
ALTER ROLLBACK SEGMENT "SYSROL" ONLINE;

REM ********** TABLESPACE FOR ROLLBACK **********
CREATE TABLESPACE RBS DATAFILE '$HOME/DATA/DISK2/rbs01.dbf' SIZE 15M 
       DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 2 
                         MAXEXTENTS 200 PCTINCREASE 0);

REM ********** TABLESPACE FOR USER **********
CREATE TABLESPACE DATA DATAFILE '$HOME/DATA/DISK3/data01.dbf' SIZE 50M 
       DEFAULT STORAGE ( INITIAL 500K NEXT 500K MINEXTENTS 1 
                         MAXEXTENTS 200 PCTINCREASE 0);

REM ********** TABLESPACE FOR TEMPORARY **********
CREATE TABLESPACE TEMP DATAFILE '$HOME/DATA/DISK2/temp01.dbf' SIZE 10M 
       DEFAULT STORAGE ( INITIAL 200K NEXT 200K MINEXTENTS 1 
                         MAXEXTENTS 200 PCTINCREASE 0) TEMPORARY;

REM ********** TABLESPACE FOR INDEX **********
CREATE TABLESPACE INDX DATAFILE '$HOME/DATA/DISK2/indx01.dbf' SIZE 5M 
       DEFAULT STORAGE ( INITIAL 500K NEXT 500K MINEXTENTS 1 
                         MAXEXTENTS 200 PCTINCREASE 1);

REM ********** TABLESPACE FOR OEM_REPOSITORY **********
CREATE TABLESPACE OEM DATAFILE '$HOME/DATA/DISK3/oemrep01.dbf' SIZE 5M 
       MINIMUM EXTENT 128K
       DEFAULT STORAGE ( INITIAL 128K NEXT 128K MINEXTENTS 1 
                         MAXEXTENTS UNLIMITED PCTINCREASE 0);

CREATE TABLESPACE QUERY_DATA DATAFILE'$HOME/DATA/DISK1/query01.dbf' size 1M
       DEFAULT STORAGE (INITIAL 50K NEXT 50K PCTINCREASE 0 MAXEXTENTS 200);

CREATE ROLLBACK SEGMENT RBS01 TABLESPACE RBS
       STORAGE (INITIAL 200K NEXT 200K);
CREATE ROLLBACK SEGMENT RBS02 TABLESPACE RBS
       STORAGE (INITIAL 200K NEXT 200K);
ALTER ROLLBACK SEGMENT "RBS01" ONLINE;
ALTER ROLLBACK SEGMENT "RBS02" ONLINE;
alter user sys temporary tablespace TEMP;

@$ORACLE_HOME/rdbms/admin/catalog.sql
@$ORACLE_HOME/rdbms/admin/catproc.sql
@$ORACLE_HOME/rdbms/admin/caths.sql

connect system/manager
@$ORACLE_HOME/sqlplus/admin/pupbld.sql

create user scott identified by tiger
default tablespace data 
temporary tablespace temp
quota unlimited on data;
alter user scott quota unlimited on indx;
grant connect, resource to scott;

### For Backup and Recovery Class Labs, the following lines are required.
###
connect / as sysdba;
grant sysdba, recovery_catalog_owner to scott;
connect scott/tiger
@cretab.sql

alter tablespace query_data read only;

### Following lines are not required for Backup and Recovery Class   ###
### Hence are commented out. For another class, if needed please use ###
### create user summit identified by summit
### default tablespace data 
### temporary tablespace temp
### quota unlimited on data;
### alter user summit quota unlimited on indx;
### grant connect, resource to summit;


connect internal
alter rollback segment "SYSROL" offline;
spool off

