SET FEEDBACK OFF
set verify off;
set echo off;
REM
REM Copyright 2004 Sideris Courseware Corporation.
REM
REM Script to prepare workshop for Sideris course ora10g206
REM File name is ora10g206Setup.SQL
REM
REM Note that no path names are included in the file specifications used within this
REM script. If you wish to have explicit control over the location of these files
REM then modify this script accordingly before executing it.
REM
REM This script also assumes that a tablespace USERS is available for the sample
REM database IDs to use.
REM

UNDEFINE PASSWORD
UNDEFINE SERVICE
DISCONNECT;

PROMPT
PROMPT ******************************
PROMPT You may destroy all objects created by this script by executing ora10g206Cleanup.SQL first
PAUSE  Press ENTER to continue or CONTROL+C to abort.


PROMPT ******************************
accept  PASSWORD DEFAULT MANAGER prompt 'Enter the password for the database ID SYS [CHANGE_ON_INSTALL]: '
accept  SERVICE DEFAULT LOCAL prompt  'Enter the database service name (e.g. TESTDB): '
PROMPT	Connecting to the database now...
connect SYS/&PASSWORD@&SERVICE AS SYSDBA;

PROMPT ******************************
PROMPT Creating the tablespace SiderisUsers...

Create tablespace SiderisUsers
datafile 'SiderisUsers.dbf' size 20m
segment space management auto;


PROMPT ******************************
PROMPT Creating the user STUDENT1 now...

Create user STUDENT1 identified by STUDENT1
default tablespace SiderisUsers
quota unlimited on SiderisUsers;

Grant create session,connect,resource to STUDENT1;
Grant create table to STUDENT1;
Grant sysdba to STUDENT1;
grant exp_full_database to STUDENT1;
grant imp_full_database to STUDENT1;
grant execute any procedure to STUDENT1;
grant advisor to STUDENT1;
grant unlimited tablespace to STUDENT1;
grant execute on dbms_rls to STUDENT1;
grant create any job to STUDENT1;
grant administer sql tuning set to STUDENT1;



connect STUDENT1/STUDENT1@&SERVICE;

PROMPT ******************************
PROMPT Creating the sample database in STUDENT1 now...

@ElectronicsDefine.sql;




PROMPT ******************************
PROMPT Creating the user STUDENT2 now...

connect SYS/&PASSWORD@&SERVICE AS SYSDBA;

Create user STUDENT2 identified by STUDENT2
default tablespace SiderisUsers
quota unlimited on SiderisUsers;

Grant create session to STUDENT2;
Grant create table to STUDENT2;

PROMPT ******************************
PROMPT Creating the SALES1 table in STUDENT2 now...

CREATE TABLE student2.sales1
AS SELECT *
FROM student1.sales;

set echo off;

PROMPT ******************************
PAUSE Script complete. Check the output for any errors and press ENTER to finish.

