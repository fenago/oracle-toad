select sid, wait_time, seconds_in_wait, state
   from v$session_wait
   where event = 'buffer busy wait';


SELECT sid, event, total_waits, 
  time_waited, average_wait
  FROM V$SESSION_EVENT
  WHERE event = 'buffer busy waits';

exit
