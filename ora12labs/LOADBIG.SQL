
BEGIN
  FOR I IN 1..100000 LOOP
      IF I BETWEEN 1 AND 1999 THEN
         INSERT INTO BIGpart VALUES(I,'ONE THOUSAND');
      ELSIF I BETWEEN 2000 AND 5000 THEN
         INSERT INTO BIGpart VALUES(I,'BET 2K AND 5K');
      ELSE
         INSERT INTO BIGpart VALUES(I,NULL);
      END IF;
      IF MOD(I,1000) = 0 THEN COMMIT;
      END IF;
  END LOOP;
END;
/
