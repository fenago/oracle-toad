select index_name,index_type,table_name,table_owner from user_indexes 	where  table_owner=upper('&an_owner') 
	and table_name=upper('&a_table')
/
