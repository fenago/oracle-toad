alter table svcmbr_tbl
    add constraint FK_svcmbr_ssn_recprec foreign key (ssn_sm,rec_prec)
    references person_tbl (ssn_sm,rec_prec)
/
