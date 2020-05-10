create table top_n_test (
   a number,
   b varchar2(10) );

insert into top_n_test values (1,   'one');
insert into top_n_test values (2,   'two');
insert into top_n_test values (3, 'three');
insert into top_n_test values (4,  'four');

commit;

select a, b from (
  select
    a,b,
    rank() over (order by b) r
  from
    top_n_test
  )
where
  r<4;

/
