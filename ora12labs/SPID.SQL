select s.username, p.spid
from v$session s, v$process p
where s.paddr = p.addr
and s.username = 'SYSTEM';





