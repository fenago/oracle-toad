alter user sh identified by sh account unlock;
alter system set optimizer_mode=FIRST_ROWS_100;
BEGIN
  FOR I IN 1..6000 LOOP
      scott.call_big(i);
      IF MOD(I,1000) = 0 THEN COMMIT;
      END IF;
  END LOOP;
END;
/


