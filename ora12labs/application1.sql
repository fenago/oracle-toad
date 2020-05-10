/* 
Copyright (c) 2004 Sideris Consulting Group, Inc. All Rights Reserved.
This file is licensed for use only by those instructors and students
who have received a valid license for the Sideris courseware title
associated with this file. All other use, duplication or distribution
is prohibited and illegal.
*/

set echo on;
connect student1/student1

drop table t_cars;
drop table t_client;
drop table t_amount;
drop table t_date;


create table t_cars
(id number,
model varchar2(100))
TABLESPACE SIDERISUSERS
PCTFREE 10 INITRANS 1 MAXTRANS 255 
STORAGE (INITIAL 64K BUFFER_POOL DEFAULT) LOGGING ;



create table t_client 
(id number,
first_name varchar2(100),
last_name varchar2(100))
TABLESPACE SIDERISUSERS
PCTFREE 10 INITRANS 1 
MAXTRANS 255 STORAGE 
(INITIAL 64K BUFFER_POOL DEFAULT) LOGGING;

create table t_date
(id number,
t_day char(10),
t_month char(10),
t_year char(10))
TABLESPACE SIDERISUSERS 
PCTFREE 10 INITRANS 1 
MAXTRANS 255 STORAGE 
(INITIAL 64K BUFFER_POOL DEFAULT) LOGGING; 

 


create table t_amount
(id number,
t_cars_id number,
t_client_id number,
t_date_id number,
amount number)
TABLESPACE SIDERISUSERS PCTFREE 5 
INITRANS 1 MAXTRANS 255 STORAGE 
(INITIAL 64K BUFFER_POOL DEFAULT) 
NOLOGGING NOCOMPRESS;



begin 
for i in 1..1900 loop
insert into t_date
values(i, to_char(sysdate,'dd'), to_char(sysdate, 'mm'), 
to_char(2004));
end loop; 
end;
/

begin 
for i in 1..10000 loop
insert into t_client
values (i,'Mary','Stewart');
end loop;
end;
/

begin 
for i in 1..10000 loop
insert into t_client
values (i,'John','Jones');
end loop;
end;
/
begin 
for i in 1..10000 loop
insert into t_client
values (i,'Jane','Petro');
end loop;
end;
/
begin 
for i in 1..10000 loop
insert into t_client
values (i,'Tanya','Antonio');
end loop;
end;
/
begin 
for i in 1..10000 loop
insert into t_client
values (i,'Howard','Myers');
end loop;
end;
/
begin 
for i in 1..10000 loop
insert into t_client
values (i, i, i );
end loop;
end;
/

begin 
for i in 1..10000 loop
insert into t_cars
values (i,'Toyota');
end loop;
end;
/

begin 
for i in 1..10000 loop
insert into t_cars
values (i,'Honda');
end loop;
end;
/
begin 
for i in 1..10000 loop
insert into t_cars
values (i,'BWM');
end loop;
end;
/


begin 
for i in 1..100000 loop
insert into t_amount
values (i,i,i,i,100);
end loop;
end;
/

begin 
for i in 10000..20000 loop
insert into t_amount
values (i,i,i,i,200);
end loop;
end;
/
begin 
for i in 30000..50000 loop
insert into t_amount
values (i,i,i,i,200);
end loop;
end;
/
begin 
for i in 50000..80000 loop
insert into t_amount
values (i,i,i,i,300);
end loop;
end;
/
begin 
for i in 80000..90000 loop
insert into t_amount
values (i,i,i,i,500);
end loop;
end;
/

set echo off;