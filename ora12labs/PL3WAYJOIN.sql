DECLARE
   CNT     number :=1;
   CURSOR soldier_cursor IS
      SELECT p.ssn_sm, p.dob,   
                     s.cum_ret_pt, u.uname 
FROM   pers_person_tbl p    JOIN   pers_svcmbr_tbl s
ON     p.ssn_sm = s.ssn_sm JOIN   pers_unit_tbl u
ON     s.upc = u.upc
WHERE S.GR_ABBR_CODE = 'CPTE';
    BEGIN
	FOR soldier_record IN  soldier_cursor LOOP
    dbms_output.put_line(soldier_record.ssn_sm ||
                                          soldier_record.dob ||
                                          soldier_record.cum_ret_pt ||
                                          soldier_record.uname);
              CNT := CNT + 1;
	END LOOP;
   END;   -- see pl3wayjoin.sql
/
