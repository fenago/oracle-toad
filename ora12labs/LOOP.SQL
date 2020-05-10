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
              