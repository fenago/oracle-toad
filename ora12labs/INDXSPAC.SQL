select substr(table_name,1,15) TABLENAME,substr(index_name,1,15) INDEXNAME,
pct_free,leaf_blocks,ini_trans from user_indexes
/
