-- sol_03_02_02_01.sql 

COLUMN name FORMAT A40

SELECT name, class, value 
FROM V$SYSSTAT
ORDER BY class;
