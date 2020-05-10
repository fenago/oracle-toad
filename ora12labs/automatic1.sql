/* 
Copyright (c) 2004 Sideris Consulting Group, Inc. All Rights Reserved.
This file is licensed for use only by those instructors and students
who have received a valid license for the Sideris courseware title
associated with this file. All other use, duplication or distribution
is prohibited and illegal.
*/

set echo on;
connect student1/student1 as sysdba

execute dbms_workload_repository.modify_snapshot_settings(interval => 60,-
retention => 20160);

drop table student1.my_teams purge;
create table student1.my_teams
as select *
from student1.teams;

execute DBMS_STATS.GATHER_TABLE_STATS(-
ownname=>'student1', tabname=>'my_teams',-
estimate_percent=>DBMS_STATS.AUTO_SAMPLE_SIZE);

execute DBMS_WORKLOAD_REPOSITORY.CREATE_SNAPSHOT;

set echo off;