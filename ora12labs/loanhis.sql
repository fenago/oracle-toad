VAR max_cycles NUMBER
EXEC :max_cycles := 26;
VAR Cycle NUMBER
EXEC :cycle := 1;
BEGIN
WHILE :cycle <= :max_cycles LOOP
    INSERT INTO loanhist
    SELECT isbn+:cycle
         , copy_no  
         , SYSDATE - :cycle
         , 0          
         , 8788+1
         , SYSDATE
         , SYSDATE + 30
         , null
         , null
         , null
         , null
    FROM loan;
:cycle := :cycle + 1;
  END LOOP;
END;
/
    UPDATE loanhist 
    SET title_no = 500
/
