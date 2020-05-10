update staff
set comm = comm+500
where comm >
(select bonus
from project
where staff.id = project.empno)
/
