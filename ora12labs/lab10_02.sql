Select upc, gr_abbr_code
From pers_svcmbr_tbl
Where upc = 'P18T0'
Union
Select upc, gr_abbr_code
From pers_svcmbr_tbl
Where upc = 'YH7B0'
Union
Select upc, gr_abbr_code
From pers_svcmbr_tbl
Where upc = '8BDAA'
order by 1,2
