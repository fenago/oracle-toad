set echo on;

connect student1/student1 as sysdba

EXECUTE DBMS_STATS.GATHER_TABLE_STATS- 
(ownname=>'student1',-
tabname=>'my_teams',-
estimate_percent=>DBMS_STATS.AUTO_SAMPLE_SIZE);

EXECUTE DBMS_WORKLOAD_REPOSITORY.CREATE_SNAPSHOT();

set echo off;