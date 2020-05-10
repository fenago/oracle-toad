select name, gets, misses, sleeps, immediate_gets, immediate_misses
from v$latch
where name in('redo allocation', 'redo copy')
/
