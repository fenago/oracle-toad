DROP TABLE STAFF;
COMMIT;
CREATE TABLE staff
       (ID NUMBER(4) NOT NULL,
	NAME VARCHAR(11),
	DEPT number(4),
	JOB char(5),
	YEARS number(3),
	SALARY NUMBER(7,2),
	COMM NUMBER(7,2));

INSERT INTO STAFF VALUES
	(10,'SANDERS',20,'MGR',7,18357.50,NULL);
INSERT INTO STAFF VALUES
	(20,'PERNAL',20,'SALES',8,18171.25,612.45);
INSERT INTO STAFF VALUES
	(30,'MARENGHI',38,'MGR',5,17506.75,NULL);
INSERT INTO STAFF VALUES
	(40,'O''BRIEN',38,'SALES',6,18006.00,846.55);
INSERT INTO STAFF VALUES
	(50,'HANES',15,'MGR',10,20659.80,NULL);
INSERT INTO STAFF VALUES
	(60,'QUIGLEY',38,'SALES',NULL,16808.30,650.25);
INSERT INTO STAFF VALUES
	(70,'ROTHMAN',15,'SALES',7,16502.83,1152.00);
INSERT INTO STAFF VALUES
	(80,'JAMES',NULL,'CLERK',NULL,13504.60,128.20);
INSERT INTO STAFF VALUES
	(90,'KOONITZ',42,'SALES',6,18001.75,1386.70);
INSERT INTO STAFF VALUES
	(100,'PLOTZ',42,'MGR',7,18352.80,NULL);
INSERT INTO STAFF VALUES
	(110,'NGAN',15,'CLERK',5,12508.20,206.60);
INSERT INTO STAFF VALUES
	(120,'NAUGHTON',38,'CLERK',NULL,12954.75,180.00);
INSERT INTO STAFF VALUES
	(130,'YAMAGUCHI',42,'CLERK',6,10505.90,75.60);
INSERT INTO STAFF VALUES
	(140,'FRAYE',51,'MGR',6,21150.00,NULL);
INSERT INTO STAFF VALUES
	(150,'WILLIAMS',51,'SALES',6,19456.50,637.65);
INSERT INTO STAFF VALUES
	(160,'MOLINARE',10,'MGR',7,22959.20,NULL);
INSERT INTO STAFF VALUES
	(170,'KERMISCH',15,'CLERK',4,12258.50,110.10);
INSERT INTO STAFF VALUES
	(180,'ABRAHAMS',38,'CLERK',3,12009.75,236.50);
INSERT INTO STAFF VALUES
	(190,'SNEIDER',20,'CLERK',8,14252.75,126.50);
INSERT INTO STAFF VALUES
	(200,'SCOUTTEN',42,'CLERK',NULL,11508.60,84.20);
INSERT INTO STAFF VALUES
	(210,'LU',10,'MGR',10,20010.00,NULL);
INSERT INTO STAFF VALUES
	(220,'SMITH',51,'SALES',7,17654.50,992.80);
INSERT INTO STAFF VALUES
	(230,'LUNDQUIST',51,'CLERK',3,13369.80,189.65);
INSERT INTO STAFF VALUES
	(240,'DANIELS',10,'MGR',5,19260.25,NULL);
INSERT INTO STAFF VALUES
	(250,'WHEELER',51,'CLERK',6,14460.00,513.30);
INSERT INTO STAFF VALUES
	(260,'JONES',10,'MGR',12,21234.00,NULL);
INSERT INTO STAFF VALUES
	(270,'LEA',66,'MGR',10,18555.50,NULL);
INSERT INTO STAFF VALUES
	(280,'WILSON',66,'SALES',9,18674.50,811.50);
INSERT INTO STAFF VALUES
	(290,'QUILL',84,'MGR',10,19818.00,NULL);
INSERT INTO STAFF VALUES
	(300,'DAVIS',84,'SALES',5,21000.00,200.30);
INSERT INTO STAFF VALUES
	(310,'GRAHAM',66,'SALES',13,21000.00,200.30);
INSERT INTO STAFF VALUES
	(320,'GONZALES',66,'SALES',4,16858.20,844.00);
INSERT INTO STAFF VALUES
	(330,'BURKE',66,'CLERK',1,10988,55.50);
INSERT INTO STAFF VALUES
	(340,'EDWARDS',84,'SALES',7,17844.00,1285.00);
INSERT INTO STAFF VALUES
	(350,'GAFNEY',84,'CLERK',5,13030.50,188.00);
DROP TABLE ORG;
COMMIT;
CREATE TABLE ORG
       (DEPTNUMB NUMBER(2),
	DEPTNAME CHAR(14),
	MANAGER  NUMBER(4),
	DIVISION CHAR(9),
	LOCATION CHAR(15));

INSERT INTO ORG  VALUES
	(10,'HEAD OFFICE',160,'CORPORATE','NEW YORK');
INSERT INTO ORG VALUES (15,'NEW ENGLAND',50,'EASTERN','BOSTON');
INSERT INTO ORG VALUES
	(20,'MID ATLANTIC',10,'EASTERN','WASHINGTON');
INSERT INTO ORG VALUES
	(38,'SOUTH ATLANTIC',30,'EASTERN','ATLANTA');
INSERT INTO ORG VALUES
	(42,'GREAT LAKES',100,'MIDWEST','CHICAGO');
INSERT INTO ORG VALUES
	(51,'PLAINS',140,'MIDWEST','DALLAS');
INSERT INTO ORG VALUES
	(66,'PACIFIC',270,'WESTERN','SAN FRANCISCO');
INSERT INTO ORG VALUES
	(84,'MOUNTAIN',290,'WESTERN','DENVER');
DROP TABLE APPLICANT;
COMMIT;
CREATE TABLE APPLICANT
	(
	TEMPID  NUMBER(4),
	NAME CHAR(10),
	ADDRESS VARCHAR(20),
	EDLEVEL NUMBER(2),
	COMMENTS VARCHAR(45)
	) ;
INSERT INTO APPLICANT VALUES
	(40,'FROMMHERZ','SAN JOSE, CA',12,'NO SALES EXPERIENCE');
INSERT INTO APPLICANT VALUES
	(410,'JACOBS','POUGHKEEPSIE, NY',16,'GOOD CANDIDATE FOR WASHINGTON');
INSERT INTO APPLICANT VALUES
	(420,'MONTEZ','DALLAS, TX',13,'OFFER SALES POSITION');
INSERT INTO APPLICANT VALUES
	(430,'RICHOWSKI','TUCSON, AZ',14,'CANT START WORK UNTIL 12/93');
INSERT INTO APPLICANT VALUES
	(440,'REID','ENDICOTT, NY',14,'1 YEAR SALES EXPERIENCE');
INSERT INTO APPLICANT VALUES
	(450,'JEFFYREYS','PHILADELPHIA, PA.',12,'GOOD CLERICAL BACKGROUND');
INSERT INTO APPLICANT VALUES
	(460,'STANLEY','CHICAGO, IL',11,'WANTS PARTIME JOB');
INSERT INTO APPLICANT VALUES
	(470,'CASALS','PALO ALTO, CA',14,'EXPERIENCED SALESMAN');
INSERT INTO APPLICANT VALUES
	(480,'LEEDS','EAST FISHKILL, NY',12,'NEEDS INTERVIEW WITH BROWN');
INSERT INTO APPLICANT VALUES
	(490,'GASPARD','PARIS, TX',16,'WORKED HERE FROM 1/80 TO 6/90');
COMMIT;

/* prompt Building demonstration tables.  Please wait. */
set termout off
set feedback off
DROP TABLE EMP;
DROP TABLE DEPT;
DROP TABLE BONUS;
DROP TABLE SALGRADE;
DROP TABLE DUMMY;
DROP TABLE ORD;
DROP TABLE ITEM;
DROP TABLE PRICE;
DROP TABLE PRODUCT;
DROP TABLE CUSTOMER;
DROP TABLE SEQ;

CREATE TABLE EMP
       (EMPNO NUMBER(4) NOT NULL,
	ENAME CHAR(10),
	JOB CHAR(9),
	MGR NUMBER(4),
	HIREDATE DATE,
	SAL NUMBER(7,2),
	COMM NUMBER(7,2),
	DEPTNO NUMBER(2));

INSERT INTO EMP VALUES
	(7369,'SMITH','CLERK',7902,'17-DEC-1980',800,NULL,20);
INSERT INTO EMP VALUES
	(7499,'ALLEN','SALESMAN',7698,'20-FEB-1981',1600,300,30);
INSERT INTO EMP VALUES
	(7521,'WARD','SALESMAN',7698,'22-FEB-1981',1250,500,30);
INSERT INTO EMP VALUES
	(7566,'JONES','MANAGER',7839,'2-APR-1981',2975,NULL,20);
INSERT INTO EMP VALUES
	(7654,'MARTIN','SALESMAN',7698,'28-SEP-1981',1250,1400,30);
INSERT INTO EMP VALUES
	(7698,'BLAKE','MANAGER',7839,'1-MAY-1981',2850,NULL,30);
INSERT INTO EMP VALUES
	(7782,'CLARK','MANAGER',7839,'9-JUN-1981',2450,NULL,10);
INSERT INTO EMP VALUES
	(7788,'SCOTT','ANALYST',7566,'09-DEC-1982',3000,NULL,20);
INSERT INTO EMP VALUES
	(7839,'KING','PRESIDENT',NULL,'17-NOV-1981',5000,NULL,10);
INSERT INTO EMP VALUES
	(7844,'TURNER','SALESMAN',7698,'8-SEP-1981',1500,0,30);
INSERT INTO EMP VALUES
	(7876,'ADAMS','CLERK',7788,'12-JAN-1983',1100,NULL,20);
INSERT INTO EMP VALUES
	(7900,'JAMES','CLERK',7698,'3-DEC-1981',950,NULL,30);
INSERT INTO EMP VALUES
	(7902,'FORD','ANALYST',7566,'3-DEC-1981',3000,NULL,20);
INSERT INTO EMP VALUES
	(7934,'MILLER','CLERK',7782,'23-JAN-1982',1300,NULL,10);

CREATE TABLE DEPT
       (DEPTNO NUMBER(2),
	DNAME CHAR(14) ,
	LOC CHAR(13) ) ;

INSERT INTO DEPT VALUES
	(10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES
	(30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES
	(40,'OPERATIONS','BOSTON');

CREATE TABLE SALGRADE
      ( GRADE NUMBER,
	LOSAL NUMBER,
	HISAL NUMBER );

INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);

CREATE TABLE DUMMY
      ( DUMMY NUMBER );

INSERT INTO DUMMY VALUES (0);

COMMIT;

CREATE TABLE ORD  (
 ORDID            NUMBER (4) NOT NULL,
 ORDERDATE        DATE,
 COMMPLAN         CHAR (1),
 CUSTID           NUMBER (6) NOT NULL,
 SHIPDATE         DATE,
 TOTAL            NUMBER (8,2));

CREATE TABLE ITEM  (
 ORDID               NUMBER (4) NOT NULL,
 ITEMID              NUMBER (4) NOT NULL,
 PRODID              NUMBER (6),
 ACTUALPRICE         NUMBER (8,2),
 QTY                 NUMBER (8),
 ITEMTOT             NUMBER (8,2));

CREATE TABLE PRODUCT  (
 PRODID                 NUMBER (6) NOT NULL,
 DESCRIP                CHAR (30));

CREATE TABLE PRICE  (
 PRODID              NUMBER (6) NOT NULL,
 STDPRICE               NUMBER (8,2),
 MINPRICE               NUMBER (8,2),
 STARTDATE              DATE,
 ENDDATE                DATE);

CREATE TABLE CUSTOMER (
 CUSTID              NUMBER (6) NOT NULL,
 NAME                  CHAR (45),
 ADDRESS               CHAR (40),
 CITY                  CHAR (30),
 STATE                 CHAR (2),
 ZIP                   CHAR (9),
 AREA                  NUMBER (3),
 PHONE                 CHAR (9),
 REPID                 NUMBER (4) NOT NULL,
 CREDITLIMIT           NUMBER (9));

CREATE TABLE SEQ  (
 TABLENAME             CHAR (30) NOT NULL,
 LAST_ID               NUMBER (8));

INSERT INTO ORD ( TOTAL , SHIPDATE , ORDID , ORDERDATE , CUSTID , COMMPLAN)
VALUES ( '101.4'
, '08-JAN-87'
, '610'
, '07-JAN-87'
, '101'                                      , 'A');

INSERT INTO ORD ( TOTAL , SHIPDATE , ORDID , ORDERDATE , CUSTID , COMMPLAN)
VALUES ( '45'
, '11-JAN-87'
, '611'
, '11-JAN-87'
, '102'                                      , 'B');

INSERT INTO ORD ( TOTAL , SHIPDATE , ORDID , ORDERDATE , CUSTID , COMMPLAN)
VALUES ( '5310'
, '20-JAN-87'
, '612'
, '15-JAN-87'
, '104'                                      , 'C');

INSERT INTO ORD ( TOTAL , SHIPDATE , ORDID , ORDERDATE , CUSTID , COMMPLAN)
VALUES ( '2.4'
, '30-MAY-86'
, '601'
, '01-MAY-86'
, '106'                                      , 'A');

INSERT INTO ORD ( TOTAL , SHIPDATE , ORDID , ORDERDATE , CUSTID , COMMPLAN)
VALUES ( '56'
, '20-JUN-86'
, '602'
, '05-JUN-86'
, '102'                                      , 'B');

INSERT INTO ORD ( TOTAL , SHIPDATE , ORDID , ORDERDATE , CUSTID , COMMPLAN)
VALUES ( '698'
, '30-JUN-86'
, '604'
, '15-JUN-86'
, '106'                                      , 'A');

INSERT INTO ORD ( TOTAL , SHIPDATE , ORDID , ORDERDATE , CUSTID , COMMPLAN)
VALUES ( '8674'
, '30-JUL-86'
, '605'
, '14-JUL-86'
, '106'                                      , 'A');

INSERT INTO ORD ( TOTAL , SHIPDATE , ORDID , ORDERDATE , CUSTID , COMMPLAN)
VALUES ( '3.4'
, '30-JUL-86'
, '606'
, '14-JUL-86'
, '100'                                      , 'A');

INSERT INTO ORD ( TOTAL , SHIPDATE , ORDID , ORDERDATE , CUSTID , COMMPLAN)
VALUES ( '97.5'
, '15-AUG-86'
, '609'
, '01-AUG-86'
, '100'                                      , 'B');

INSERT INTO ORD ( TOTAL , SHIPDATE , ORDID , ORDERDATE , CUSTID , COMMPLAN)
VALUES ( '5.6'
, '18-JUL-86'
, '607'
, '18-JUL-86'
, '104'                                      , 'C');

INSERT INTO ORD ( TOTAL , SHIPDATE , ORDID , ORDERDATE , CUSTID , COMMPLAN)
VALUES ( '35.2'
, '25-JUL-86'
, '608'
, '25-JUL-86'
, '104'                                      , 'C');

INSERT INTO ORD ( TOTAL , SHIPDATE , ORDID , ORDERDATE , CUSTID , COMMPLAN)
VALUES ( '224'
, '05-JUN-86'
, '603'
, '05-JUN-86'
, '102'                                      , '');

INSERT INTO ORD ( TOTAL , SHIPDATE , ORDID , ORDERDATE , CUSTID , COMMPLAN)
VALUES ( '4450'
, '12-MAR-87'
, '620'
, '12-MAR-87'
, '100'                                      , '');

INSERT INTO ORD ( TOTAL , SHIPDATE , ORDID , ORDERDATE , CUSTID , COMMPLAN)
VALUES ( '10760'
, '01-FEB-87'
, '613'
, '01-FEB-87'
, '108'                                      , '');

INSERT INTO ORD ( TOTAL , SHIPDATE , ORDID , ORDERDATE , CUSTID , COMMPLAN)
VALUES ( '23940'
, '05-FEB-87'
, '614'
, '01-FEB-87'
, '102'                                      , '');

INSERT INTO ORD ( TOTAL , SHIPDATE , ORDID , ORDERDATE , CUSTID , COMMPLAN)
VALUES ( '764'
, '10-FEB-87'
, '616'
, '03-FEB-87'
, '103'                                      , '');

INSERT INTO ORD ( TOTAL , SHIPDATE , ORDID , ORDERDATE , CUSTID , COMMPLAN)
VALUES ( '980'
, '04-FEB-87'
, '619'
, '22-FEB-87'
, '104'                                      , '');

INSERT INTO ORD ( TOTAL , SHIPDATE , ORDID , ORDERDATE , CUSTID , COMMPLAN)
VALUES ( '46370'
, '03-MAR-87'
, '617'
, '05-FEB-87'
, '105'                                      , '');

INSERT INTO ORD ( TOTAL , SHIPDATE , ORDID , ORDERDATE , CUSTID , COMMPLAN)
VALUES ( '710'
, '06-FEB-87'
, '615'
, '01-FEB-87'
, '107'                                      , '');

INSERT INTO ORD ( TOTAL , SHIPDATE , ORDID , ORDERDATE , CUSTID , COMMPLAN)
VALUES ( '3555.5'
, '06-MAR-87'
, '618'
, '15-FEB-87'
, '102'                                      , 'A');

INSERT INTO ORD ( TOTAL , SHIPDATE , ORDID , ORDERDATE , CUSTID , COMMPLAN)
VALUES ( '730'
, '01-JAN-87'
, '621'
, '15-MAR-87'
, '100'                                      , 'A');

CREATE UNIQUE INDEX ORD_INDEX ON ORD  (ORDID);

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '1'
, '100890'
, '610'
, '58'
, '3'
, '58');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '1'
, '100861'
, '611'
, '45'
, '1'
, '45');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '100'
, '100860'
, '612'
, '3000'
, '1'
, '30');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '1'
, '200376'
, '601'
, '2.4'
, '1'
, '2.4');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '20'
, '100870'
, '602'
, '56'
, '1'
, '2.8');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '3'
, '100890'
, '604'
, '174'
, '1'
, '58');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '2'
, '100861'
, '604'
, '84'
, '2'
, '42');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '10'
, '100860'
, '604'
, '440'
, '3'
, '44');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '4'
, '100860'
, '603'
, '224'
, '2'
, '56');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '1'
, '100860'
, '610'
, '35'
, '1'
, '35');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '3'
, '100870'
, '610'
, '8.4'
, '2'
, '2.8');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '200'
, '200376'
, '613'
, '440'
, '4'
, '2.2');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '444'
, '100860'
, '614'
, '15540'
, '1'
, '35');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '1000'
, '100870'
, '614'
, '2800'
, '2'
, '2.8');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '20'
, '100861'
, '612'
, '810'
, '2'
, '40.5');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '150'
, '101863'
, '612'
, '1500'
, '3'
, '10');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '10'
, '100860'
, '620'
, '350'
, '1'
, '35');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '1000'
, '200376'
, '620'
, '2400'
, '2'
, '2.4');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '500'
, '102130'
, '620'
, '1700'
, '3'
, '3.4');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '100'
, '100871'
, '613'
, '560'
, '1'
, '5.6');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '200'
, '101860'
, '613'
, '4800'
, '2'
, '24');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '150'
, '200380'
, '613'
, '600'
, '3'
, '4');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '100'
, '102130'
, '619'
, '340'
, '3'
, '3.4');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '50'
, '100860'
, '617'
, '1750'
, '1'
, '35');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '100'
, '100861'
, '617'
, '4500'
, '2'
, '45');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '1000'
, '100871'
, '614'
, '5600'
, '3'
, '5.6');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '10'
, '100861'
, '616'
, '450'
, '1'
, '45');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '50'
, '100870'
, '616'
, '140'
, '2'
, '2.8');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '2'
, '100890'
, '616'
, '116'
, '3'
, '58');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '10'
, '102130'
, '616'
, '34'
, '4'
, '3.4');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '10'
, '200376'
, '616'
, '24'
, '5'
, '2.4');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '100'
, '200380'
, '619'
, '400'
, '1'
, '4');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '100'
, '200376'
, '619'
, '240'
, '2'
, '2.4');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '4'
, '100861'
, '615'
, '180'
, '1'
, '45');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '1'
, '100871'
, '607'
, '5.6'
, '1'
, '5.6');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '100'
, '100870'
, '615'
, '280'
, '2'
, '2.8');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '500'
, '100870'
, '617'
, '1400'
, '3'
, '2.8');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '500'
, '100871'
, '617'
, '2800'
, '4'
, '5.6');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '500'
, '100890'
, '617'
, '29000'
, '5'
, '58');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '100'
, '101860'
, '617'
, '2400'
, '6'
, '24');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '200'
, '101863'
, '617'
, '2500'
, '7'
, '12.5');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '100'
, '102130'
, '617'
, '340'
, '8'
, '3.4');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '200'
, '200376'
, '617'
, '480'
, '9'
, '2.4');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '300'
, '200380'
, '617'
, '1200'
, '10'
, '4');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '5'
, '100870'
, '609'
, '12.5'
, '2'
, '2.5');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '1'
, '100890'
, '609'
, '50'
, '3'
, '50');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '23'
, '100860'
, '618'
, '805'
, '1'
, '35');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '50'
, '100861'
, '618'
, '2255.5'
, '2'
, '45.11');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '10'
, '100870'
, '618'
, '450'
, '3'
, '45');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '10'
, '100861'
, '621'
, '450'
, '1'
, '45');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '100'
, '100870'
, '621'
, '280'
, '2'
, '2.8');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '50'
, '100871'
, '615'
, '250'
, '3'
, '5');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '1'
, '101860'
, '608'
, '24'
, '1'
, '24');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '2'
, '100871'
, '608'
, '11.2'
, '2'
, '5.6');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '1'
, '100861'
, '609'
, '35'
, '1'
, '35');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '1'
, '102130'
, '606'
, '3.4'
, '1'
, '3.4');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '100'
, '100861'
, '605'
, '4500'
, '1'
, '45');


INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '500'
, '100870'
, '605'
, '1400'
, '2'
, '2.8');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '5'
, '100890'
, '605'
, '290'
, '3'
, '58');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '50'
, '101860'
, '605'
, '1200'
, '4'
, '24');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '100'
, '101863'
, '605'
, '1250'
, '5'
, '9');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '10'
, '102130'
, '605'
, '34'
, '6'
, '3.4');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '100'
, '100871'
, '612'
, '550'
, '4'
, '5.5');

INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
VALUES ( '50'
, '100871'
, '619'
, '280'
, '4'
, '5.6');

CREATE UNIQUE INDEX ITEM_INDEX ON ITEM  (ORDID, ITEMID);

INSERT INTO PRICE ( STDPRICE , STARTDATE , PRODID , MINPRICE , ENDDATE)
VALUES ( '4.8'
, '01-JAN-85'
, '100871'
, '3.2'
, '01-DEC-85');

INSERT INTO PRICE ( STDPRICE , STARTDATE , PRODID , MINPRICE , ENDDATE)
VALUES ( '58'
, '01-JAN-85'
, '100890'
, '46.4'
, '');

INSERT INTO PRICE ( STDPRICE , STARTDATE , PRODID , MINPRICE , ENDDATE)
VALUES ( '54'
, '01-JUN-84'
, '100890'
, '40.5'
, '31-MAY-84');

INSERT INTO PRICE ( STDPRICE , STARTDATE , PRODID , MINPRICE , ENDDATE)
VALUES ( '35'
, '01-JUN-86'
, '100860'
, '28'
, '');

INSERT INTO PRICE ( STDPRICE , STARTDATE , PRODID , MINPRICE , ENDDATE)
VALUES ( '32'
, '01-JAN-86'
, '100860'
, '25.6'
, '31-MAY-86');

INSERT INTO PRICE ( STDPRICE , STARTDATE , PRODID , MINPRICE , ENDDATE)
VALUES ( '30'
, '01-JAN-85'
, '100860'
, '24'
, '31-DEC-85');

INSERT INTO PRICE ( STDPRICE , STARTDATE , PRODID , MINPRICE , ENDDATE)
VALUES ( '45'
, '01-JUN-86'
, '100861'
, '36'
, '');

INSERT INTO PRICE ( STDPRICE , STARTDATE , PRODID , MINPRICE , ENDDATE)
VALUES ( '42'
, '01-JAN-86'
, '100861'
, '33.6'
, '31-MAY-86');

INSERT INTO PRICE ( STDPRICE , STARTDATE , PRODID , MINPRICE , ENDDATE)
VALUES ( '39'
, '01-JAN-85'
, '100861'
, '31.2'
, '31-DEC-85');

INSERT INTO PRICE ( STDPRICE , STARTDATE , PRODID , MINPRICE , ENDDATE)
VALUES ( '2.8'
, '01-JAN-86'
, '100870'
, '2.4'
, '');

INSERT INTO PRICE ( STDPRICE , STARTDATE , PRODID , MINPRICE , ENDDATE)
VALUES ( '2.4'
, '01-JAN-85'
, '100870'
, '1.9'
, '01-DEC-85');

INSERT INTO PRICE ( STDPRICE , STARTDATE , PRODID , MINPRICE , ENDDATE)
VALUES ( '5.6'
, '01-JAN-86'
, '100871'
, '4.8'
, '');

INSERT INTO PRICE ( STDPRICE , STARTDATE , PRODID , MINPRICE , ENDDATE)
VALUES ( '24'
, '15-FEB-85'
, '101860'
, '18'
, '');

INSERT INTO PRICE ( STDPRICE , STARTDATE , PRODID , MINPRICE , ENDDATE)
VALUES ( '12.5'
, '15-FEB-85'
, '101863'
, '9.4'
, '');

INSERT INTO PRICE ( STDPRICE , STARTDATE , PRODID , MINPRICE , ENDDATE)
VALUES ( '3.4'
, '18-AUG-85'
, '102130'
, '2.8'
, '');

INSERT INTO PRICE ( STDPRICE , STARTDATE , PRODID , MINPRICE , ENDDATE)
VALUES ( '2.4'
, '15-NOV-86'
, '200376'
, '1.75'
, '');

INSERT INTO PRICE ( STDPRICE , STARTDATE , PRODID , MINPRICE , ENDDATE)
VALUES ( '4'
, '15-NOV-86'
, '200380'
, '3.2'
, '');

CREATE UNIQUE INDEX PRICE_INDEX ON PRICE  (PRODID, STARTDATE);

INSERT INTO CUSTOMER ( ZIP , STATE , REPID , PHONE , NAME , CUSTID , CREDITLIMIT
, CITY , AREA , ADDRESS) VALUES ( '55649'     , 'MN'
, '7844'                                     , '566-9123'
, 'NORTH WOODS HEALTH AND FITNESS SUPPLY CENTER'
, '108'
, '8000'                                     , 'HIBBING'
, '612'
, '98 LONE PINE WAY');

INSERT INTO CUSTOMER ( ZIP , STATE , REPID , PHONE , NAME , CUSTID , CREDITLIMIT
, CITY , AREA , ADDRESS) VALUES ( '96711'     , 'CA'
, '7844'                                     , '598-6609'
, 'JOCKSPORTS'
, '100'
, '5000'                                     , 'BELMONT'
, '415'
, '345 VIEWRIDGE');

INSERT INTO CUSTOMER ( ZIP , STATE , REPID , PHONE , NAME , CUSTID , CREDITLIMIT
, CITY , AREA , ADDRESS) VALUES ( '94061'     , 'CA'
, '7521'                                     , '368-1223'
, 'TKB SPORT SHOP'
, '101'
, '10000'                                    , 'REDWOOD CITY'
, '415'
, '490 BOLI RD.');

INSERT INTO CUSTOMER ( ZIP , STATE , REPID , PHONE , NAME , CUSTID , CREDITLIMIT
, CITY , AREA , ADDRESS) VALUES ( '95133'     , 'CA'
, '7654'                                     , '644-3341'
, 'VOLLYRITE'
, '102'
, '7000'                                     , 'BURLINGAME'
, '415'
, '9722 HAMILTON');

INSERT INTO CUSTOMER ( ZIP , STATE , REPID , PHONE , NAME , CUSTID , CREDITLIMIT
, CITY , AREA , ADDRESS) VALUES ( '97544'     , 'CA'
, '7521'                                     , '677-9312'
, 'JUST TENNIS'
, '103'
, '3000'                                     , 'BURLINGAME'
, '415'
, 'HILLVIEW MALL');

INSERT INTO CUSTOMER ( ZIP , STATE , REPID , PHONE , NAME , CUSTID , CREDITLIMIT
, CITY , AREA , ADDRESS) VALUES ( '93301'     , 'CA'
, '7499'                                     , '996-2323'
, 'EVERY MOUNTAIN'
, '104'
, '10000'                                    , 'CUPERTINO'
, '408'
, '574 SURRY RD.');

INSERT INTO CUSTOMER ( ZIP , STATE , REPID , PHONE , NAME , CUSTID , CREDITLIMIT
, CITY , AREA , ADDRESS) VALUES ( '91003'     , 'CA'
, '7844'                                     , '376-9966'
, 'K + T SPORTS'
, '105'
, '5000'                                     , 'SANTA CLARA'
, '408'
, '3476 EL PASEO');

INSERT INTO CUSTOMER ( ZIP , STATE , REPID , PHONE , NAME , CUSTID , CREDITLIMIT
, CITY , AREA , ADDRESS) VALUES ( '94301'     , 'CA'
, '7521'                                     , '364-9777'
, 'SHAPE UP'
, '106'
, '6000'                                     , 'PALO ALTO'
, '415'
, '908 SEQUOIA');

INSERT INTO CUSTOMER ( ZIP , STATE , REPID , PHONE , NAME , CUSTID , CREDITLIMIT
, CITY , AREA , ADDRESS) VALUES ( '93301'     , 'CA'
, '7499'                                     , '967-4398'
, 'WOMENS SPORTS'
, '107'
, '10000'                                    , 'SUNNYVALE'
, '408'
, 'VALCO VILLAGE');

INSERT INTO PRODUCT ( PRODID , DESCRIP)
VALUES ( '100860'
, 'ACE TENNIS RACKET I');

INSERT INTO PRODUCT ( PRODID , DESCRIP)
VALUES ( '100861'
, 'ACE TENNIS RACKET II');

INSERT INTO PRODUCT ( PRODID , DESCRIP)
VALUES ( '100870'
, 'ACE TENNIS BALLS-3 PACK');

INSERT INTO PRODUCT ( PRODID , DESCRIP)
VALUES ( '100871'
, 'ACE TENNIS BALLS-6 PACK');

INSERT INTO PRODUCT ( PRODID , DESCRIP)
VALUES ( '100890'
, 'ACE TENNIS NET');

INSERT INTO PRODUCT ( PRODID , DESCRIP)
VALUES ( '101860'
, 'SP TENNIS RACKET');

INSERT INTO PRODUCT ( PRODID , DESCRIP)
VALUES ( '101863'
, 'SP JUNIOR RACKET');

INSERT INTO PRODUCT ( PRODID , DESCRIP)
VALUES ( '102130'
, 'RH: "GUIDE TO TENNIS"');

INSERT INTO PRODUCT ( PRODID , DESCRIP)
VALUES ( '200376'
, 'SB ENERGY BAR-6 PACK');

INSERT INTO PRODUCT ( PRODID , DESCRIP)
VALUES ( '200380'
, 'SB VITA SNACK-6 PACK');

CREATE UNIQUE INDEX PRODUCT_INDEX ON PRODUCT  (PRODID);

INSERT INTO SEQ ( TABLENAME , LAST_ID) VALUES ( 'PRODUCT'
, '200380');

INSERT INTO SEQ ( TABLENAME , LAST_ID) VALUES ( 'CUSTOMER'
, '108');

INSERT INTO SEQ ( TABLENAME , LAST_ID) VALUES ( 'ORD'
, '621');

CREATE UNIQUE INDEX SEQ_INDEX ON SEQ  (TABLENAME);

CREATE VIEW SALES AS
SELECT REPID, ORD.CUSTID, CUSTOMER.NAME CUSTNAME, PRODUCT.PRODID,
DESCRIP PRODNAME, SUM(ITEMTOT) AMOUNT
FROM ORD, ITEM, CUSTOMER, PRODUCT
WHERE ORD.ORDID = ITEM.ORDID
AND ORD.CUSTID = CUSTOMER.CUSTID
AND ITEM.PRODID = PRODUCT.PRODID
GROUP BY REPID, ORD.CUSTID, NAME, PRODUCT.PRODID, DESCRIP;

commit;
set termout on
set feedback on
