select file_name from dba_data_files
where tablespace_name in
(select tablespace_name from dba_tables
where table_name = 'NEWEMP' and OWNER = 'SCOTT'); 
