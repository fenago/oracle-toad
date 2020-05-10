CREATE or replace PROCEDURE dynamic_sample  AS
 cursor_id  INTEGER;
 rows_processed INTEGER;
BEGIN
/* OPEN_CURSOR opens a new workspace to parse and execute a SQL statement and returns a cursor_id to identify the workspace. */
 --open a cursor workspace and return its ID…
 cursor_id := DBMS_SQL.OPEN_CURSOR;
/* PARSE will check the given SQL statement for syntax errors.  The SQL statement passed to the PARSE procedure should not include a final semicolon */
 --associate a SQL statement with the cursor…
 DBMS_SQL.PARSE(cursor_id,
  'DELETE FROM emp WHERE sal > :x',
  DBMS_SQL.native);
 dbms_sql.close_cursor(cursor_id);
end;
/
