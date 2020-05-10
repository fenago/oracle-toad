CREATE PROFILE MANAGER
LIMIT    SESSIONS_PER_USER                     UNLIMITED
         CPU_PER_SESSION                       UNLIMITED
         CPU_PER_CALL                          3000
         CONNECT_TIME                          45
         LOGICAL_READS_PER_SESSION             DEFAULT
         LOGICAL_READS_PER_CALL                1000
         PRIVATE SGA                           15K
         COMPOSITE_LIMIT                       5000000
/
