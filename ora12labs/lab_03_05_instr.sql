select initcap(name_ind), length(name_ind)
from pers_person_tbl
where instr(name_ind,'J')=1 or
      instr(name_ind,'A')=1 or
      instr(name_ind,'M')=1
/
