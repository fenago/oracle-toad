create table test_month (
  val       number,
  dt        date
);

alter session set nls_date_format = 'DD.MM.YYYY';

insert into test_month (val,dt) values (18,'28.08.2000');
insert into test_month (val,dt) values (19,'02.08.2000');
insert into test_month (val,dt) values (22,'27.09.2000');
insert into test_month (val,dt) values (23,'04.09.2000');
insert into test_month (val,dt) values (20,'12.08.2000');
insert into test_month (val,dt) values (24,'15.09.2000');
insert into test_month (val,dt) values (19,'27.07.2000');
insert into test_month (val,dt) values (18,'01.07.2000');
insert into test_month (val,dt) values (21,'26.07.2000');
insert into test_month (val,dt) values (24,'03.06.2000');
insert into test_month (val,dt) values (22,'11.07.2000');
insert into test_month (val,dt) values (21,'14.06.2000');
select val,dt from (select
   val,dt,rank() over(partition by to_char(dt,'YYYY.MM') order by dt desc) rn 
from test_month
 )
where rn = 1;
