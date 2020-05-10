/*  See dictcach.sql                                                       */
/*  The data dictionary cache determines how often the RDBMS goes to disk  */
/*  when it accesses information on users, privileges, tables, indexes,    */
/*  and so on.  Most database systems reuse the same database objects      */
/*  repeatedly.  Therefore, if a high degree of disk access takes place    */
/*  for operations that run the same programs, the information is likely   */
/*  being aged out too often. The same rule holds true for the other       */
/*  shared pool areas.                                                     */
/*  The following code segment enables the DBA or the user to retrieve     */
/*  the number of gets (information requests on an object) and getmisses   */
/*  (cached or missed queries).                                            */

select sum(gets) gets, sum(getmisses) getmisses
from v$rowcache;

/* The formula for the ratio of gets to getmisses is:                      */
/* ratio = (getmisses / gets) * 100                                        */

/* If the ratio is greater than 10 percent, you should consider increasing */
/* the value of the SHARED_POOL_SIZE parameter. It is usually a good idea  */
/* to have a large shared pool.                                            */
