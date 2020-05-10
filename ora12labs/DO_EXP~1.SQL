CREATE OR REPLACE PROCEDURE do_explain
   (addr IN  VARCHAR2
   ,hash IN INTEGER
   ,sql_text_IN IN VARCHAR2
   ,parse_user_IN IN VARCHAR2
   ,stmt_id_IN IN VARCHAR2 )
AS

   dummy    VARCHAR2(32767);

   dummy1   VARCHAR2(100);

   mycursor INTEGER;
   ret      INTEGER;
   my_sqlerrm VARCHAR2 (85);
   signed_hash  NUMBER;

   FUNCTION get_sql(addr_IN IN VARCHAR2, hash_IN IN INTEGER)
   RETURN VARCHAR2
   IS
      temp_return  VARCHAR2(32767);
      CURSOR sql_pieces_cur
      IS
      SELECT sql_text
        FROM v$sqltext
       WHERE address = HEXTORAW(addr_IN)
         AND hash_value = hash_IN
      ORDER BY piece ASC;
   BEGIN
      FOR sql_pieces_rec IN sql_pieces_cur
      LOOP
         temp_return := temp_return||sql_pieces_rec.sql_text;
      END LOOP;

      IF temp_return IS NULL
      THEN
         RAISE_APPLICATION_ERROR(-20000,'SQL Not Found');
      END IF;

      RETURN temp_return;
   END get_sql;

   FUNCTION current_schema RETURN VARCHAR2
   IS
      temp_schema   v$session.schemaname%TYPE;
   BEGIN
      SELECT schemaname
        INTO temp_schema
        FROM v$session
       WHERE sid = (SELECT MAX(sid) FROM v$mystat);
      --
      RETURN temp_schema;
   EXCEPTION
      WHEN OTHERS THEN RETURN NULL;
   END current_schema;

BEGIN
   -- adjust signed_hash if hash > 2**31
   -- (hash type mismatch between v$sqlarea and v$sqltext)
   IF hash > POWER(2,31)
   THEN
      signed_hash := hash - POWER(2,32);
   ELSE
      signed_hash := hash;
   END IF;


   EXECUTE IMMEDIATE 'ALTER SESSION SET CURRENT_SCHEMA='||parse_user_IN;


   dummy:='EXPLAIN PLAN SET STATEMENT_ID='''||stmt_id_IN||''' INTO plan_table FOR ' ;
   IF LENGTH(sql_text_IN) > 1900
   THEN
      BEGIN  -- try to get using hash first, and unsigned hash if not found
         dummy:=dummy||get_sql(addr,hash);

      EXCEPTION
         WHEN OTHERS THEN dummy:=dummy||get_sql(addr,signed_hash);

      END;
   ELSE
      dummy := dummy||sql_text_IN;
   END IF;

   -- JB: optimization = only change schema if different from current
   --IF parse_user_IN != current_schema
   --THEN
   --   dbms_output.put_line(current_schema||' '||parse_user_IN);
   --   mycursor := DBMS_SQL.OPEN_CURSOR;
   --   DBMS_SQL.PARSE(mycursor,dummy1,DBMS_SQL.NATIVE);
   --   ret := DBMS_SQL.EXECUTE(mycursor);
   --   DBMS_SQL.CLOSE_CURSOR(mycursor);
   --END IF;

   mycursor := DBMS_SQL.OPEN_CURSOR;
   DBMS_SQL.PARSE(mycursor,dummy,DBMS_SQL.NATIVE);
   ret := DBMS_SQL.EXECUTE(mycursor);


   DBMS_SQL.CLOSE_CURSOR(mycursor);


   COMMIT;
EXCEPTION -- Insert errors into PLAN_TABLE...
   WHEN OTHERS
   THEN
      my_sqlerrm := SUBSTR(sqlerrm,1,80);
      INSERT INTO plan_table(statement_id,remarks) -- change to plan_table (JB)
      VALUES (stmt_id_IN, my_sqlerrm);

      -- cleanup cursor id open
      IF DBMS_SQL.IS_OPEN(mycursor)
      THEN
         DBMS_SQL.CLOSE_CURSOR(mycursor);
      END IF;

EXECUTE IMMEDIATE 'ALTER SESSION SET CURRENT_SCHEMA=SYS';

END;
/
