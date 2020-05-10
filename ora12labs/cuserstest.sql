create table userstest
           (id     number(7) not null,
            name   varchar2(15),
            address  varchar2(25)) storage (initial 200k) tablespace users
/
