/*   See the V$logfile dynamic performance table & the V$latch table       */
/*   Execute the redologs.sql script as SYS to look at contention problems */
/*   The "redo allocation latch" controls the allocation of space for      */
/*   writing rredo information to the buffer.  The "redo copy latch" is    */
/*   used to copy information to the buffer.                               */

/*   The wait latach requests wait to make a request, sleep, and then make */
/*   the request again until it acquires the latch. Conversely, the        */
/*   immediate latch  requests do not wait; instead, they continue         */
/*   processing. Use the following query to determine the status of both   */
/*   types of latches.                                                     */

select name, gets, misses, sleeps, immediate_gets, immediate_misses
from v$latch
where name in('redo allocation', 'redo copy');

 
/*  Information about wait request appear on the left, immediate requests  */
/*  on the right.  After you execute this query -- as SYS or another user  */
/*  with access to the V$ views -- calculate the contention values:        */

/*  Redo allocation latch is checked through the following formula         */
/*  immediate contention = ( immediate_misses / (immediate_gets +          */
/*                                               immediate_misses) ) * 100 */

/*  Redo copy latch is checked through the following formula               */
/*  wait contention =  ( misses / (gets + misses) ) * 100                  */

/*  To reduce contention for the redo allocation latch, you should         */
/*  minimize the time that any single process holds the latch.  Decrease   */
/*  the value of the initialization parameter LOG_SMALL_ENTRY_MAX_SIZE     */

/* To reduce contention on redo copy latch, increase the value of the      */
/*  LOG SIMULTANEOUS_COPIES.  Typically twice as many will help to start   */
