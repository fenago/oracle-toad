select
‘exec analyzedb.reorg_a_table4(’||””||rtrim(t.table_owner)||””||’,'||””||
rtrim(t.table_name)||””||’);’,
t.table_owner||’.'||t.table_name name,
a.num_rows,
sum(t.inserts) ins,
sum(t.updates) upd,
sum(t.deletes) del,
sum(t.updates)+sum(t.inserts)+sum(t.deletes) tot_chgs,
to_char((sum(t.deletes)/(decode(a.num_rows,0,1,a.num_rows)))*100.0,’999999.99') per_del,
round(((sum(t.updates)+sum(t.inserts)+sum(t.deletes))/(decode(a.num_rows,0,1,a.num_rows)) *100.0),2) per_chg
from analyzedb.table_modifications t,
all_tables a
where t.timestamp >= to_date(’&from_date’,'dd-mon-yyyy’) and
t.table_owner = a.owner and t.table_owner not in (’SYS’,'SYSTEM’) and
t.table_name=a.table_name
having (sum(t.deletes)/(decode(a.num_rows,0,1,a.num_rows)))*100.0 >=5
group by t.table_owner, t.table_name, a.num_rows
order by num_rows desc, t.table_owner, t.table_name;

