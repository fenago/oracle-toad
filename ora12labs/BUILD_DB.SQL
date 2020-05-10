-------------------------------------------------------------------------------
-- Script to build seed database for Personal Oracle
-------------------------------------------------------------------------------
-- NOTES
     Called from buildall.sql
-- MODIFICATIONS
--   rs  12/04/94 - Comment, clean up, resize, for production

-------------------------------------------------------------------------------

--startup nomount pfile=%rdbms71%\init.ora

--  Create database for Windows RDBMS

--create database oracle
--    controlfile reuse
 --   logfile '%oracle_home%\dbs\wdblog1.ora' size 400K reuse,
 --           '%oracle_home%\dbs\wdblog2.ora' size 400K reuse
 --   datafile '%oracle_home%\dbs\wdbsys.ora' size 10M reuse
 --   character set WE8ISO8859P1;

create public rollback segment rb_temp;

-- Create additional tablespaces ...

-- USER_DATA: create user sets this as the default tablespace
-- TEMPORARY_DATA: create user sets this as the temporary tablespace
-- ROLLBACK_DATA: For rollback segments

alter tablespace system
    default storage (initial 4k next 4k pctincrease 10 minextents 1 maxextents 121);
create tablespace user_data
    datafile '%oracle_home%\dbs\wdbuser.ora' size 3M reuse
    default storage (initial 4k next 4k pctincrease 10 minextents 1 maxextents 121);
create tablespace rollback_data
    datafile '%oracle_home%\dbs\wdbrbs.ora' size 3M reuse
    default storage (initial 100k next 100k minextents 2 maxextents 121);
create tablespace temporary_data
    datafile '%oracle_home%\dbs\wdbtemp.ora' size 2M reuse
    default storage (initial 4k next 4k pctincrease 10 minextents 1 maxextents 121);
alter rollback segment rb_temp online;

-- Create 2 rollback segments.  Allows 32 concurrent users with open
-- transactions updating the database. This should be enough.

create public rollback segment rb1
  tablespace rollback_data;
create public rollback segment rb2
  tablespace rollback_data;
