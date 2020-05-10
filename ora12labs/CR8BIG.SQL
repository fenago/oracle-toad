  create tablespace jerry
datafile c:\system\jerdat.dbf size 10m;
CREATE TABLE        BIG
       		(BIGNO       NUMBER(6),
        		BNAME       VARCHAR2(20))
        	tablespace jerry;  --See cr8big.sql
/
