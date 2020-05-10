CREATE or REPLACE PROCEDURE dynamic_sample (sal IN NUMBER) AS
 cursor_id  INTEGER;
 rows_processed INTEGER;
BEGIN
 --open a cursor workspace and return its ID…
 cursor_id := DBMS_SQL.OPEN_CURSOR;
 --associate a SQL statement with the cursor…
 DBMS_SQL.PARSE(cursor_id,
  'DELETE FROM employee WHERE salary > :x',
  DBMS_SQL.V8);
--associate 'SAL' input variable with ':x' placeholder
DBMS_SQL.BIND_VARIABLE(cursor_id, ':x', sal);
--execute the SQL statement
rows_processed := DBMS_SQL.EXECUTE(cursor_id);
--close the cursor work space
DBMS_SQL.CLOSE_CURSOR(cursor_id);
EXCEPTION
WHEN OTHERS THEN
    DBMS_SQL.CLOSE_CURSOR(cursor_id);
END dynamic_sample;
/
