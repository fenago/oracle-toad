DECLARE
countr   number(4) := 1;
v_dob     personnel.dob%type;
v_dod     personnel.dod%type := sysdate;
cursor pers_cursor is
     select  dob
     from personnel
     for update of dob,dod;
BEGIN
      OPEN pers_cursor;
    for i in 1..6900 Loop
   
      fetch pers_cursor into v_dob;
 if countr > 4 then
        countr := 1;
     end if;
     v_dob := v_dob -i;
       update personnel
       set dob = v_dob,dod = v_dod
       where current of pers_cursor;
countr := countr + 1;
EXIT WHEN pers_cursor %NOTFOUND;
END LOOP;
CLOSE pers_cursor;
COMMIT;
END;
/
