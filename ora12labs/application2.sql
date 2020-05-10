/* 
Copyright (c) 2004 Sideris Consulting Group, Inc. All Rights Reserved.
This file is licensed for use only by those instructors and students
who have received a valid license for the Sideris courseware title
associated with this file. All other use, duplication or distribution
is prohibited and illegal.
*/

connect student1/student1 as sysdba;
alter system flush shared_pool;
connect student1/student1;


SELECT /* Q1 */ 
a.t_client_id, sum (a.amount) sum, avg (a.amount) avg, max(a.amount) max
FROM t_amount a, t_date t
where a.t_date_id between 1 and 5000
group by t_client_id;

SELECT /* Q2 */
cl.first_name, c.model, d.t_day,
SUM(a.amount) amount, avg(a.amount) avg
FROM t_cars c, t_client cl, t_date d, t_amount a
WHERE a.t_cars_id = c.id
     AND   a.t_client_id=cl.id
     AND   a.t_date_id=d.id
     AND   c.model = 'Toyota'
     AND d.t_year = 2004
     GROUP BY cl.first_name, c.model, d.t_day;

SELECT /* Q3 */ 
a.t_client_id, sum (a.amount) sum, avg (a.amount) avg, max(a.amount) max
FROM t_amount a, t_date t
where a.t_date_id = t.id
and a.t_date_id between 1 and 7000
group by t_client_id;

SELECT /* Q4 */ 
a.t_client_id, sum (a.amount) sum, avg (a.amount) avg, max(a.amount) max
FROM t_amount a, t_date t
where a.t_date_id = t.id
and a.t_date_id between 1 and 90000
group by t_client_id
having sum (a.amount) > 10;

SELECT /* Q5 */ 
a.t_client_id, sum (a.amount) sum, avg (a.amount) avg, max(a.amount) max
FROM t_amount a, t_date t
where a.t_date_id between 1 and 6000
group by t_client_id
having sum (a.amount) > 1000;

SELECT /* Q6 */
cl.first_name, c.model, d.t_day,
SUM(a.amount) amount, avg(a.amount) avg
FROM t_cars c, t_client cl, t_date d, t_amount a
WHERE a.t_cars_id = c.id
     AND   a.t_client_id=cl.id
     AND   a.t_date_id=d.id
     AND   c.model = 'Honda'
     AND d.t_year = 2004
     GROUP BY cl.first_name, c.model, d.t_day;

SELECT /* Q7 */
cl.first_name, c.model, d.t_day,
SUM(a.amount) amount, avg(a.amount) avg
FROM t_cars c, t_client cl, t_date d, t_amount a
WHERE a.t_cars_id = c.id
     AND   a.t_client_id=cl.id
     AND   a.t_date_id=d.id
     AND   c.model = 'BWM'
     AND d.t_year = 2004
     GROUP BY cl.first_name, c.model, d.t_day;