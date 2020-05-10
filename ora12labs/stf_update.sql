DECLARE
I NUMBER := 10000;
countr number := 1;
cursor stfhistory_cursor is
     select name_ind
     from comp.stfhistory
     for update of name_ind;
BEGIN
FOR stf_record IN stfhistory_cursor LOOP
             
                update comp.stfhistory
		set name_ind = stf_record.name_ind
                where current of stfhistory_cursor;
     
 exit when (stfhistory_cursor%ROWCOUNT >= 6901) or (stfhistory_cursor%NOTFOUND);
END LOOP;
COMMIT;
END;
/
