DECLARE
I NUMBER := 1
cursor PERSON_cursor is
     select dept,id,name,salary,comm
     from staff
     where dept in(10,20,84) and salary > 10000
     for update of comm,salary,dept;
BEGIN
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
