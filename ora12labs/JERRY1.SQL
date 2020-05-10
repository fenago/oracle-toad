DECLARE
      vlocal   varchar2(20);
BEGIN
     FOR I in 1..10000 LOOP
         SELECT 'Jerry Was Here'
         INTO    vlocal
         FROM    dual;
    END LOOP;
END;
/
SELECT HASH_VALUE,
       EXECUTIONS,
       BUFFER_GETS,
       PARSE_CALLS,
       SUBSTR(SQL_TEXT,1,22) TEXT
FROM   V$SQLAREA
WHERE  EXECUTIONS > 9999
/                               