select id, name, job, 'STAFF'
              FROM STAFF
              UNION ALL
              SELECT EMPNO, ename, job, 'EMPLOYEE'
              FROM EMP
              UNION ALL
              select tempid, name, 'no job yet', 'APPLICANT'
              from applicant
              order by 1
/
