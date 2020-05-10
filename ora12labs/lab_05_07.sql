select upc, gr_abbr_code, count(*)
           from pers_svcmbr_tbl
           group by upc, gr_abbr_code
/
