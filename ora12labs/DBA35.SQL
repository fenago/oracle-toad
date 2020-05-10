/* See dbcache.sql                                                        */
/* It is desirable to have Oracle work within the SGA memory area as much */
/* as possible, the hit rate within the database buffer cache should be   */
/* very high -- greater than 70 percent.  To determine the rate, execute  */
/* the following query on the database buffer cache.                      */
/*  Remember the database buffer cache is concerned with:                 */
/*          Dirty Buffers                                                 */
/*          Pinned buffers                                                */
/*          Free buffers                                                  */

select substr(name,1,50), value
from v$sysstat
where name in ('consistent gets', 'db block gets', 'physical reads');

/* The query returns three values, which you can plub into the following  */
/*  formula to obtain the current database buffer cache hit ratio.        */

/*  hit ration = 1 - (physical reads / (db block gets + consistent gets)) */
/*  Increase the DB_BLOCK_BUFFERS if less than 70 percent                 */


