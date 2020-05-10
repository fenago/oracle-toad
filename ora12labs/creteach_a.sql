REM  Script:  CRETEACH_A.SQL
REM  Purpose: To create a "teach" account for instructor
REM  Created: By Nagavalli Pataballa on 16-MAR-2001
REM           
REM  Updated: By Nancy Greenberg on 05-FEB-2004
REM            for the Oracle Database 10g: SQL Fundamentals I,           
REM            Oracle Database 10g: PL/SQL Fundamentals, and
REM            Oracle Database 10g: PL/SQL Program Units courses
REM  Updated: By Chaitanya Koratamaddi, on 10-Nov-2006
--Please replace the password for 'SYS', and connect string
--with your values.

CONNECT sys/oracle as sysdba

DROP USER teach_a CASCADE;
CREATE USER teach_a IDENTIFIED BY teach_a;
ALTER USER teach_a DEFAULT TABLESPACE users
temporary tablespace temp quota unlimited on users;
      

GRANT CREATE SESSION, CREATE TABLE, CREATE PROCEDURE
    , CREATE SEQUENCE, CREATE TRIGGER, CREATE VIEW
    , CREATE SYNONYM, ALTER SESSION, CREATE ANY INDEX 
    , CREATE PUBLIC SYNONYM, CREATE USER, CREATE ROLE
TO  teach_a;

REM  connect to teach_a account and invoke the scripts that create schema objects.

CONNECT teach_a/teach_a
@@hr_cre.sql
@@hr_popul.sql
@@hr_idx.sql
@@hr_code.sql
@@hr_comnt.sql
@@del_data.sql

CONNECT sys/oracle as sysdba

GRANT CREATE ANY DIRECTORY, QUERY REWRITE, DROP PUBLIC SYNONYM, DROP USER TO teach_a;
GRANT SCHEDULER_ADMIN to teach_a;
GRANT DBA to teach_a;
GRANT CREATE JOB to teach_a;
GRANT CREATE TYPE to teach_a;
GRANT MANAGE SCHEDULER to teach_a;
GRANT DEBUG CONNECT SESSION TO teach_a;
GRANT DEBUG ANY PROCEDURE TO teach_a;
GRANT EXECUTE ANY PROCEDURE TO teach_a;
GRANT EXECUTE ON sys.dbms_stats to teach_a;
GRANT SELECT ON v_$parameter TO teach_a;



REM  verify the number of rows created for each table
CONNECT teach_a/teach_a
@@confidence.sql


