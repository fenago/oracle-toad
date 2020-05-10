-- set autotrace on --
set echo on
SET AUTOTRACE TRACEONLY
select time_id, QUANTITY_SOLD, AMOUNT_SOLD
from sales s, ctest c
where c.cust_id = s.cust_id and CUST_FIRST_NAME='Dina'
order by time_id;
set autotrace off
