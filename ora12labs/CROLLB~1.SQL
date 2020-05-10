SELECT s.sid, s.serial#, t.start_time, t.xidusn, s.username
 FROM v$session s, v$transaction t, v$rollstat r
 WHERE s.saddr = t.ses_addr
 AND      t.xidusn = r.usn
 AND        ((r.curext = t.start_uext-1) or
 ((r.curext = r.extents-1) and t.start_uext=0))
/
