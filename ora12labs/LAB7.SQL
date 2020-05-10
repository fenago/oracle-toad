LAB7 PL/SQL ANSWERS

PL1.  DECLARE
bonus number(7,2) := 0;
sal number(7,2);
BEGIN
select comm,salary  into bonus,sal from staff
where  id = 50;
IF sal > 20000.00 then
UPDATE staff 
set comm = (sal + bonus * .05)
where  id = 50;
ELSE
INSERT INTO STAFF VALUES(600,'RICHARD,10,'MGR',11,30000,0);
END IF;
COMMIT;
END;
/


PL2.  <<global_block>>
declare
emp_id    number(3);
begin
emp_id := 20;
<<jerry>>
declare
emp_dept       number(4) := 20;
emp_id         CHAR(5) := '0.1';
emp_name       varchar2(9) := 'John Duda';
emp_job        char(5) := 'SALES';
emp_years      number(4) :=10;
begin
insert into staff(id,name,job,years,dept)
values(global_block.emp_id,emp_name,emp_job,emp_years,emp_dept);
commit;
end jerry;
end global_block;
/


PL3.  declare
   TYPE employee_record_type is record
  ( first_name varchar2(10) not null := ' ',
   last_name   varchar2(15) not null := ' ',
   dept        number(4),
   age  number(3),
   salary  number(7,2),
   years_emp  number(2) := 0,
   comm    staff.comm%TYPE);
staff_record employee_record_type;
BEGIN
 select name, dept,name,years,salary,years,comm
 into staff_record.first_name,staff_record.dept,staff_record.last_name,
 staff_record.age,staff_record.salary,staff_record.years_emp,
 staff_record.comm from staff where id = 20;
END;
/

PL5.  declare
  max_salary        number(11,2) := 0.0;
  new_company_name  varchar(25) := 'TEXAS INSTRUMENTS';
  staff_record      staff%ROWTYPE;
BEGIN
  staff_record.id     := 1090;
  staff_record.name   := 'Stallman';
  staff_record.dept   := 10;
  staff_record.job    := 'MGR';
  staff_record.years  := 15;
  staff_record.salary := 45000.00;
  staff_record.comm   := 4000.00;
  insert into staff(id,name,dept,job,years,salary,comm)
    values(staff_record.id,staff_record.name,staff_record.dept,
           staff_record.job,staff_record.years,staff_record.salary,
           staff_record.comm);
  END;
/


PL19. DECLARE
emp_id      staff.id%TYPE := &p_emp_id;
emp_name    staff.name%TYPE;
emp_dept    staff.dept%TYPE;
emp_salary  staff.salary%TYPE;
BEGIN
select dept,id,name,salary into emp_dept,emp_id,emp_name,emp_salary
from staff where  id = 50;
END;
/


PL20. DECLARE
dept_no    staff.dept%TYPE := &p_dept_no;
sum_salary   staff.salary%TYPE;
BEGIN
select sum(salary) into sum_salary from staff
where  dept=dept_no;
IF sum_salary > 200000.00 then
UPDATE staff 
set comm = (sum_salary * .005)
where  id = 50;
ELSE
INSERT INTO STAFF VALUES(600,'J. RICH',10,'MGR',11,30000,0);
END IF;
COMMIT;
END;
/


PL21. DECLARE
emp_id    staff.id%TYPE;
emp_name   staff.name%TYPE :='J Sulivan';
emp_dept   staff.dept%TYPE := &p_dept_no;
emp_job    staff.job%TYPE := 'PROG';
emp_years  staff.years%TYPE := 0;
emp_salary  staff.salary%TYPE;
emp_comm    staff.comm%TYPE;
BEGIN
select max(id) into emp_id from staff;
emp_id := emp_id + 1;
insert into staff (id,name,dept,job,years,salary,comm)
values(emp_id,emp_name,emp_dept,emp_job,emp_years,emp_salary,emp_comm);
commit work;
END;
/


PL22. DECLARE
emp_id     staff.id%TYPE := &p_emp_id;
emp_salary   staff.salary%TYPE :=&p_salary;
emp_comm     staff.comm%TYPE;
BEGIN
UPDATE staff 
set salary = emp_salary, comm = (salary *.05)
where  id = emp_id;
COMMIT;
END;
/


PL23. accept p_emp_id prompt 'Enter elmplyee ID'
declare
emp_id  staff.id%TYPE := &p_emp_id;
BEGIN
DELETE FROM STAFF WHERE id = emp_id;
COMMIT WORK;
END;
/


PL24. DECLARE
bonus       staff.comm%TYPE;
commission  staff.comm%TYPE;
emp_id      staff.id%TYPE := &p_emp_id;
bonus_amt   staff.comm%TYPE;
BEGIN
select comm  into commission from staff
where  id = &emp_id;
IF (commission > 0 and commission < 100.01)
   then bonus_amt := 0;
elsif (commission >100.00 and commission < 200.01)
   then bonus_amt := .02 * commission;
elsif (commission >200.00 and commission <300.01)
then bonus_amt := .04 * commission;
elsif (commission >300.00 and commission < 400.01)
then bonus_amt := .06 * commission;
elsif (commission >400.00 and commission < 500.01)
then bonus_amt := .08 * commission;
else
   bonus_amt := .10 * commission;
end if;
UPDATE staff 
set comm = (comm + bonus_amt)
where  id = emp_id;
COMMIT;
END;
/


PL25. DECLARE
new_po    puorder.po%TYPE;
cur_date   puorder.po_date%TYPE;
countr     number(3) := 1;
BEGIN
 LOOP
         Select max(po) + 1 into new_po  from puorder;
         INSERT INTO puorder (PO,PO_DATE) VALUES(new_po,sysdate);
         countr := countr + 1;
         exit when countr = 10;
 END LOOP;
COMMIT;
END;
/


PL26. DECLARE
new_po    puorder.po%TYPE;
cur_date   puorder.po_date%TYPE;
countr     number(3) := 1;
BEGIN
 for i in 1..10 loop
         Select max(po) + 1 into new_po  from puorder;
         INSERT INTO puorder (PO,PO_DATE) VALUES(new_po,sysdate);
 END LOOP;
COMMIT;
END;
/


PL27. DECLARE
new_po    puorder.po%TYPE;
cur_date   puorder.po_date%TYPE;
countr     number(3) := 1;
BEGIN
 while countr <= 10 loop
         Select max(po) + 1 into new_po  from puorder;
         INSERT INTO puorder (PO,PO_DATE) VALUES(new_po,sysdate);
         countr := countr + 1;
 END LOOP;
COMMIT;
END;
/


PL28. declare
new_id     ord.custid%TYPE :=0;
min_ord    ord.ordid%TYPE :=0;
new_ordid  ord.ordid%TYPE :=0;
totcount   number(6) :=0;
countr     number(6) :=0;
min_id     ord.custid%TYPE :=0;
begin
select count(*) into totcount from ord;
loop
select min(custid) into min_id from ord where custid > min_id;
select min(ordid) into new_ordid from ord where ordid > new_ordid;
  update puorder
  set custid = min_id
  where po = new_ordid;
  countr := countr + 1;
  exit when countr = totcount;
  end loop;
end;
/


PL32. DECLARE
t_dept_no    STAFF.DEPT%type := &p_dept_no;
e_dept_error  EXCEPTION;
/*  -2292 is ORACLE error number for integrity constraint violated */
   PRAGMA EXCEPTION_INIT  (e_dept_error, -2292);
BEGIN
delete from staff
where  dept = t_dept_no;
commit work;
EXCEPTION
  WHEN e_dept_error then
    rollback work;
    insert into exception_table(message)
    values('Referential integrity constraint violated.');
  WHEN OTHERS THEN
    rollback work;
    insert into exception_table(message)
    values('Other error occurred.');
commit work;
END;
/


PL33. DECLARE
t_dept_no    STAFF.DEPT%type := &p_dept_no;
e_dept_error  EXCEPTION;
COUNTR        NUMBER(5) :=0;
BEGIN
SELECT COUNT(*) INTO COUNTR FROM STAFF
where  dept = t_dept_no;
IF COUNTR > 0 THEN
    raise e_dept_error;
END IF;
DELETE FROM ORG
WHERE DEPTNUMB = T_DEPT_NO;
EXCEPTION
  WHEN e_dept_error then
    rollback work;
    insert into exception_table(message)
    values('There are still employees with that department no in staff.');
  WHEN OTHERS THEN
    rollback work;
    insert into exception_table(message)
    values('Other error occurred.');
commit work;
END;
/


PL34. DECLARE
t_dept_no    STAFF.DEPT%type := &p_dept_no;
temp_dept    staff.dept%TYPE;
v_error_code    number;
v_error_message  varchar(255);
e_dept_error  EXCEPTION;
COUNTR        NUMBER(5) :=0;
BEGIN
SELECT COUNT(*) INTO COUNTR FROM STAFF
where  dept = t_dept_no;
IF COUNTR > 0 THEN
    raise e_dept_error;
END IF;
SELECT DEPT INTO TEMP_DEPT FROM STAFF WHERE DEPT = T_DEPT_NO;
DELETE FROM ORG
WHERE DEPTNUMB = T_DEPT_NO;
EXCEPTION
WHEN NO_DATA_FOUND THEN
    ROLLBACK WORK;
    INSERT INTO EXCEPTION_TABLE(MESSAGE)
    VALUES(TO_CHAR(T_DEPT_NO)||'INVALID DEPTARTMENT NO');
    COMMIT WORK;
  WHEN e_dept_error then
    rollback work;
    insert into exception_table(message)
    values('There are still employees with that department no in staff.');
  WHEN OTHERS THEN
    rollback work;
    v_error_code := SQLCODE;
    v_error_message := SQLERRM;
    insert into exception_table(message)
    values(to_char(v_error_code)||':'||v_error_message);
commit work;
END;
/


PL41. DECLARE
v_id    staff.id%TYPE;
v_dept  staff.dept%TYPE;
v_salary  staff.salary%TYPE;
v_comm    staff.comm%TYPE;
v_gross_pay  number(9,2) :=0;
v_total_pay  number(11,2) :=0;
cursor pay_cursor is
     select id,salary+comm
     from staff
     where dept = v_dept;
BEGIN
  v_dept := &p_dept;
   OPEN pay_cursor;
   LOOP
      FETCH pay_cursor into v_id,v_gross_pay;
      EXIT WHEN pay_cursor %NOTFOUND;
      v_total_pay := v_total_pay + v_gross_pay;
INSERT INTO TEMPPAY (dept,dept_pay)
             values(v_dept,v_total_pay);
END LOOP;
CLOSE pay_cursor;
COMMIT work;
END;
/


PL42. DECLARE
countr  number(3) := 0;
v_id    staff.id%TYPE;
v_dept  staff.dept%TYPE;
v_salary  staff.salary%TYPE;
v_comm    staff.comm%TYPE;
v_gross_pay  number(9,2) :=0;
v_total_pay  number(11,2) :=0;
cursor pay_cursor is
     select id,salary+comm
     from staff
     where dept = v_dept;
BEGIN
  v_dept := &p_dept;
   OPEN pay_cursor;
     fetch pay_cursor into v_id,v_gross_pay;
      while  pay_cursor %FOUND LOOP
     fetch pay_cursor into v_id,v_gross_pay;
      v_total_pay := v_total_pay + v_gross_pay;
INSERT INTO TEMPPAY (dept,dept_pay)
             values(v_dept,v_total_pay);
END LOOP;
CLOSE pay_cursor;
COMMIT work;
END;
/


PL43. DECLARE
countr  number(3) := 0;
v_id    staff.id%TYPE;
v_dept  staff.dept%TYPE;
v_salary  staff.salary%TYPE;
v_comm    staff.comm%TYPE;
v_gross_pay  number(9,2) :=0;
totcount    number(4) :=0;
v_total_pay  number(11,2) :=0;
cursor pay_cursor is
     select id,salary+comm
     from staff
     where dept = v_dept;
BEGIN
  v_dept := &p_dept;
  select count(*) into totcount from staff where dept = v_dept;
   OPEN pay_cursor;
   LOOP
     fetch pay_cursor into v_id,v_gross_pay;
      v_total_pay := v_total_pay + v_gross_pay;
             INSERT INTO TEMPPAY (dept,dept_pay)
             values(v_dept,v_total_pay);
             countr := countr +1;
             exit when countr > 25;
      exit when (pay_cursor%ROWCOUNT >= 15) or (pay_cursor%NOTFOUND);
END LOOP;
CLOSE pay_cursor;
COMMIT work;
END;
/


PL44. DECLARE
countr  number(3) := 0;
v_id    staff.id%TYPE;
v_dept  staff.dept%TYPE;
v_salary  staff.salary%TYPE;
v_comm    staff.comm%TYPE;
v_gross_pay  number(9,2) :=0;
totcount    number(4) :=0;
v_total_pay  number(11,2) :=0;
cursor pay_cursor is
     select id,salary+comm wages
     from staff
     where dept = v_dept;
BEGIN
  v_dept := &p_dept;
  select count(*) into totcount from staff where dept = v_dept;
     FOR pay_record IN pay_cursor LOOP
      v_total_pay := v_total_pay + pay_record.wages;
             INSERT INTO TEMPPAY (dept,dept_pay)
             values(v_dept,v_total_pay);
             countr := countr +1;
             exit when countr > 25;
      exit when (pay_cursor%ROWCOUNT >= 15) or (pay_cursor%NOTFOUND);
END LOOP;
COMMIT work;
END;
/


PL45. DECLARE
countr  number(3) := 0;
v_id    staff.id%TYPE;
v_dept  staff.dept%TYPE;
v_salary  staff.salary%TYPE;
v_comm    staff.comm%TYPE;
new_comm  staff.comm%TYPE;
v_gross_pay  number(9,2) :=0;
totcount    number(4) :=0;
v_total_pay  number(11,2) :=0;
cursor pay_cursor is
     select dept,id,name,salary,comm
     from staff
     where dept in(10,20,84) and salary > 10000
     for update of comm,salary,dept;
BEGIN
  select count(*) into totcount from staff where dept in(10,20,84);
     FOR pay_record IN pay_cursor LOOP
             new_comm := (pay_record.salary+pay_record.comm) * .10;
             if pay_record.comm > new_comm then
                delete from staff
                where current of pay_cursor;
             end if;
             countr := countr +1;
             exit when countr > 25;
      exit when (pay_cursor%ROWCOUNT >= 15) or (pay_cursor%NOTFOUND);
END LOOP;
COMMIT work;
END;
/


PL46. DECLARE
countr  number(3) := 0;
v_id    staff.id%TYPE;
v_dept  staff.dept%TYPE;
v_salary  staff.salary%TYPE;
v_comm    staff.comm%TYPE;
new_comm  staff.comm%TYPE;
v_gross_pay  number(9,2) :=0;
totcount    number(4) :=0;
v_total_pay  number(11,2) :=0;
cursor pay_cursor is
     select dept,id,name,salary,comm
     from staff
     where dept in(10,20,84) and salary > 10000
     for update of comm,salary,dept;
BEGIN
  select count(*) into totcount from staff where dept in(10,20,84);
     FOR pay_record IN pay_cursor LOOP
             new_comm := (pay_record.salary+pay_record.comm) * .10;
             if pay_record.comm > new_comm then
                delete from staff
                where current of pay_cursor;
             end if;
             countr := countr +1;
             exit when countr > 25;
      exit when (pay_cursor%ROWCOUNT >= 15) or (pay_cursor%NOTFOUND);
END LOOP;
COMMIT work;
END;
/


PL47. DECLARE
countr  number(3) := 0;
v_id    staff.id%TYPE;
v_name  staff.name%TYPE;
v_dept  staff.dept%TYPE :=&P_DEPT_NO;
v_salary  staff.salary%TYPE;
v_comm    staff.comm%TYPE;
new_comm  staff.comm%TYPE;
v_gross_pay  number(9,2) :=0;
totcount    number(4) :=0;
v_total_pay  number(11,2) :=0;
cursor pay_cursor(P_DEPT_NO number) is
     select id,name,salary,comm
     from staff
     where dept = P_DEPT_NO;
BEGIN
    select count(*) into totcount from staff where dept in(10,20,84);
    OPEN pay_cursor(&p_dept_no);
    LOOP
       FETCH pay_cursor into v_id,v_name,v_salary,v_comm;
             EXIT WHEN pay_cursor%NOTFOUND;
             v_total_pay := v_total_pay + (v_salary + v_comm);
             insert into temppay(dept,dept_pay)
                         values(v_dept,v_total_pay);
             countr := countr +1;
             exit when countr > 25;
END LOOP;
COMMIT work;
END;
/


PL48. DECLARE
countr  number(3) := 0;
v_id    staff.id%TYPE;
v_name  staff.name%TYPE;
v_dept  staff.dept%TYPE :=&P_DEPT_NO;
v_salary  staff.salary%TYPE;
v_comm    staff.comm%TYPE;
new_comm  staff.comm%TYPE;
v_gross_pay  number(9,2) :=0;
totcount    number(4) :=0;
v_total_pay  number(11,2) :=0;
cursor pay_cursor(P_DEPT_NO number) is
     select id,name,salary,comm
     from staff
     where dept = P_DEPT_NO;
BEGIN
    select count(*) into totcount from staff where dept in(10,20,84);
    OPEN pay_cursor(&p_dept_no);
    LOOP
       FETCH pay_cursor into v_id,v_name,v_salary,v_comm;
             EXIT WHEN pay_cursor%NOTFOUND;
             v_total_pay := v_total_pay + (v_salary + v_comm);
             insert into temppay(dept,dept_pay)
                         values(v_dept,v_total_pay);
             countr := countr +1;
             exit when countr > 25;
END LOOP;
COMMIT work;
END;
/


PL49. CREATE PROCEDURE incr_sal(emp_id integer,incr real)
is curr_sal real;
    sal_missing exception;
begin select salary into curr_sal
         from staff
         where  id = emp_id;
     IF curr_sal is null then
        raise sal_missing;
     else
        UPDATE staff
        set salary = salary + incr WHERE ID = EMP_ID;
     end if;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
      INSERT INTO exception_table(message)
                        values(to_char(emp_id)||'NONE');
  WHEN sal_missing THEN
       INSERT INTO exception_table(message)
                        values(to_char(emp_id)||'SALARY IS NULL');
end incr_sal;
/


PL50. create or replace procedure change_sal
(v_emp_id IN staff.id%TYPE,
v_new_salary IN staff.salary%TYPE)
is
BEGIN
   update staff
set salary = v_new_salary
    where id = v_emp_id;
commit work;
end change_sal;
/


PL51. CREATE OR REPLACE PROCEDURE GET_SALARY
(V_EMP_ID in STAFF.ID%TYPE,
V_SALARY out STAFF.SALARY%type)
IS BEGIN
SELECT SALARY
    INTO V_SALARY
    FROM STAFF
    WHERE ID = V_EMP_ID;
END GET_SALARY;
/


PL52. CREATE OR REPLACE PROCEDURE CHANGE_PHONE
(V_PHONE_NO in out varchar2(8))
IS
BEGIN
  V_PHONE_NO := SUBSTR(V_PHONE_NO,1,3)||'-'||SUBSTR(V_PHONE_NO,4,4);
END CHANGE_PHONE;
/


PL53. create or replace function get_sal
(v_emp_id  NUMBER)
RETURN NUMBER
is
v_salary  staff.salary%TYPE;
begin
    select salary
         into v_salary
      from staff
      where id = v_emp_id;
    RETURN v_salary;
end get_sal;
/


PL55. create trigger salary_check
before
insert or update of salary,job on staff
for each row
when (new.job<>'CEO')
declare
minsal    number;
maxsal    number;
begin
select min(salary),max(salary)
into     minsal,maxsal
from staff
where job = :new.job;
if :new.salary < minsal or
   :new.salary > maxsal
then rollback work;
end if;
end;
/


PL57. create trigger comm_check
/* Triggering event */
after update of comm on staff
for each row
/* Trigger constraint */
when (new.job <> 'SALES')
begin
if (:old.comm is null) then
insert into exception_table (message)
     values(:new.name||'invalid amount on check');
end if;
end;
/


PL61. create package emp_actions as
    TYPE EmpRec_Type is RECORD(emp_id INTEGER,salary REAL);
    CUROSR desc_salary(emp_id NUMBER) RETURN EmpRecTYPe;

    PROCEDURE hire_employee
        (ename    char(9),
         mgr      number(4),
         salary   number(7,2),
         comm     number(7,2),
         dept     number(4));

    PROCEDURE fire_employee(emp_id  NUMBER);
END EMP_ACTIONS:
BEGIN
 LOOP
         Select max(po) + 1 into new_po  from puorder;
         INSERT INTO puorder (PO,PO_DATE) VALUES(new_po,sysdate);
         countr := countr + 1;
         exit when countr = 10;
 END LOOP;
COMMIT;
END;
/

