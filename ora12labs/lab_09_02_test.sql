exec dbms_stats.gather_table_stats('sh','exp_test','for all columns size 1 for columns(mod(Nid,10)) size 3');
/
