select substr(name_ind,1,instr(name_ind,'  ')-1) "LAST NAME",DOB,
         TO_CHAR(to_date(dob,'YYYYMMDD'),'DAY') DAY
from pers_person_tbl
where ssn_sm < '102551212'
/
