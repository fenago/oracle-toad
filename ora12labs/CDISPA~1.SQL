SELECT NETWORK "PROTOCOL", SUM(BUSY)/(SUM(BUSY) + SUM(IDLE))
 "TOTAL BUSY RATE"
 FROM V$DISPATCHER
 GROUP BY NETWORK
/
