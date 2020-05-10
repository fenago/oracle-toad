DECLARE
I NUMBER := 10000;
lname_ind   varchar2(27) :=' ';
countr number := 1;
cursor stfhistory_cursor is
     select name_ind
     from comp.stfhistory
     for update of name_ind;
cursor person_cursor is
       select name_ind
       from pers_person_tbl;

BEGIN
FOR stf_record IN stfhistory_cursor LOOP
select name_ind into lname_ind
from pers_person_tbl
where name_ind = (select min(name_ind)
                from pers_person_tbl
                where name_ind > lname_ind
                order by name_ind;
             
                update comp.stfhistory
		set name_ind = stf_record.name_ind
                where current of stfhistory_cursor;
     
 exit when (stfhistory_cursor%ROWCOUNT >= 6901) or (stfhistory_cursor%NOTFOUND);
END LOOP;
COMMIT;
END;
/
