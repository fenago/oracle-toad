-- Force hard parsing 
set feedback off
DECLARE

 CURSOR C1 IS SELECT * FROM orders;

 CURSOR C2 IS SELECT * FROM order_items;

 TYPE list IS TABLE OF VARCHAR2(30);

 parameters list; 

 base_string VARCHAR2(80) := 'select * from ORDERS where order_id = ::1';
 statement_str VARCHAR2(105); 
 return_str C1%ROWTYPE;
BEGIN 

  SELECT TO_CHAR(order_id) BULK COLLECT INTO parameters FROM ORDERS;

  FOR j in parameters.First .. parameters.LAST LOOP

        statement_str := REGEXP_REPLACE(base_string,'\:\:1', parameters(j));

        EXECUTE IMMEDIATE statement_STR INTO return_str;

        DBMS_OUTPUT.PUT_LINE(return_str.order_id||' '||return_str.order_mode);
  END LOOP;
END;
.
/
