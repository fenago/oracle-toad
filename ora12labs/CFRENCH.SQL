select empno,ename,TO_CHAR(hiredate, 'DD/MON/YYYY', 'nls_date_language = FRENCH')
from emp where job = 'MANAGER'
/
