select name_ind, states_us, apft_score
from pers_person_tbl
where apft_score not between 100 and 200
/
