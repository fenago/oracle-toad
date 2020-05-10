set echo on
select dbms_stats.create_extended_stats(
 'sh','exp_test','(mod(Nid,10))') from dual;

