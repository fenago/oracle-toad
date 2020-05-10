/*  See rollback.sql                                                       */
/*  Rollback segment contention can occur whenever a transaction accesses  */
/*  a block within a rollback segment that another rollback segment needs. */
/*  Use the following  query to determine the amount of contention being   */
/*  experienced within the rollback segment.                               */

select r.name, s.gets, s.waits
from V$rollstat s, v$rollname r
where s.usn = r.usn;

/*  The following ratio compares how often a rollback segment waa accessed */
/*  with how often the database waited to access information with a        */
/*  rollback segment:                                                      */
/*  ratio = ( waits / gets ) * 100                                         */

/*  If the result is 2 or greater, there is contention with the rollback   */
/*  segment.  Create more rollback segments, which reduces the chance      */
/*  the transactions hit the same rollback segment blcoks at the same time */

/*  Use the SET TRANSACTION USE ROLLBACK SEGMENT (rollback segment name)   */
/*  to connect a transaction to a particular rollback segment              */
