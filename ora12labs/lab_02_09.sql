select name_ind, dob, apft_score, rel_denom
from pers_person_tbl
where apft_score is not null
order by 3,4
/
