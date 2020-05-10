SET FEEDBACK On;
set verify off;
set echo off;

REM
REM Copyright 2004 Sideris Courseware Corporation.
REM Script to prepare workshop for Sideris course ora10g206
REM File name is ora10g206Cleanup.SQL
REM
REM This must be executed while connected as SYS

connect student1/student1 as sysdba

Drop user STUDENT1 cascade;
Drop user STUDENT2 cascade;

PROMPT The following tablespaces exist in your database.

Select name
from v$tablespace;


Drop tablespace siderisusers including contents and datafiles;

PROMPT The tablespace siderisusers including its contents will be dropped.





PROMPT ******************************
PAUSE Script complete. Check the output for any errors and press ENTER to finish.

