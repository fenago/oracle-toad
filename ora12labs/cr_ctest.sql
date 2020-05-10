 -- create a new revision of the Customers table with a
 -- large number of blocks.
 set echo on
 DROP TABLE CTEST PURGE;
 CREATE TABLE CTEST
 PCTFREE 80 PCTUSED 10
as SELECT * FROM customers;
EXEC DBMS_STATS.GATHER_TABLE_STATS('SH','CTEST');

