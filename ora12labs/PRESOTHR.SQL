--THESE ARE THE OTHER PRESIDENT TABLES
   CREATE TABLE ELECTION
     (ELECTION_YEAR                      smallint,
        CANDIDATE                        char(20),
        VOTES                            smallint,
        WINNER_LOSER_INDIC               char(1))
   IN CLASSDBX.TSPRESXX
        ;
commit;
  CREATE TABLE ADMIN_PR_VP
     (ADMIN_NR                           smallint,
      PRES_NAME                          char(20),
      VICE_PRES_NAME                     char(20))
   IN CLASSDBX.TSPRESXX
        ;
commit;

  CREATE TABLE ADMINISTRATION   
     (ADMIN_NR                           smallint,
      PRES_NAME                          char(20),
      YEAR_INAUGURATED                   smallint)
  IN CLASSDBX.TSPRESXX
        ;
commit;

  CREATE TABLE PRES_HOBBY
      (PRES_NAME                         char(20),
       HOBBY                             char(20))
  IN CLASSDBX.TSPRESXX
        ;
commit;

  CREATE TABLE PRES_MARRIAGE
      (PRES_NAME                         char(20),
       SPOUSE_NAME                       char(20),
       PR_AGE                            smallint,
       SP_AGE                            smallint,
       NR_CHILDREN                       smallint,
       MAR_YEAR                          smallint)
  IN CLASSDBX.TSPRESXX
        ;
commit;

  CREATE TABLE STATE
      (STATE                             char(20),
       ADMIN_ENTERED                     smallint,
       YEAR_ENTERED                      smallint)
  IN CLASSDBX.TSPRESXX
        ;

commit;

