create tablespace rbs2
datafile 'c:\orawin72\database\jerrbs2.dbf' size 5m;
CREATE PUBLIC ROLLBACK SEGMENT jerpub3
TABLESPACE rbs2;
CREATE ROLLBACK SEGMENT JERpriv3
TABLESPACE rbs2;

/
