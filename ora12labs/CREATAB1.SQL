/*
** CREATAB1.QRY
** Create some of the asademo database tables.
**
** Tables are dropped first in case this is a re-creation.
**

*/



CREATE TABLE title
  (
     title_no         varchar2(255)  NOT NULL
  ,  title            varchar2(40)   NOT NULL
  ,  author           varchar2(40)   NOT NULL
  ,  synopsis         varchar2(2000)           
  );

CREATE TABLE item
  (
     isbn             NUMBER(5)         NOT NULL
  ,  title_no         VARCHAR2(255)     NOT NULL
  ,  language         VARCHAR2(20)
  ,  cover            VARCHAR2(20) 
  ,  loanable         CHAR(1)
  );

CREATE TABLE copy
  (
     isbn             NUMBER(5)         NOT NULL
  ,  copy_no          NUMBER(4)         NOT NULL
  ,  title_no         VARCHAR2(255)     NOT NULL
  ,  on_loan          VARCHAR2(1)       NOT NULL
  );

CREATE TABLE loan
  (
     isbn             NUMBER(5)     NOT NULL
  ,  copy_no          NUMBER(4)     NOT NULL
  ,  title_no         VARCHAR2(255) NOT NULL
  ,  member_no        NUMBER(8)     NOT NULL
  ,  out_date         date          NOT NULL DEFAULT SYSDATE
  ,  due_date         date          NOT NULL SYSDATE + 20
  )
;
CREATE TABLE loanhist
  (
     isbn             NUMBER(5)         NOT NULL
  ,  copy_no          NUMBER(4)         NOT NULL
  ,  out_date         date              NOT NULL
  ,  title_no         VARCHAR2(255)     NOT NULL
  ,  member_no        NUMBER(8)         NOT NULL
  ,  due_date         date         
  ,  in_date          date         
  ,  fine_assessed    NUMBER(7,2)   
  ,  fine_paid        NUMBER(7,2)           
  ,  fine_waived      NUMBER(7,2)           
  ,  remarks          VARCHAR2(255)         
  );

CREATE TABLE reservation
  (
     isbn             NUMBER(5)         NOT NULL
  ,  member_no        NUMBER(8)         NOT NULL
  ,  log_date         date        
  ,  remarks          VARCHAR2(255)          
  );

CREATE TABLE juvenile
  (
     member_no        NUMBER(8)    NOT NULL
  ,  adult_member_no  NUMBER(8)    NOT NULL
  ,  birth_date       date         NOT NULL
  );




/*
** Display results.
*/




