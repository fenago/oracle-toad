    drop table administration;
    drop table admin_pr_VP;
    drop table state;
    drop table pres_hobby;
    drop table pres_marriage;
    drop table election;
    
    
         CREATE TABLE administration
     (admin_nr 		     smallint not null,
      pres_name			     char(20) NOT NULL,
      year_inaugurated			     smallint not null);
      
      create table admin_PR_VP
          (admin_nr 		     smallint not null,
      pres_name			     char(20) NOT NULL,
        VICE_pres_name			     char(20) NOT NULL);
      
           create table STATE
          (STATE 		     char(20) not null,
           admin_entered		smallint,
           year_entered			     smallint NOT NULL);
           
      create table pres_hobby
      ( pres_name			     char(20) NOT NULL,
        hobby			     char(20) );
      
       create table pres_marriage
      ( pres_name			     char(20) NOT NULL,
        spouse_name			     char(20),
        pr_age                               smallint,
        sp_age                               smallint,
        nr_children                          smallint,
        mar_year                              smallint );

        create table election
      ( election_year	              smallint NOT NULL,
        candidate			     char(20),
        votes                         smallint not null,
        winner_loser_indic            char(1) not null);
            
