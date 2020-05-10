DECLARE
countr  number(3) := 1;
TYPE name_table_type is TABLE OF varchar2(25) INDEX BY BINARY_INTEGER;        
 TYPE loc_table_type is TABLE OF varchar2(30) INDEX BY BINARY_INTEGER;        
loc_table   loc_table_type; 
pers_selection  jpl_pers_tab;
name_table   name_table_type;
m_selection jpl_pers_tab;
v_region_no  personnel.region_no%TYPE := 1;
v_last_name  personnel.last_name&TYPE;
v_current_loc  personnel.current_location%TYPE;
v_dod             personnel.dod :=sysdate;
v_total_pay  number(11,2) :=0;
cursor pers_cursor is
     select last_name,region_no,current_location,dod
     from personnel
    for update of last_name,region_no,current_location,dod;
BEGIN
/*  Need to load names into m_selection */
/* Need to load location from person
select jpl_pers_row(n1,n2)
    BULK COLLECT into m_selection
    from member;
for I in 1..m_selection.count loop
         OPEN pers_cursor;
     fetch pers_cursor into v_last_name,v_region_no,v_current_loc,v_dod;
     when NO_DATA_FOUND then
               exit;
     if countr > 4 then
        countr := 1;
     end if;
     v_region_no := countr;
    
    update personnel
           set last_name=m_selection(i),region_no=v_region_no,
                  current_location
             where current of cursor;
 v_countr := v_countr + 1;
END LOOP;
CLOSE pay_cursor;
COMMIT work;
END;
/
