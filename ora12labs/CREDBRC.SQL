REM #############################
REM  File 	: credbrc
REM  Created    : 15th MAY 1999
rem  Description: This create file is used to create the shared
rem               Recovery Catalog database for the Oracle8: Backup and Recovery
rem               Workshop.
REM 
REM #############################

spool $HOME/LABS/createdb16.log
set echo on
connect INTERNAL/oracle as sysdba
startup nomount pfile=$HOME/LABS/initRC.ora
CREATE DATABASE db16
LOGFILE 
    GROUP 1 ('$HOME/DATA/DISK5/redo0101.log',
             '$HOME/DATA/DISK6/redo0102.log') size 2M,
    GROUP 2 ('$HOME/DATA/DISK6/redo0201.log',
             '$HOME/DATA/DISK5/redo0202.log') size 2M
MAXLOGFILES 32
MAXLOGMEMBERS 3
MAXLOGHISTORY 1
DATAFILE '$HOME/DATA/DISK5/system01.dbf' SIZE 100M REUSE AUTOEXTEND ON
MAXDATAFILES 254
MAXINSTANCES 1
CHARACTER SET WE8ISO8859P1
NATIONAL CHARACTER SET WE8ISO8859P1;
spool off

connect INTERNAL/oracle
CREATE ROLLBACK SEGMENT SYSROL TABLESPACE "SYSTEM" 
        STORAGE (INITIAL 100K NEXT 100K);
ALTER ROLLBACK SEGMENT "SYSROL" ONLINE;

REM ********** TABLESPACE FOR ROLLBACK **********
CREATE TABLESPACE RBS DATAFILE '$HOME/DATA/DISK6/rbs01.dbf' SIZE 25M 
       DEFAULT STORAGE ( INITIAL 200K NEXT 200K MINEXTENTS 2 
                         MAXEXTENTS 200 PCTINCREASE 0);

REM ********** TABLESPACE FOR USER **********
CREATE TABLESPACE DATA DATAFILE '$HOME/DATA/DISK5/data01.dbf' SIZE 5M 
       DEFAULT STORAGE ( INITIAL 500K NEXT 500K MINEXTENTS 1 
                         MAXEXTENTS 200 PCTINCREASE 0);

REM ********** TABLESPACE FOR RECOVERY CATALOG **********
CREATE TABLESPACE rman_ts DATAFILE '$HOME/DATA/DISK6/rmants01.dbf' SIZE 50M 
       DEFAULT STORAGE ( INITIAL 500K NEXT 500K MINEXTENTS 1 
                         MAXEXTENTS 200 PCTINCREASE 0);

REM ********** TABLESPACE FOR TEMPORARY **********
CREATE TABLESPACE TEMP DATAFILE '$HOME/DATA/DISK5/temp01.dbf' SIZE 5M 
       DEFAULT STORAGE ( INITIAL 200K NEXT 200K MINEXTENTS 1 
                         MAXEXTENTS 200 PCTINCREASE 0) TEMPORARY;

REM ********** TABLESPACE FOR OEM_REPOSITORY **********
CREATE TABLESPACE OEM DATAFILE '$HOME/DATA/DISK6/oemrep01.dbf' SIZE 5M 
       MINIMUM EXTENT 128K
       DEFAULT STORAGE ( INITIAL 128K NEXT 128K MINEXTENTS 1 
                         MAXEXTENTS UNLIMITED PCTINCREASE 0);

CREATE PUBLIC ROLLBACK SEGMENT RBS01 TABLESPACE RBS
       STORAGE (INITIAL 200K NEXT 200K);
CREATE PUBLIC ROLLBACK SEGMENT RBS02 TABLESPACE RBS
       STORAGE (INITIAL 200K NEXT 200K);
ALTER ROLLBACK SEGMENT "RBS01" ONLINE;
ALTER ROLLBACK SEGMENT "RBS02" ONLINE;
alter user sys temporary tablespace TEMP;
alter user system temporary tablespace TEMP;

@$ORACLE_HOME/rdbms/admin/catalog.sql;
@$ORACLE_HOME/rdbms/admin/catproc.sql
@$ORACLE_HOME/rdbms/admin/caths.sql

REM The following commands must be run for each student
REM account in the class as well as the instructor account,
REM This creates a recovery catalog schema for each student account. 

create user db01 identified by db01 
default tablespace rman_ts
temporary tablespace temp
quota unlimited on rman_ts;

grant connect, resource,recovery_catalog_owner to db01;
connect db01/db01

connect system/manager
@$ORACLE_HOME/sqlplus/admin/pupbld.sql

connect INTERNAL/oracle
alter rollback segment "SYSROL" offline;
spool off
