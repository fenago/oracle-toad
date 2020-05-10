select table_name,index_name,tablespace_name
  from user_indexes
  where table_name = upper('&atable_name')
/
