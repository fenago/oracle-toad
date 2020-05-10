SELECT sid, to_char('09-SEP-14','hh24:mi:ss') stime, 
message,( sofar/totalwork)* 100 percent 
FROM v$session_longops
WHERE sofar/totalwork < 1
/
