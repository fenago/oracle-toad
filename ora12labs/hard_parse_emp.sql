-- Test varray processing 

DECLARE

 CURSOR C1 IS SELECT * FROM hr.employees;

 TYPE emp_list IS TABLE OF VARCHAR2(30);

 parameters emp_list; 

 base_string VARCHAR2(107) := 'select * from hr.employees where employee_id = ::1';
 statement_str VARCHAR2(107); 
 return_str C1%ROWTYPE;
BEGIN 

  SELECT TO_CHAR(employee_id) BULK COLLECT INTO parameters FROM HR.EMPLOYEES;

  FOR j in parameters.First .. parameters.LAST LOOP

        statement_str := REGEXP_REPLACE(base_string,'\:\:1', parameters(j));

        EXECUTE IMMEDIATE statement_STR INTO return_str;

        DBMS_OUTPUT.PUT_LINE(return_str.employee_id||' '||return_str.last_name);
  END LOOP;
END;
.
/
