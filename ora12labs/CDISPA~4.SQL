SELECT decode(SUM(TOTALQ),0,'No Responses'), (SUM(WAIT)/SUM(TOTALQ))
  "Average Wait Time"
 FROM V$QUEUE Q, V$DISPATCHER D
 WHERE q.type = 'DISPATCHER'    AND
     q.paddr = d.paddr
/
