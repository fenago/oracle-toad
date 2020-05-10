DECLARE
STAFF_RECORD    STAFF%rowtype;
JOB_TITLE       staff.job%type := 'CEO';
TEMP_JOB        staff.job%type;
BEGIN
--   STAFF_RECORD.NAME := UPPER('A_NAME');
--   STAFF_RECORD.DEPT  := A_DEPT;
   STAFF_RECORD.JOB   := UPPER('&A_JOB');
--   STAFF_RECORD.YEARS :=1;
--   STAFF_RECORD.SALARY := A_SALARY;
--   STAFF_RECORD.COMM   := A_COMM;
   SELECT DISTINCT JOB INTO temp_job
   from staff
   where job = staff_record.job;
   select max(id) into staff_record.id + 10 from staff;
   insert into staff 
   values(500,'RUPERT',15,staff_record.job,
          1,3500,staff_record.comm,NULL,NULL);
      EXCEPTION   
   WHEN NO_DATA_FOUND then
    rollback;
    insert into exception_table(message)
    values('BOGUS JOB TITLE - CANNOT USE CEO.');
      WHEN OTHERS THEN
    rollback;
    insert into exception_table(message)
    values('Other error occurred.');
 commit;
END;
/
