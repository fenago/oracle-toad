create table test_analytic (
  a varchar(5),
  b number
);

insert into test_analytic values ('one',   1);
insert into test_analytic values ('two',   2);
insert into test_analytic values ('three', 3);
insert into test_analytic values ('four',  4);
insert into test_analytic values ('five',  5);
insert into test_analytic values ('six',   6);
insert into test_analytic values ('seven', 7);
insert into test_analytic values ('eight', 8);
insert into test_analytic values ('nine',  9);
insert into test_analytic values ('ten',  10);

select a, sum(b) over (order by a rows between 1 preceding and 1 following) as sb 
from test_analytic order by a;
prompt **************************
select a, sum(b) over (order by a rows between 1 preceding and 1 following) as sb 
from test_analytic order by b;
prompt **************************
select a, sum(b) over (order by b rows between 1 preceding and 1 following) as sb 
from test_analytic order by a;
prompt **************************
select a, sum(b) over (order by b rows between 1 preceding and 1 following) as sb 
from test_analytic order by b;

drop table test_analytic;

