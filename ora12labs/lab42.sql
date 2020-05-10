exec DBMS_STATS.GATHER_TABLE_STATS(ownname=>'ADDM', tabname=>'ADDM',estimate_percent=>DBMS_STATS.AUTO_SAMPLE_SIZE);
/
