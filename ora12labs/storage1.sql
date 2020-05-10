/* 
Copyright (c) 2004 Sideris Consulting Group, Inc. All Rights Reserved.
This file is licensed for use only by those instructors and students
who have received a valid license for the Sideris courseware title
associated with this file. All other use, duplication or distribution
is prohibited and illegal.
*/

connect student1/student1 as sysdba

set echo on;
execute DBMS_WORKLOAD_REPOSITORY.MODIFY_SNAPSHOT_SETTINGS(10080,0);

drop table student1.t1 purge;

create table student1.t1
(c1 number, c2 char(1), c3 char(1), c4 char(1), c5 char(20))
tablespace siderisusers
pctfree 0 storage (initial 4M next 2M pctincrease 0);

begin
 for i in 1 .. 10000 loop
  insert into student1.t1 values (i, 'x', 'y', 'z','aaaaaaaaaaaaaaaaaaaa');
 end loop;
 commit;
end;
/

set echo off