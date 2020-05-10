select ssn_sm, rec_prec, name_ind, states_us, yr_mo_last_phys_ex
from pers_person_tbl
where rec_prec > '20000101'
order by 5
/
