DECLARE
v_cur_loc    person.loc_data_pers%TYPE;
v_current_loc     personnel.current_location%type;
v_region_no      personnel.region_no%type :=1;
countr   number(4) := 1;
cursor person_cursor is
     select loc_data_pers
     from person;
cursor pers_cursor is
     select  nvl(current_location,'0') current_location,nvl(region_no,0) region_no
     from personnel
     for update of current_location,region_no;
BEGIN
   OPEN person_cursor;
   OPEN pers_cursor;
    for i in 1..6900 Loop
     fetch person_cursor into v_cur_loc;
      fetch pers_cursor into v_current_loc,v_region_no;
 if countr > 4 then
        countr := 1;
     end if;
     v_region_no := countr;
     v_current_loc := v_cur_loc;
         update personnel
    set current_location = v_current_loc,region_no=v_region_no
    where current of pers_cursor;
countr := countr + 1;
EXIT WHEN person_cursor %NOTFOUND;
EXIT WHEN pers_cursor %NOTFOUND;
END LOOP;
CLOSE pers_cursor;
CLOSE person_cursor;
COMMIT;
END;
/
