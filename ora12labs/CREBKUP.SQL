set head off
set feedback off;
spool $HOME/sysbkup.sh
select 'cp ' || name || ' $HOME/BACKUP/INC0/system01.cpy' from v$datafile
where ts#=0;
spool off
ALTER TABLESPACE SYSTEM BEGIN BACKUP;
!chmod 775 $HOME/sysbkup.sh
!$HOME/sysbkup.sh
ALTER TABLESPACE SYSTEM END BACKUP;
set head on
set feedback on;
