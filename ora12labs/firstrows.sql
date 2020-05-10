create table items (
  id     number  primary key,
  name   varchar2(20),
  price  number(7,2)
);

insert into items values ( 1, 'cup',        1.20);
insert into items values ( 2, 'book',      49.99);
insert into items values ( 3, 'mobile',    89.99);
insert into items values ( 4, 'coke',       0.78);
insert into items values ( 5, 'pencil',     1.35);
insert into items values ( 6, 'dollar',     1.00);
insert into items values ( 7, 'door',     150.00);
insert into items values ( 8, 'oracle', 19999.00);
insert into items values ( 9, 'carpet',   122.40);
insert into items values (10, 'apple',      1.05);
/*(20 rows are inserted – not all inserts are shown here. See firstrow.sql 
Usually, this can be solved with rownum. 
The following example retrieves the first 5 rows: 
*/
select name, price 
  from items
where rownum < 6;

/
