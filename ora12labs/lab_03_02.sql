select ssn_sm, name_ind,apft_score, apft_score + 300 "New Apft Score"
from pers_person_tbl
where ssn_sm < '100551212'
/
