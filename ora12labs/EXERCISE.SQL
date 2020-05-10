/*  SIMPLE SQL STATEMENT WITH WHERE CLAUSE */

/* exercise 1.3  */
select  ID,NAME,SALARY from staff
WHERE JOB ^= 'CLERK';

/*  USE OF CALCULATED COLUMN VALUES AND COMPARISON OPERATORS */

/*  exercise 2.1 */
SELECT NAME,JOB,SALARY
FROM STAFF WHERE JOB ='MGR' AND SALARY < 20000;

/*  exercise 2.2  */
SELECT NAME,JOB,SALARY+COMM,DEPT
FROM STAFF
WHERE DEPT=66;

/*  exercise 2.3  */
SELECT DEPT,NAME
FROM STAFF
WHERE DEPT ^= 15;


/*  exercise 2.4  */
SELECT * FROM STAFF
WHERE ID <101;

/*  MULTIPLE CRITERIA COLUMNS IN THE WHERE CLAUSE */

/*  exercise 3.1  */
SELECT NAME,JOB,YEARS
FROM STAFF
WHERE JOB = 'MGR' OR YEARS > 10;
/*  exercise 3.2  */

SELECT ID,NAME,SALARY+COMM,SALARY,COMM
FROM STAFF
WHERE SALARY BETWEEN 12000 AND 15000
AND COMM >=150 AND  JOB = 'CLERK';

/*  exercise 3.3  */
SELECT DISTINCT DEPT,YEARS,SALARY
FROM STAFF
WHERE YEARS >5 AND SALARY < 15000;


/*  LIKE PREDICATE */

/*  exercise 4.1  */
SELECT DEPTNAME,MANAGER,LOCATION
FROM ORG
WHERE LOCATION LIKE '%TON';

/*  exercise  4.2  */
SELECT DEPTNAME FROM ORG
WHERE DEPTNAME LIKE '_%AIN%';

/*  exercise  4.3  */
SELECT NAME FROM STAFF
WHERE NAME LIKE 'S%D%';


/*  GROUP BY STATEMENTS  */

/*  exercise  5.1  */
SELECT COUNT(*) FROM ORG;

/*  exercise  5.2  */
SELECT COUNT(DISTINCT DIVISION) FROM ORG;

/*  exercise  5.3  */
SELECT AVG(SALARY) FROM STAFF WHERE JOB = 'MGR';

/*  exercise  5.4  */
SELECT MAX(SALARY) FROM STAFF WHERE YEARS < 5;

/*  exercise  5.5  */
SELECT SUM(YEARS) FROM STAFF WHERE DEPT IN(15,20,42);


/*  GROUP BY WITH HAVING STATMENT  */

/*  exercise  6.1  */
select dept,avg(salary),avg(years)
from staff
group by dept
having avg(salary) > 18000;

/*  exercise  6.2  */
select dept,min(years)
from staff
group by dept
having min(years) >=5;

/*  exercise  6.3  */
select dept, sum(comm)
from staff
group by dept
having sum(comm) > 1200;


/*  JOINS  */

/*  exercise  7.1  */
select deptnumb,deptname,name,salary
from staff,org
where manager=id;

/*  exercise  7.2  */
select s.name,s.salary,'emp salary >',m.salary,m.name,m.dept
from staff s,staff m
where m.dept=s.dept and m.job='MGR' and s.salary>m.salary;

/*  exercise  7.3  */
select a.name,s.name
from staff s,applicant a
where a.name=s.name;


/*   SUBQUERIES   */

/*  exercise  8.1  */
select name,job,dept
from staff
where job='MGR' and dept in
(select deptnumb from org
where division = 'MIDWEST');

/*  exercise  8.3  */
SELECT NAME,JOB,DEPT FROM STAFF
WHERE JOB='MGR' AND DEPT IN
(SELECT DEPT FROM STAFF
GROUP BY DEPT
HAVING AVG(SALARY) >
(SELECT AVG(SALARY) FROM STAFF));

/*  exercise  8.4  */
SELECT ID,NAME,SALARY,COMM FROM STAFF
WHERE SALARY > 20000 AND EXISTS
(SELECT * FROM STAFF
WHERE COMM < 350);

/*   UNIONS  */

/*  exercise  9.1  */
select id,name,'STAFF' "MEMBER"
FROM STAFF
UNION
SELECT TEMPID,NAME,'APPLICANT'
FROM APPLICANT
ORDER BY ID;

/*  exercise  9.2  */
SELECT NAME,DEPT,SALARY,'LESS THAN AVG' "STATUS"
FROM STAFF
WHERE SALARY <
(SELECT AVG(SALARY) FROM STAFF)
UNION
SELECT NAME,DEPT,SALARY,'>= THE AVERAGE'
FROM STAFF
WHERE SALARY >=
(SELECT AVG(SALARY) FROM STAFF);