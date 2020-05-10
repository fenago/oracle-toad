 LOAD DATA
 INFILE *
 append
 INTO TABLE PRES
 ( PRES_NAME           POSITION(00002:00021) CHAR

                                           ,

   PARTY               POSITION(00023:00042) CHAR

                                           ,

   STATE_BORN          POSITION(00044:00063) CHAR

                                           )
 BEGINDATA
 CARTER J E           DEMOCRATIC           GEORGIA
 FORD G R             REPUBLICAN           NEBRASKA
 JOHNSON L B          DEMOCRATIC           TEXAS
 KENNEDY J F          DEMOCRATIC           MASSACHUSETTS
 NIXON R M            REPUBLICAN           CALIFORNIA
 REAGAN R             REPUBLICAN           ILLINOIS
 CLINTON W J          DEMOCRAT             ARKANSAS
 BUSH G H             REPUBLICAN           CONN
 BUSH G W             REPUBLICAN           TEXAS
 RICHARD              INDEPENDENT          TEXAS

