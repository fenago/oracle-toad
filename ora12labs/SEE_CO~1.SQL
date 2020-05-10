select table_name, constraint_name,constraint_type
from user_constraints
where table_name = upper('&tablename')
/
