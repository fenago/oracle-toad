DECLARE
I NUMBER := 10000;
lname_ind   varchar2(27) :=' ';
STF_NAME_IND  VARCHAR2(27);
countr number := 1;
cursor stfhistory_cursor is
     select name_ind
     from comp.stfhistory
     for update of name_ind;
cursor person_cursor is
       select name_ind
       from pers_person_tbl;
BEGIN
OPEN STFHISTORY_CURSOR;
OPEN PERSON_CURSOR;
FETCH PERSON_CURSOR INTO LNAME_IND;
FETCH STFHISTORY_CURSOR INTO STF_NAME_IND;
WHILE PERSON_CURSOR %FOUND loop
update comp.stfhistory
		set name_ind = lname_ind
                where current of stfhistory_cursor;
 exit when (stfhistory_cursor%ROWCOUNT >= 6901) 
 or (stfhistory_cursor%NOTFOUND);
insert into exception_table values(lname_ind);
FETCH PERSON_CURSOR INTO LNAME_IND;
FETCH STFHISTORY_CURSOR INTO STF_NAME_IND;
END LOOP;
close stfHISTORY_CURSOR;
close person_cursor;
COMMIT;
END;
/
