select SUM(VALUE) "Total Session UGA memory"
 From V$sesstat A, V$STATNAME B
 Where NAME = 'session uga memory'     and
 A.STATISTIC# = B.STATISTIC#
/
