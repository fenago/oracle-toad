/* 
Copyright (c) 2004 Sideris Consulting Group, Inc. All Rights Reserved.
This file is licensed for use only by those instructors and students
who have received a valid license for the Sideris courseware title
associated with this file. All other use, duplication or distribution
is prohibited and illegal.
*/
set echo on;
connect student1/student1 as sysdba
alter session set nls_date_format='DD-MON-YYYY';
connect student1/student1

set echo on;
Drop table my_time;
create table my_time
(m_time date);


begin
for i in 0..11 loop
insert into my_time
values (to_date('01-SEP-2004','dd-mon-yyyy') +i);
end loop;
end;
/


begin
for i in 0..10 loop
insert into my_sales
values ('X Box',2004,i,i+100,(to_date('01-SEP-2004','dd-mon-yyyy') +i));
end loop;
end;
/

insert into my_sales
values ('X Box',2004, 40, null,'12-SEP-2004');
commit;
set echo off;