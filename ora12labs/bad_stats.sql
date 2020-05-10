-- Show the choice of FTS with old statistics
 SET ECHO ON
set linesiz 132
 SET AUTOTRACE TRACEONLY
 SELECT CUST_ID, CUST_LAST_NAME, CUST_TOTAL
 FROM CTEST
 WHERE COUNTRY_ID = 52779;
set autotrace off

