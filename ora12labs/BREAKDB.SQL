connect system/manager
set head off
set feedback off;
alter system switch logfile;
@$HOME/LABS/moreemp.sql
connect system/manager
alter system switch logfile;
spool $HOME/breakdb.sh
select 'rm -f ' || file_name || ';' from dba_data_files
where tablespace_name = 'DATA01';
spool off
!chmod 775 $HOME/breakdb.sh
!$HOME/breakdb.sh
alter system switch logfile;
!sqlplus system/manager < $HOME/LABS/shuta.sql
