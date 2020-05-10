drop cluster pname;
create cluster pname (pres_name char(20));

create index nuelect_nupres_index on cluster pname; 

create table nuelect cluster pname(candidate)
as select * from election;
create table nupres cluster pname(pres_name) as select * from president;
