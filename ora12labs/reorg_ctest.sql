-- Rebuild the table with higher density
SET ECHO ON 
SELECT BLOCKS, EMPTY_BLOCKS 
FROM USER_TABLES 
WHERE TABLE_NAME = 'CTEST';
ALTER TABLE CTEST  PCTFREE 10;
ALTER TABLE CTEST MOVE;
EXEC DBMS_STATS.GATHER_TABLE_STATS('SH','CTEST');
SELECT BLOCKS, EMPTY_BLOCKS FROM USER_TABLES
 WHERE TABLE_NAME = 'CTEST';
/
