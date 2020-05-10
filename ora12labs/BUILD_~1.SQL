--
-- $Header: build_db.sql 1.1 94/10/18 15:55:37 gdudey Osd<desktop/netware> $ Copyr (c) 1994 Oracle
--
-- This file must be run out of the directory containing the
-- initialization file.

startup nomount pfile=init.ora

--  Create database

create database oracle
    controlfile reuse
    logfile 'c:\oracle8i\redo01.log' size 1M reuse,
            'c:\9i\redo02.log' size 1M reuse,
            'c:\oracle\redo03.log' size 1M reuse
            
    datafile 'c:\oracle8i\system01.dbf' size 80M reuse autoextend on
      next 10M;

create rollback segment rb_temp storage (initial 100 k next 250 k);

-- Create additional tablespaces ...

-- USERs: Create user sets this as the default tablespace
-- TEMP: Create user sets this as the temporary tablespace
-- RBS: For rollback segments

create tablespace users
    datafile 'c:\9i\dbs\users01.dbf' size 10M reuse autoextend on
      next 5M;
create tablespace rbs
    datafile 'c:\9i\dbs\users01.dbf\rbs01.dbf' size 10M reuse autoextend on
      next 1M;
create temporary tablespace temp
    tempfile 'c:\9i\dbs\users01.dbf\temp01.dbf' size 10M reuse autoextend on
      next 2M;
create tablespace oem_repository
    datafile 'c:\9i\dbs\users01.dbf\oemrep01.dbf' size 20M reuse autoextend on
      next 2M;
create tablespace indx
    datafile 'c:\9i\dbs\users01.dbf\indx01.dbf' size 10M reuse autoextend on
      next 1M;
--      
alter rollback segment rb_temp online;

-- Change the SYSTEM users' password, default tablespace and
-- temporary tablespace.

alter user system temporary tablespace temp;
alter user system default tablespace users;

-- Create 16 rollback segments.  Allows 16 concurrent users with open
-- transactions updating the database. This should be enough.

create public rollback segment rb1 storage(initial 50K next 250K)
  tablespace rbs;
create public rollback segment rb2 storage(initial 50K next 250K)
  tablespace rbs;
create public rollback segment rb3 storage(initial 50K next 250K)
  tablespace rbs;
create public rollback segment rb4 storage(initial 50K next 250K)
  tablespace rbs;
create public rollback segment rb5 storage(initial 50K next 250K)
  tablespace rbs;
create public rollback segment rb6 storage(initial 50K next 250K)
  tablespace rbs;
create public rollback segment rb7 storage(initial 50K next 250K)
  tablespace rbs;
create public rollback segment rb8 storage(initial 50K next 250K)
  tablespace rbs;
create public rollback segment rb9 storage(initial 50K next 250K)
  tablespace rbs;
create public rollback segment rb10 storage(initial 50K next 250K)
  tablespace rbs;
create public rollback segment rb11 storage(initial 50K next 250K)
  tablespace rbs;
create public rollback segment rb12 storage(initial 50K next 250K)
  tablespace rbs;
create public rollback segment rb13 storage(initial 50K next 250K)
  tablespace rbs;
create public rollback segment rb14 storage(initial 50K next 250K)
  tablespace rbs;
create public rollback segment rb15 storage(initial 50K next 250K)
  tablespace rbs;
create public rollback segment rb16 storage(initial 50K next 250K)
  tablespace rbs;

