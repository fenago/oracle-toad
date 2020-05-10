select /*+ use_merge(pers_scmbr_tbl) */ pers_svcmbr_tbl.*, pers_unit_tbl.*
              from pers_svcmbr_tbl, pers_unit_tbl
             where pers_svcmbr_tbl.upc = pers_unit_tbl.upc
/
