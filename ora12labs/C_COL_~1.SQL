column table_name format a11
column index_name format a15
column column_name format a18
select table_name, index_name, column_name,column_position
  from user_ind_columns
  where table_name = upper('&a_table_name')
/
