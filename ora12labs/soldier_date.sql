create table SOLDIER_DATE
  (bigno  number(9) not null,
   bname  varchar2(30),
   bcomments  varchar2(60),
   binteger  number(9))
   partition by range ()
  (partition ELDER values less than ('01-JAN-1970')
    tablespace ELDER,
   partition MIDDLE values less than ('01-JAN-1980')
   tablespace MIDDLE, 
   partition CURRENT values less than ('01-JAN-1990')
   tablespace CURRENT,
   partition OVERFLOW less than ('01-JAN-2000')
    tablespace OVERFLOW);
 ;