DECLARE
I NUMBER := 30000;
countr number := 1;
cursor stfhistory_cursor is
     select amount
     from stfhistory
     for update of amount;
BEGIN
FOR stf_record IN stfhistory_cursor LOOP
             i := I + 1;
                update stfhistory
		set amount = i
                where current of stfhistory_cursor;
 exit when (stfhistory_cursor%ROWCOUNT >= 6901) or
           (stfhistory_cursor%NOTFOUND);
END LOOP;
COMMIT;
END;
/
