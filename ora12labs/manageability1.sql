/* 
Copyright (c) 2004 Sideris Consulting Group, Inc. All Rights Reserved.
This file is licensed for use only by those instructors and students
who have received a valid license for the Sideris courseware title
associated with this file. All other use, duplication or distribution
is prohibited and illegal.
*/

set echo on;

connect student1/student1

begin
for c in 1..32 loop
for b in 1..8 loop
update teams set leaderid=700;
commit;
end loop;
dbms_lock.sleep(1);
end loop;
end;
/

set echo off;