connect system/manager
set head off
set feedb off
alter system switch logfile;
@$HOME/LABS/moddb.sql
connect system/manager
alter system switch logfile;
spool $HOME/breakarc.sh
select 'rm -f ' || name || ';' 
from v$archived_log al
where al.sequence# = (select (min(l.sequence#)- 1)
  from v$log l);
spool off
alter system switch logfile;
!chmod 775 $HOME/breakarc.sh
!$HOME/breakarc.sh
connect system/manager
