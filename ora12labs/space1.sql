/* 
Copyright (c) 2004 Sideris Consulting Group, Inc. All Rights Reserved.
This file is licensed for use only by those instructors and students
who have received a valid license for the Sideris courseware title
associated with this file. All other use, duplication or distribution
is prohibited and illegal.
*/
connect student1/student1
set echo on;
create table members2
tablespace sideris
as select * from members;

alter table members2 enable row movement;


begin
for i in 1..11 loop
insert into members2
select * from members2;
end loop;
end;
/
commit;
set echo off;

