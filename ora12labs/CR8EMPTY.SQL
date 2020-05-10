DECLARE

TYPE  t_WordsTab IS TABLE OF VARCHAR2(50);

   /*  CREATE A NULL TABLE  */
    v_Tab1  t_WordsTab;

  /*  Create a table with one element, which itself is NULL. */
    v_Tab2  t_WordsTab := t_WordsTab();

BEGIN
   IF v_Tab1  IS NULL THEN
    DBMS_OUTPUT.PUT_LINE('v_Tab1 IS NULL');
   ELSE
       DBMS_OUTPUT.PUT_LINE('v_Tab1 IS NOT NULL');
    END IF;
IF v_Tab2  IS NULL THEN
    DBMS_OUTPUT.PUT_LINE('v_Tab2 IS NULL');
   ELSE
       DBMS_OUTPUT.PUT_LINE('v_Tab2 IS NOT NULL');
 END IF;
END;
/
