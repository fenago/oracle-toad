 DECLARE
            JOB_NUM INTEGER;
   BEGIN
    DBMS_JOB.SUBMIT (
                            JOB_NUM,
                            'LOG_PROC;',
                       SYSDATE  + 1/1440,
                            'SYSDATE + 1/1440');
                 COMMIT;
    DBMS_OUTPUT.PUT_LINE('JOB NUMBER = '|| TO_CHAR(JOB_NUM));
   END;
/
