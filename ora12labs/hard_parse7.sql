-- Test varray processing 
-- set feedback off
DECLARE

 CURSOR C1 IS SELECT SUM(binteger) total FROM scott.big;

 TYPE emp_list IS TABLE OF VARCHAR2(30);

 parameters emp_list; 

 base_string VARCHAR2(70) := 'select SUM(binteger) from scott.big where bigno = ::1';
 statement_str VARCHAR2(80); 
 return_str C1%ROWTYPE;
BEGIN 

  SELECT distinct TO_CHAR(bigno) BULK COLLECT INTO parameters FROM scott.big;

  FOR j in parameters.First .. parameters.LAST LOOP

        statement_str := REGEXP_REPLACE(base_string,'\:\:1', parameters(j));

        EXECUTE IMMEDIATE statement_STR INTO return_str;

        DBMS_OUTPUT.PUT_LINE(return_str.total);
  END LOOP;
END;
.
/