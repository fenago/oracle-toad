select (SUM(GETS - GETMISSES )) / SUM (GETS)
   "Dictionary Cache Hit Ratio"
   from V$ROWCACHE
/
