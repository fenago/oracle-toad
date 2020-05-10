select table_name,tablespace_name
 from dba_tables 
where table_name like 'STATS$%'
/
