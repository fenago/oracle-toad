select name_ind, states_us STATES, apft_score SCORES
from pers_person_tbl
where apft_score between 100 and 200
and states_us in ('NY','CA')
/
