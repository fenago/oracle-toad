

*/
In oracle's analytic functions, you can use the Partition By clause to group 
an sql select statement's result set. It is then this group over which the
 analytic function will be applied. I have set up a test table to demonstrate this:
*/
create table test_month (
  val       number,
  dt        date
)

*/ Now, this table is filled with some numbers and some dates:
*/
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

/* What I now would like to to is create a view that has a flag which indicates if the date is 
the last date in the month. By last date, I don't mean 30.06.2000 for example, 
but 14.06.2000 because 14.06.2000 is the last date of June stored in the table. 
To achieve this goal, I use the analytic function max together with the partition clause. 
The partition clause groups the result set in different months, and max is used to find 
the last date in each group:
*/

create view test_last_of_month as
  select val, dt, 
    case when dt=max_dt then 'Y' else 'N' end last_dt
  from (select val, dt, max(dt) over (partition by to_char(dt,'YYYY.MM')) 
max_dt from test_month);

select * from test_last_of_month;




