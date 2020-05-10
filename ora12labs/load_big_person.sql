
create table big_person
(ssn_sm      varchar2(9),
 rec_prec    varchar2(8),
 areax         varchar2(3),
name_ind   varchar2(27),
type_addr   varchar2(1),
states_us    varchar2(2),
dob              date,
mpc             varchar2(1),
asg_seq_nbr number(6),
ets_date      date);

insert into big_person
select ssn_sm,rec_prec,areax,name_ind,type_addr,states_us,
                 to_date(dob,'yyyymmdd'),mpc, asg_seq_nbr,to_date(ets_date,'yyyymmdd')
 from pers_person_tbl  inner join pers_svcmbr_tbl 
using (ssn_sm,rec_prec)
/
