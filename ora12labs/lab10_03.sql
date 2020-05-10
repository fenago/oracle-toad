select ssn_sm, States_us
from pers_person_tbl
where states_us = 'AR'
intersect
select ssn_sm, 'AR'
from pers_svcmbr_tbl