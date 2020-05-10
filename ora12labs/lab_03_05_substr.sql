select initcap(name_ind), length(name_ind)
from pers_person_tbl
where substr(name_ind,1,1)='A' or
      substr(name_ind,1,1)='J' or
      substr(name_ind,1,1)='M'
/
