select p.pres_name, birth_yr, mar_year, spouse_name 
from president p,  pres_marriage  m
where p.pres_name = m.pres_name;

select avg(votes) from election where winner_loser_indic = 'W';

select * from president p, pres_hobby h where p.pres_name = h.pres_name;

INSERT INTO ELECTION
 VALUES (1984,'Ronald Reagan',525,'W');
 
 select distinct(pres_name) from president
 union
 select distinct(spouse_name) from pres_marriage;
 
 update president set party = 'Conservative' where party = 'Republican';
 
 drop table spouse;
 create table SPOUSE 
 as select spouse_name, mar_year from pres_marriage;
 
 delete 
 from state where state.state = 'California';
 
 alter table staff add flower char(20) null;
 
 create table flower (name   char(20) null,
                       color char(20) null,
                        height smallint null);
                        
 drop table flower;
 
 select pres_name from president where not exists (select * from election 
 where candidate = pres_name and winner_loser_indic <> 'W');
 
                         

