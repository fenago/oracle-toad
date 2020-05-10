select upc, gr_abbr_code,count(*)
from pers_svcmbr_tbl
where gr_abbr_code = '&a_grade_abbr_code'
group by upc,gr_abbr_code
/
