set feedback off;
set pagesize 0;
create table test_analytic (
  a varchar2(5),
  b varchar2(5),
  c int
);

insert into test_analytic values ('one','xxx',1);
insert into test_analytic values ('one','yyy',2);
insert into test_analytic values ('one','zzz',3);
insert into test_analytic values ('one','qqq',4);

insert into test_analytic values ('two','xxx',5);
insert into test_analytic values ('two','yyy',8);
insert into test_analytic values ('two','zzz',7);
insert into test_analytic values ('two','qqq',6);

select first_value (c) over (partition by a order by b) from (select * from test_analytic);
prompt ---------------

select first_value (c) over (partition by a order by b rows 2 preceding) from (select * from test_analytic);

