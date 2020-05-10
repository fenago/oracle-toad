REM  Script:  CRETEACH_b.SQL
REM  Purpose: To create a "teach" account for instructor
REM  Created: By Chaitanya Koratamaddi on 10-June-2007     
REM            for the Oracle Database 11g: SQL Fundamentals 
--Please replace the password for 'SYS', and connect string
--with your values.

CONNECT sys/oracle as sysdba

DROP USER teach_b CASCADE;
CREATE USER teach_b IDENTIFIED BY teach_b;
ALTER USER teach_b DEFAULT TABLESPACE users
temporary tablespace temp quota unlimited on users;
      

GRANT CREATE SESSION, CREATE TABLE, CREATE PROCEDURE
    , CREATE SEQUENCE, CREATE TRIGGER, CREATE VIEW
    , CREATE SYNONYM, ALTER SESSION, CREATE ANY INDEX 
    , CREATE PUBLIC SYNONYM, CREATE USER, CREATE ROLE
TO  teach_b;

REM  connect to teach_b account and invoke the scripts that create schema objects.

CONNECT teach_b/teach_b
@@hr_cre.sql
@@hr_popul.sql
@@hr_idx.sql
@@hr_code.sql
@@hr_comnt.sql
@@del_data.sql


CONNECT sys/oracle as sysdba

GRANT CREATE ANY DIRECTORY, QUERY REWRITE, DROP PUBLIC SYNONYM, DROP USER TO teach_b;
GRANT SCHEDULER_ADMIN to teach_b;
GRANT DBA to teach_b;
GRANT CREATE JOB to teach_b;
GRANT CREATE TYPE to teach_b;
GRANT MANAGE SCHEDULER to teach_b;
GRANT DEBUG CONNECT SESSION TO teach_b;
GRANT DEBUG ANY PROCEDURE TO teach_b;
GRANT EXECUTE ANY PROCEDURE TO teach_b;
GRANT EXECUTE ON sys.dbms_stats to teach_b;
GRANT SELECT ON v_$parameter TO teach_b;



REM  verify the number of rows created for each table
CONNECT teach_b/teach_b
@@confidence.sql


