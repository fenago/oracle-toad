SELECT maximum_connections,
    maximum_sessions,
    servers_started,
    servers_terminated,
    servers_highwater
  from V$SHARED_SERVER_MONITOR
/
