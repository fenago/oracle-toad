select name, value from v$sysstat
where name in('db block gets',
'consistent gets',
'physical reads')
/
