Select EVENT, TOTAL_WAITS
From V$SYSTEM_EVENT
Where EVENT = 'free buffer waits'
/
