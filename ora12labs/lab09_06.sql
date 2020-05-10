select name_ind, states_us, upc, gr_abbr_code,apft_score
from pers_person_tbl natural join pers_svcmbr_tbl
where apft_score = (select max(apft_score) from pers_person_tbl)