rem
rem Header: hr8_main.sql 09-jan-01
rem
rem Copyright (c) 2001, Oracle Corporation.  All rights reserved.  
rem
rem Owner  : ahunold
rem
rem NAME
rem   hr8_main.sql - Main script for hr8 schema
rem
rem DESCRIPTON
rem   hr8 (Human Resources) is the smallest and most simple one 
rem   of the Sample Schemas
rem   
rem NOTES
rem   Run as SYS or SYSTEM
rem
rem MODIFIED   (MM/DD/YY)
rem   ahunold   10/03/01 - Oracle8i version
rem   cmcaulay  02/27/02 - added variable for machine name to install on remote db
rem   kmchorto  08/01/02 - removed role FOR sys login - NOT allowed under oracle8
SET ECHO OFF
PROMPT 
PROMPT specify password for hr8 as parameter 1:
DEFINE pass     = &1
PROMPT 
PROMPT specify default tablespace for hr8 as parameter 2:
DEFINE tbs      = &2
PROMPT 
PROMPT specify temporary tablespace for hr8 as parameter 3:
DEFINE ttbs     = &3
PROMPT 
PROMPT specify password for SYS as parameter 4:
DEFINE pass_sys = &4
PROMPT 
PROMPT specify log path as parameter 5:
DEFINE log_path = &5
PROMPT
-- The first dot in the spool command below is 
-- the SQL*Plus concatenation character
DEFINE spool_file = &log_path.hr8_main.log
SPOOL &spool_file
REM =======================================================
REM cleanup section
REM =======================================================
DROP USER hr8 CASCADE;
REM =======================================================
REM create user
REM three separate commands, so the create user command 
REM will succeed regardless of the existence of the 
REM DEMO and TEMP tablespaces 
REM =======================================================
CREATE USER hr8 IDENTIFIED BY &pass;
ALTER USER hr8 DEFAULT TABLESPACE &tbs
              QUOTA UNLIMITED ON &tbs;
ALTER USER hr8 TEMPORARY TABLESPACE &ttbs;
GRANT CONNECT TO hr8;
GRANT RESOURCE TO hr8;
REM =======================================================
REM grants from sys schema
REM =======================================================
rem KM: 01Aug02 - remove "AS SYSDBA" clause - NOT needed FOR GRANT under Oracle8
CONNECT sys/&pass_sys&&database_name
GRANT execute ON sys.dbms_stats TO hr8;
REM =======================================================
REM create hr8 schema objects
REM =======================================================
CONNECT hr8/&pass&&database_name
ALTER SESSION SET NLS_LANGUAGE=American;
ALTER SESSION SET NLS_TERRITORY=America;
--
-- create tables, sequences and constraint
--
@@hr8_cre
-- 
-- populate tables
--
@@hr8_popul
--
-- create indexes
--
@@hr8_idx
--
-- create procedural objects
--
@@hr8_code
--
-- add comments to tables and columns
--
@@hr8_comnt
--
-- gather schema statistics
--
@@hr8_analz
spool off
/
