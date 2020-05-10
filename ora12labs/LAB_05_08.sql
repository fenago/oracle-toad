select upc, gr_abbr_code, count(*)
           from pers_svcmbr_tbl
WHERE GR_ABBR_CODE = '&A_GRADE_ABBR_CODE'
           group by upc, gr_abbr_code
/
