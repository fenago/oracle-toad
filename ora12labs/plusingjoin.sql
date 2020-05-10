DECLARE
   CNT     number :=1;
   CURSOR soldier_cursor IS
      SELECT ssn_sm, dob,   
                     cum_ret_pt, uname 
FROM   pers_person_tbl p    JOIN   pers_svcmbr_tbl s
Using (ssn_sm) JOIN   pers_unit_tbl u
Using (upc)
WHERE s.gr_abbr_code= 'PFC3';
    BEGIN
	FOR soldier_record IN  soldier_cursor LOOP
    dbms_output.put_line(soldier_record.ssn_sm ||
                                          soldier_record.dob ||
                                          soldier_record.cum_ret_pt ||
                                          soldier_record.uname);
              CNT := CNT + 1;
	END LOOP;
   END;   --see plusingjoin.sql
/
