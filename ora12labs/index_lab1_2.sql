create table person_tbl as select * from pers_person_tbl

alter table person_tbl 
add constraint pk_person_ssn_sm_rec_prec primary key (ssn_sm,rec_prec)