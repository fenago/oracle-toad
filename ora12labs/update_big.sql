DECLARE
v_hiredate number(11) := 0;
i number(11) := -1;
cursor big_cursor is
     select hiredate
     from scott.big
     for update of hiredate;
BEGIN
  FOR big_record IN big_cursor LOOP
             i := i - 1;
            update scott.big
            set hiredate = sysdate - i
             where current of big_cursor;
END LOOP;
COMMIT;
END;
/
