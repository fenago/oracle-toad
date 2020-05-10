/* 
Copyright (c) 2004 Sideris Consulting Group, Inc. All Rights Reserved.
This file is licensed for use only by those instructors and students
who have received a valid license for the Sideris courseware title
associated with this file. All other use, duplication or distribution
is prohibited and illegal.
*/

connect student1/student1
set echo on;

begin 
for i in 600..100000 loop
insert into teams
values(i,'Accounting','01-DEC-04',i);
end loop;
end;
/

set echo off;