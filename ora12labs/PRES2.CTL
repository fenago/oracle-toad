 LOAD DATA
 INFILE 'C:\9I\BIN\PRESDATA.DAT'
 REPLACE
 INTO TABLE PRES
 ( PRES_NAME           POSITION(00002:00021) CHAR

                                           ,

   PARTY               POSITION(00023:00042) CHAR

                                           ,

   STATE_BORN          POSITION(00044:00063) CHAR

                                           )
