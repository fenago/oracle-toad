/*  See librcach.sql                                                       */
/*  The above script compares the number of pins (how often an item was    */
/*  executed) to the number of reloads (how often a miss occurred)         */

select sum(pins) pins, sum(reloads) reloads
from V$librarycache;

/*  Use the following formula to determine the ratio of reloads to pins.   */
/*  If the result is 1 or greater, you need to tune the shared SQL area by */
/*  increasing the size of the shared pool.                                */

/*  ration = (reloads / pins) * 100.                                       */

