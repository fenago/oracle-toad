CREATE OR REPLACE PROCEDURE exec (sql_cmd IN VARCHAR2) IS
	curs_id	INTEGER;
	dummy	INTEGER;
BEGIN
	curs_id := DBMS_SQL.OPEN_CURSOR;
	DBMS_SQL.PARSE(curs_id, sql_cmd, DBMS_SQL.V7);
	dummy := DBMS_SQL.EXECUTE(curs_id);
	DBMS_SQL.CLOSE_CURSOR(curs_id);
END exec;
