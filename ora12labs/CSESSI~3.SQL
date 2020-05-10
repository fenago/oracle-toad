select SUM(VALUE) "Total Session UGA memory MAX"
 From V$sesstat A, V$STATNAME B
 Where NAME = 'session uga memory max'     and
 A.STATISTIC# = B.STATISTIC#
/
