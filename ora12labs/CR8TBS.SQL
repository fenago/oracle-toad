/*  Create three tablespaces for use by the bigpart.sql script.

-- USER_DATA: Create user sets this as the default tablespace
-- TOOLS: Needed for partitioned table bigpart
-- JERINDX: For indexes
connect system/password
create tablespace user_data
    datafile '/depot/user_data01.dbf' size 70M reuse autoextend on
      next 5M;
create tablespace TOOLS
    datafile '/depot/tool01.dbf' size 75M reuse autoextend on
      next 5M;
create tablespace jerindex
    datafile '/depot/jerindex.dbf' size 72M reuse autoextend on
      next 5M;
connect scott/tiger
