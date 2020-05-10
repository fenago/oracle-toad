select tablespace_name,file_name from dba_data_files
        where tablespace_name = upper('&a_tablespace_name')
/
