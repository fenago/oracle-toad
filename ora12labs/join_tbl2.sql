select ssn_sm, rec_prec, name_ind, states_us, cum_ret_pt, gr_abbr_code
from person_tbl natural join svcmbr_tbl
where states_us in ('TX','NY','CA')
/
