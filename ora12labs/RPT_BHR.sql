
-- ****************************************************************
-- Display BHR for Oracle
--
-- Copyright (c) 2014 Jerry Richard- All Rights reserved.
-- ****************************************************************

set pages 9999;

column logical_reads  format 999,999,999
column phys_reads     format 999,999,999
column phys_writes    format 999,999,999
column "BUFFER HIT RATIO" format 999

select
   to_char(snap_time,'yyyy-mm-dd HH24'),
   a.value + b.value  "logical_reads",
   c.value            "phys_reads",
   d.value            "phys_writes",
   round(100 * (((a.value-e.value)+(b.value-f.value))-(c.value-g.value)) /
(a.value-e.value)+(b.value-f.v
value)))
         "BUFFER HIT RATIO"
from
   perfstat.stats$sysstat a,
   perfstat.stats$sysstat b,
   perfstat.stats$sysstat c,
   perfstat.stats$sysstat d,
   perfstat.stats$sysstat e,
   perfstat.stats$sysstat f,
   perfstat.stats$sysstat g,
   perfstat.stats$snapshot   sn
where
   a.snap_id = sn.snap_id
and
   b.snap_id = sn.snap_id
and
   c.snap_id = sn.snap_id
and
   d.snap_id = sn.snap_id
and
   e.snap_id = sn.snap_id-1
and
   f.snap_id = sn.snap_id-1
and
   g.snap_id = sn.snap_id-1
and
   a.statistic# = 39
and
   e.statistic# = 39
and
   b.statistic# = 38
and
   f.statistic# = 38
and
   c.statistic# = 40
and
   g.statistic# = 40
and
   d.statistic# = 41
;
