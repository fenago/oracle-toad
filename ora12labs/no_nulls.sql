/* Using SQL to select the value for the last row that was not null

I find it a common problem with SQL if I deal with tables that contain NULL values and if I do a select on that table, I don't want to have NULLs returned but rather the value of the last row that was not NULL.
For example, if I maintain a table that keeps track of how much certain items cost, I'd have something like:
*/
create table item_price (dt date,
item varchar2(30),
price number(6,2));

/* Now, whenever the price for an item changes, a record is inserted that contains the date
 (##Bdt##b) when ##Bitem##b changed the ##Bprice##b.
*/
alter session set nls_date_format='dd.mm.yyyy';
insert into item_price values('14.05.2001','beans',15.4);
insert into item_price values('17.05.2001','pears', 2.8);
insert into item_price values('28.05.2001','beans',16.2);
insert into item_price values('26.05.2001','pears', 3.1);
insert into item_price values('03.06.2001','beans',14.9);
insert into item_price values('01.06.2001','pears', 2.9);

/* Now, I am interested in the price of beans between 14.05 and 03.06.
 First, I create a table that contains a record for each date in this range:
*/ 
create table date_range as select to_date(rownum -1 + to_number(to_char(to_date('14.05.2001'),'j')),'j') dt from 
  (select 1 from all_objects where rownum-1 <= to_date('03.06.2001') - to_date('14.05.2001'));

/* The desired result can now be obtained with the following sql statement:
*/
select dr_dt, sum(ip_price) over (partition by new_price) price   
from (
  select dr.dt dr_dt, ip.price ip_price, sum(ip.price) over (order by dr.dt) new_price
  from  (select price, dt from item_price where item='beans') ip, date_range dr
  where ip.dt(+) = dr.dt 
)
order by dr_dt;

