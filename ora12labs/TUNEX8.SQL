SELECT substr(rowid,10,6), 
       COUNT(*) "ROWS IN THIS BLOCK"
FROM   BIG2
GROUP  BY SUBSTR(ROWID,10,6)
/
