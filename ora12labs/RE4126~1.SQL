select regexp_substr('system/pwde@orabase:1521:sidval',
         '[^:]+',1, 3) RESULT
         from dual
/
