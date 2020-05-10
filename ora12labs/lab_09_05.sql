select e.extension col_group, t.num_distinct, t.histogram
 from user_stat_extensions e, user_tab_col_statistics t
 where e.extension_name=t.column_name
 and t.table_name='EXP_TEST'
/
