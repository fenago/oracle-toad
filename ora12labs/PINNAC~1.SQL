
CONNECT system/manager;
REM***YOU WILL RECEIVE AN ERROR IF THE USER, STUDENT DOES NOT CURRENTLY EXIST

DROP USER student CASCADE;

CREATE USER student IDENTIFIED BY pwd;

GRANT connect, resource 
TO student IDENTIFIED BY pwd;

CONNECT student/pwd;



rem ********** begin create small scale business tables

create table customer (
customer_id 	number(5),
company_name    varchar2(32) not null,
contact_name	varchar2(34) not null,
address		varchar2(100),
city		varchar2(32),
state		varchar2(2),
zip		number(5),
phone		varchar2(15),
constraint pk_customer_id primary key (customer_id));


create table sales_person (
sales_person_id	number(5),
last_name	varchar2(32) not null,
first_name	varchar2(32),
address		varchar2(100),
city		varchar2(32),
state		varchar2(2),
zip		number(5),
phone		varchar2(15),
manager_id      number(5),
salary		number(7,2) not null,
commission	number(5),
hire_date	date,
gender		char(1),
constraint pk_sales_person_id primary key (sales_person_id));


create table product (
product_id	number(5),
product_name	varchar2(32) not null,
supplier_name	varchar2(32) not null,
unit_price	number(7,2) not null,
constraint pk_product_id primary key (product_id));


create table orders (
order_id  	number(5),
customer_id	number(5),
sales_person_id	number(5),
order_date 	date not null,
shipment_date 	date,
shipping_type 	varchar2(10) constraint chk_ship_type
check (shipping_type in ('UPS', 'USPS', 'FEDEX', 'AIRBORNE')),
constraint pk_order_id primary key (order_id),
constraint fk_customer_id foreign key (customer_id)
references customer(customer_id),
constraint fk_sales_person_id foreign key (sales_person_id)
references sales_person(sales_person_id));



create table order_items (
order_id	number(5),
product_id 	number(5),
number_of_units	number(3),
constraint pk_order_id_itm primary key (order_id,product_id),
constraint fk_ord_id_itm foreign key (order_id)
references orders(order_id),
constraint fk_prod_id_itm foreign key (product_id)
references product(product_id));


create table salary_grade (
losal number(6) not null,
hisal number(6) not null,
grade number(1) not null);




rem ********* end create small scale business tables


rem ******** begin insert data into tables

insert into customer values
(300, 'Acme Inc', 'John', '25 Maple Avenue', 'Vienna',
'VA', 22180, '703-111-2222');
insert into customer values
(301, 'JK Plumbing', 'Mary', '1625 Woodward Lane', 'Almond',
'IL', 60517, '630-666-7777');
insert into customer values
(302, 'ITT', 'Chang', '8B Wayne Dr.', 'Fairfax',
'VA', 22030, '703-999-9999');
insert into customer values
(303, 'AB Realtors', 'Lionel', '4 Chain Bridge Road', 'Mc Lean',
'VA', 22181, '703-000-0001');
insert into customer values
(304, 'SAMS', 'Yoko', '100 Lee Hwy', 'Richmond',
'VA', 44988, '703-777-7777');
insert into customer values
(305, 'Bell Electronics', 'Deepak', '21 Gallows Road', 'Vienna',
'VA', 22992, '703-555-1212');
insert into customer values
(306, 'JK Contractors', 'Kim', '1585 Pennslvania Ave', 'Washington',
'DC', 33221, '301-301-3013');
insert into customer values
(307, 'Zhou Couriers', 'Kang', '85 Washington St', 'Rockville',
'MD', 55332, '301-103-1031');
insert into customer values
(308, 'DBA Services', 'Peter', '75 Pimmit Ave', 'Falls Church',
'MD', 88219, '908-908-9089');



insert into sales_person values
(800, 'Kang', 'Cheng','22848 Mark Ave', 'Denver',
	'CO', '29292', '215-215-2152', 806, 28000, 500,'04-JAN-1997','M');
insert into sales_person values
(801, 'Smith', 'John', '33432 Park Ave', 'McLean',
	'VA', '22342','703-703-7037', 806, 35000, NULL,'21-MAY-1995','M');
insert into sales_person values
(802, 'Jones', 'Mary', '93944 Winding Hollow Way', 'Springfield',
	'VA', 22042,'301-301-3013', 805, 40000, 400,'07-JUL-1996','F');
insert into sales_person values
(803, 'Simpson', 'Mathew', '125 Chain Bridge Road', 'Vienna',
	'VA', 22180,  '919-919-9191', 802, 28000, 10000,'25-NOV-1997','M');
insert into sales_person values
(804, 'Aguirre', 'Ernest', '9393 Golf Club Dr', 'Bethesda',
	'MD', 21939,'777-777-7777', 805, 35000, NULL,'15-AUG-1997','M');
insert into sales_person values
(805, 'Mitterand', 'Jean',  '3034 Hunters Run Dr', 'Bowie',
	'MD', 21193,'333-333-3333', null, 55000, NULL,'16-MAR-1997','F');
insert into sales_person values
(806, 'London', 'Elizabeth',  '93934 Lee Stone St', 'Herndon',
	'VA', 22039,'666-666-6666', 805, 42000, 650,'01-APR-1996','F');
insert into sales_person values
(807, 'Patel', 'Raj','9394 Flowrence Dr', 'Georgetown',
	'WI', 67554, '888-888-8888', 804, 30000, 750,'10-FEB-1996','M');
insert into sales_person values
(808, 'Smith', 'Paula', '9039 Cellar Creek Way', 'Olympia',
	'MO', 77433, '999-999-9999', 802, 29000, 950,'12-JUN-1997','F');




insert into product values
(50, 'Chairs', 'Household Furnishings Inc', 20.00);
insert into product values
(51, 'Paints', 'McCarthy  Paints', 55.20);
insert into product values
(52, 'Deli Meat', 'Vienna Butchery Inc',0.55);
insert into product values
(53, 'White Bread', 'Super Fine Bakery' ,0.85);
insert into product values
(54, 'Envelopes', 'Acme Stationery',2.25);
insert into product values
(55, 'Cordless Telephones', 'Phone Guys Inc', 96.75);
insert into product values
(56, 'Speakers', 'Alteck Lancy', 40.00);
insert into product values
(57, 'Televisions', 'Sony', 429.99);
insert into product values
(58, 'Pedestal Lamp', 'Jason Hardware', 39.99);




insert into orders values
(2300, 302, 803, '30-JAN-1998', '03-FEB-1998', 'UPS');
insert into orders values
(2301, 305, 808, '02-MAR-1998', '03-MAR-1998', 'FEDEX');
insert into orders values
(2302, 303, 803, '08-FEB-1998', '08-FEB-1998', 'USPS');
insert into orders values
(2303, 302, 801, '12-APR-1998', '13-APR-1998', 'AIRBORNE');
insert into orders values
(2304, 308, 805, '12-APR-1998', '13-APR-1998', 'UPS');
insert into orders values
(2305, 302, 803, '25-MAY-1998', '01-JUN-1998', 'UPS');
insert into orders values
(2306, 301, 803, '28-JUN-1998', '28-JUN-1998', 'FEDEX');
insert into orders values
(2307, 307, 807, '29-JUN-1998', '30-JUN-1998', 'FEDEX');
insert into orders values
(2308, 306, 804, '08-JUL-1998', '10-JUL-1998', 'FEDEX');


insert into order_items values(2300, 57, 20);
insert into order_items values(2301, 52, 200);
insert into order_items values(2302, 58, 25);
insert into order_items values(2303, 53, 5);
insert into order_items values(2304, 56, 90);
insert into order_items values(2305, 51, 45);
insert into order_items values(2306, 54, 30);
insert into order_items values(2307, 57, 80);
insert into order_items values(2308, 57, 25);
insert into order_items values(2301, 55, 45);
insert into order_items values(2301, 51, 70);
insert into order_items values(2301, 58, 8);
insert into order_items values(2305, 57, 300);
insert into order_items values(2305, 56, 20);
insert into order_items values(2303, 54, 20);
insert into order_items values(2303, 58, 10);


INSERT into salary_grade values (10000, 20000, 1)
/
INSERT into salary_grade values (20001, 30000, 2)
/
INSERT into salary_grade values (30001, 40000, 3)
/
INSERT into salary_grade values (40001, 50000, 4)
/
INSERT into salary_grade values (50001, 60000, 5)
/
INSERT into salary_grade values (60001, 70000, 6)
/
INSERT into salary_grade values (70001, 80000, 7)
/
INSERT into salary_grade values (80001, 90000, 8)
/
INSERT into salary_grade values (90001, 100000, 9)
/

commit;





select * from tab;





select count(*) from customer;
select count(*) from orders;
select count(*) from order_items;
select count(*) from product;
select count(*) from sales_person;
select count(*) from salary_grade;


select * from customer;
select * from orders;
select * from order_items;
select * from product;
select * from sales_person;
select * from salary_grade;


