 Select SID, EVENT, SECONDS_IN_WAIT, STATE
 From V$SESSION_WAIT
 Where EVENT = 'log buffer space'
/
