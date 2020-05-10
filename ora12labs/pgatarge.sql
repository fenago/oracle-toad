column c1	heading 'Target(M)'
column c2	heading 'Estimated|Cache Hit %'
column c3	heading 'Estimated|Over-Alloc.'
SELECT
   ROUND(pga_target_for_estimate /(1024*1024)) c1,
   estd_pga_cache_hit_percentage 		  c2,
   estd_overalloc_count 			  c3
FROM 
   v$pga_target_advice; 
/
