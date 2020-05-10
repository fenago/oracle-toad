select
'BUFFER_POOL_KEEP = ('||trunc(sum(s.blocks)*1.2)||',2)'
from
   dba_segments s
where
   s.buffer_pool = '&A_BUFFER_POOL'
-- CHOOSE DEFAULT, KEEP, RECYCLE, DB_16k_CACHE_SIZE ETC.
/
