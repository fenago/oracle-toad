select substr(name_ind,1,instr(name_ind,'  ')-1) "LAST NAME",
       nvl(to_char(apft_score),'No Score') SCORES
from pers_person_tbl
where ssn_sm < '102551212'
/
