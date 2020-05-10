column file_name format a40
column tablespace_name format a20
select file_name,tablespace_name,status
  from dba_data_files
/
