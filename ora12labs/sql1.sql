/* 
Copyright (c) 2004 Sideris Consulting Group, Inc. All Rights Reserved.
This file is licensed for use only by those instructors and students
who have received a valid license for the Sideris courseware title
associated with this file. All other use, duplication or distribution
is prohibited and illegal.
*/


set echo on;
connect student1/student1


drop table my_sales;
create table my_sales
(product_name varchar2(25),
year number,
week_no number,
total_sales number,
m_time date);

insert into my_sales
 values ('DVD Player',2002,5,2521,'01-SEP-2004');
insert into my_sales
 values ('DVD Player',2002,10,21,'02-SEP-2004');
insert into my_sales
 values ('DVD Player',2002,11,254,'03-SEP-2004');
insert into my_sales
 values ('DVD Player',2002,15,2544,'04-SEP-2004');
insert into my_sales
 values ('DVD Player',2002,12,25455,'05-SEP-2004');
insert into my_sales
 values ('DVD Player',2002,20,854,'06-SEP-2004');
insert into my_sales
 values ('DVD Player',2002,30,8577,'07-SEP-2004');
insert into my_sales
 values ('DVD Player',2002,40,8548,'08-SEP-2004');
insert into my_sales
 values ('DVD Player',2002,45,5884,'09-SEP-2004');
insert into my_sales
 values ('DVD Player',2002,38,4754,'11-SEP-2004');
insert into my_sales
 values ('DVD Player',2002,23,548,'12-SEP-2004');
insert into my_sales
 values ('DVD Player',2003,5,5458,'13-SEP-2004');
insert into my_sales
 values ('DVD Player',2003,10,6554,'14-SEP-2004');
insert into my_sales
 values ('DVD Player',2003,12,54555,'15-SEP-2004');
insert into my_sales
 values ('DVD Player',2003,20,5878,'16-SEP-2004');
insert into my_sales
 values ('DVD Player',2003,22,2548,'17-SEP-2004');
insert into my_sales
 values ('DVD Player',2003,23,4521,'18-SEP-2004');
insert into my_sales
 values ('DVD Player',2003,35,985,'19-SEP-2004');
insert into my_sales
 values ('DVD Player',2003,40,587,'20-SEP-2004');

drop table my_year;
create table my_year
(week_no number,
year number);


insert into my_year
values (5,2002);
insert into my_year
values (10,2002);
insert into my_year
values (12,2003);
insert into my_year
values (10,2002);
insert into my_year
values (11,2002);
insert into my_year
values (20,2002);
insert into my_year
values (23,2002);
insert into my_year
values (38,2002);
insert into my_year
values (20,2003);
insert into my_year
values (22,2003);
insert into my_year
values (22,2003);

drop table sales2;
create table sales2
(country varchar2(30),
pname varchar2(30),
year number,
sales number);

insert into sales2
values ('portugal','mp3 player',2003,25555);
insert into sales2
values ('portugal','mp3 player',2002,5544);
insert into sales2
values ('portugal','Sony Xbox',2003,2255);
insert into sales2
values ('portugal','Sony Xbox',2002,2554);
insert into sales2
values ('greece','Mp3 player',2003,2555);
insert into sales2
values ('greece','Mp3 player',2002,254);
insert into sales2
values ('greece','Sony Xbox',2003,25455);
insert into sales2
values ('greece','Sony Xbox',2002,5554);


set echo off;