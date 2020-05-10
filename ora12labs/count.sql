/* Here the PARTITION BY sub-clause causes the reseting of the ACCNT_INDEX column. 
The COUNT(*) gives the number of rows encountered so far in the order produced by the 
ORDER BY sub-clause. The RANGE UNBOUNDED PRECEDING causes the COUNT(*) to evalute for 
all rows encountered so far in the partition.    
*/

SELECT submit_date, COUNT(*) 
OVER(PARTITION BY submit_date ORDER BY submit_date 
ROWS UNBOUNDED PRECEDING) NUM_RECS
FROM vote_count;
