/*
** CREATAB2.QRY
** Create the rest of the asademo database tables.
**
** Tables are dropped first in case this is a re-creation.
**
*/





CREATE TABLE member
  (
     member_no        NUMBER(8)     NOT NULL
  ,  lastname         VARCHAR2(15)  NOT NULL 
  ,  firstname        VARCHAR2(15)  NOT NULL 
  ,  middleinitial    CHAR(10)
  ,  photograph       varchar2(255) 
  );

CREATE TABLE adult
  (
     member_no        NUMBER(8)     NOT NULL
  ,  street           VARCHAR2(15)  NOT NULL
  ,  city             VARCHAR2(15)  NOT NULL
  ,  state            CHAR(2)       NOT NULL
  ,  zip              CHAR(10)      NOT NULL
  ,  phone_no         CHAR(13)
  ,  expr_date        date          NOT NULL
  );



CREATE TABLE juvenile
  (
     member_no        number(5)    NOT NULL
  ,  adult_member_no  number(4)    NOT NULL
  ,  birth_date       date         NOT NULL
  );



/*
** Display results.
*/

SELECT Tname
FROM   TAB
WHERE TABtype = 'TABLE'
AND Tname IN ( 'MEMBER',
              'ADULT' ) 
ORDER BY TABtype, Tname;



