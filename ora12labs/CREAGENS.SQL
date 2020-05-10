SET SERVEROUTPUT ON
drop table integer_table;
drop table lastname_table;
drop table firstname_table;
drop table letter_table;
drop table street_table;
drop table address_table;
drop table date_table;
drop table language_table;

		 /*  Will have one row each for integers 1 thru 100.  */
		 /*  Used to generate up to 100 copies of each item.  */
CREATE TABLE integer_table
  (
  ainteger          NUMBER(9)          NOT NULL
  );

                 /*  Will have 26 last names, one each for A - Z.     */
CREATE TABLE lastname_table
  (
  ainteger          number(9)          NOT NULL,
  lastname         VARCHAR2(25)       NOT NULL 
  );

                 /*  Will have 26 first names, one each for A - Z.    */
CREATE TABLE firstname_table
  (
  ainteger          number(9)          NOT NULL,
  firstname        VARCHAR2(25)       NOT NULL 
  );

                 /*  Will have 26 initials, one each for A - Z.       */
CREATE TABLE letter_table
  (
  ainteger          number(9)          NOT NULL,
  letter           VARCHAR2(255)      NOT NULL
  );

                 /*  Will have 23 streets.                            */
CREATE TABLE street_table
  (
  ainteger          number(9)          NOT NULL,
  street           VARCHAR2(25)       NOT NULL
  );

                 /*  Will have 13 city / state / zips            */
CREATE TABLE address_table
  (
  ainteger          number(9)          NOT NULL,
  city             VARCHAR2(25)       NOT NULL,
  state            CHAR(2)            NOT NULL,
  zip              CHAR(7)            NOT NULL
  );

                 /*  Will have 12 dates                         */
CREATE TABLE date_table
  (
  ainteger          number(9)          NOT NULL,
  Adate             date               NOT NULL
  );



CREATE TABLE language_table
  (
  ainteger          number(9)          NOT NULL,
  descr            VARCHAR2(50)       NOT NULL
  );



/*
** Display the result
*/

SELECT Tname
FROM TAB
WHERE type = 'T'
and Tname IN ( 'INTEGER_TABLE',
              'LASTNAME_TABLE',
              'FIRSTNAME_TABLE',
              'STREET_TABLE',
              'ADDRESS_TABLE',
              'LETTER_TABLE,
              'DATE_TABLE',
              'LANGUAGE_TABLE' )
Order by Tname;
COMMIT;


/*
Load lastname_table.
*/
INSERt into lastname_table     VALUES     (   1,   'ANDERSON');
INSERt into lastname_table     VALUES     (   2,   'BARR');
INSERt into lastname_table     VALUES     (   3,   'CHEN');
INSERt into lastname_table     VALUES     (   4,   'DORR');
INSERt into lastname_table     VALUES     (   5,   'EFLIN');
INSERt into lastname_table     VALUES     (   6,   'FLORINI');
INSERt into lastname_table     VALUES     (   7,   'GOHAN');
INSERt into lastname_table     VALUES     (   8,   'HAHN');
INSERt into lastname_table     VALUES     (   9,   'INFANTE');
INSERt into lastname_table     VALUES     (  10,   'JONES');
INSERt into lastname_table     VALUES     (  11,   'KAHRMANN');
INSERt into lastname_table     VALUES     (  12,   'LING');
INSERt into lastname_table     VALUES     (  13,   'MAKAI');
INSERt into lastname_table     VALUES     (  14,   'NELSON');
INSERt into lastname_table     VALUES     (  15,   'OLPHANT');
INSERt into lastname_table     VALUES     (  16,   'PAYNTER');
INSERt into lastname_table     VALUES     (  17,   'QUINT');
INSERt into lastname_table     VALUES     (  18,   'RYAN');
INSERt into lastname_table     VALUES     (  19,   'STEIN');
INSERt into lastname_table     VALUES     (  20,   'TOLSKY');
INSERt into lastname_table     VALUES     (  21,   'UNAKLET');
INSERt into lastname_table     VALUES     (  22,   'VANN');
INSERt into lastname_table     VALUES     (  23,   'WOLFMULE');
INSERt into lastname_table     VALUES     (  24,   'XAVIER');
INSERt into lastname_table     VALUES     (  25,   'YEONG');
INSERt into lastname_table     VALUES     (  26,   'ZUCKER');
COMMIT;


/*
Load firstname_table.
*/
insert into firstname_table    VALUES     (   1,   'ANDREW');
insert into firstname_table    VALUES     (   2,   'BILL');
insert into firstname_table    VALUES     (   3,   'CASSANDRA');
insert into firstname_table    VALUES     (   4,   'DENNIS');
insert into firstname_table    VALUES     (   5,   'ELLEN');
insert into firstname_table    VALUES     (   6,   'FRANCES');
insert into firstname_table    VALUES     (   7,   'GILLBER');
insert into firstname_table    VALUES     (   8,   'HELLEN');
insert into firstname_table    VALUES     (   9,   'IMANNA');
insert into firstname_table    VALUES     (  10,   'JAYNE');
insert into firstname_table    VALUES     (  11,   'KARL');
insert into firstname_table    VALUES     (  12,   'LUCY');
insert into firstname_table    VALUES     (  13,   'MAX');
insert into firstname_table    VALUES     (  14,   'NELLIE');
insert into firstname_table    VALUES     (  15,   'ORPAH');
insert into firstname_table    VALUES     (  16,   'PATRICIA');
insert into firstname_table    VALUES     (  17,   'QUINTEN');
insert into firstname_table    VALUES     (  18,   'REDD');
insert into firstname_table    VALUES     (  19,   'SANDRA');
insert into firstname_table    VALUES     (  20,   'TAMMY');
insert into firstname_table    VALUES     (  21,   'UTA');
insert into firstname_table    VALUES     (  22,   'VINCENT');
insert into firstname_table    VALUES     (  23,   'WANDA');
insert into firstname_table    VALUES     (  24,   'XAVIER');
insert into firstname_table    VALUES     (  25,   'YOLANDA');
insert into firstname_table    VALUES     (  26,   'ZYLPHA');
COMMIT;


/*
Load letter_table.
*/
insert into  letter_table
    SELECT *
    FROM lastname_table;
COMMIT;


/*
Load street_table.
*/
insert into street_table    VALUES     (   1,   'APPLE LN.');
insert into street_table    VALUES     (   2,   'BOWERY ESTATES');
insert into street_table    VALUES     (   3,   'CANNERY ROW');
insert into street_table    VALUES     (   4,   'DOGWOOD DR.');
insert into street_table    VALUES     (   5,   'ELM ST.');
insert into street_table    VALUES     (   6,   'FILM STAR DR.');
insert into street_table    VALUES     (   7,   'GOSHEN RD.');
insert into street_table    VALUES     (   8,   'THE HIGHLANDS');
insert into street_table    VALUES     (   9,   'IMAGE TYPE WAY');
insert into street_table    VALUES     (  10,   'JAMES RD.');
insert into street_table    VALUES     (  11,   'KING ST.');
insert into street_table    VALUES     (  12,   'LINEAR CURVE');
insert into street_table    VALUES     (  13,   'MAPLE ST.');
insert into street_table    VALUES     (  14,   'NEW PIKE RD.');
insert into street_table    VALUES     (  15,   'OREGON TR.');
insert into street_table    VALUES     (  16,   'POTHOLE WAY');
insert into street_table    VALUES     (  17,   'QUEEN ANNE DR.');
insert into street_table    VALUES     (  18,   'RACE TRACK RD.');
insert into street_table    VALUES     (  19,   'STONEY WAY');
insert into street_table    VALUES     (  20,   'TIGHT ROPE RD.');
insert into street_table    VALUES     (  21,   'UPPER LOWLANDS');
insert into street_table    VALUES     (  22,   'VIKING VINE LN.');
insert into street_table    VALUES     (  23,   'WILLOW RD.');
COMMIT;


/*
Load address_table.
*/
insert into address_table    VALUES     (   1,   'SEATTLE', 'WA', '98124');
insert into address_table    VALUES     (   2,   'SEATTLE', 'WA', '98022');
insert into address_table    VALUES     (   3,   'SEATTLE', 'WA', '98102');
insert into address_table    VALUES     (   4,   'KENT', 'WA', '98206');
insert into address_table    VALUES     (   5,   'RENTON', 'WA', '98012');
insert into address_table    VALUES     (   6,   'KIRKLAND', 'WA', '98033');
insert into address_table    VALUES     (   7,   'REDMOND', 'WA', '98052');
insert into address_table    VALUES     (   8,   'AUBURN', 'WA', '98007');
insert into address_table    VALUES     (   9,   'EDMONDS', 'WA', '98136');
insert into address_table    VALUES     (  10,   'WEST SEATTLE', 'WA','98055');
insert into address_table    VALUES     (  11,   'LYNNWOOD', 'WA', '98072');
insert into address_table    VALUES     (  12,   'NOME', 'AK', '97890');
insert into address_table    VALUES     (  13,   'GRESHAM', 'OR', '99432');
COMMIT;


/*
Load date_table.
*/
insert into date_table         VALUES     (   1,   '01-FEB-92'  );
insert into date_table         VALUES     (   2,   '02-FEB-92'  );
insert into date_table         VALUES     (   3,   '03-MAR-92'  );
insert into date_table         VALUES     (   4,   '04-APR-92'  );
insert into date_table         VALUES     (   5,   '05-MAY-92'  );
insert into date_table         VALUES     (   6,   '06-JUN-92'  );
insert into date_table         VALUES     (   7,   '07-JUL-92'  );
insert into date_table         VALUES     (   8,   '08-AUG-92'  );
insert into date_table         VALUES     (   9,   '09-SEP-92'  );
insert into date_table         VALUES     (  10,   '10-OCT-92'  );
insert into date_table         VALUES     (  11,   '11-NOV-92'  );
insert into date_table         VALUES     (  12,   '12-DEC-92'  );
COMMIT;


/*
Load language_table.
*/
insert into language_table     VALUES     (  1,   'ARABIC  '  );
INSERt into language_table     VALUES     (  2,   'BANTU   '  );
INSERt into language_table     VALUES     (  3,   'CHINESE '  );
INSERt into language_table     VALUES     (  4,   'DANISH  '  );
INSERt into language_table     VALUES     (  5,   'ENGLISH '  );
INSERt into language_table     VALUES     (  6,   'FRENCH  '  );
INSERt into language_table     VALUES     (  7,   'GERMAN  '  );
INSERt into language_table     VALUES     (  8,   'HIROGLPH'  );
INSERt into language_table     VALUES     (  9,   'ITALIAN '  );
INSERt into language_table     VALUES     ( 10,   'JAPANESE'  );
INSERt into language_table     VALUES     ( 11,   'KURDISH '  );
INSERt into language_table     VALUES     ( 12,   'LAO     '  );
INSERt into language_table     VALUES     ( 13,   'MANX    '  );
INSERt into language_table     VALUES     ( 14,   'NEPALESE'  );
INSERt into language_table     VALUES     ( 15,   'OMANI   '  );
INSERt into language_table     VALUES     ( 16,   'PORTUGUES'  );
INSERt into language_table     VALUES     ( 17,   'QUIPISH '  );
INSERt into language_table     VALUES     ( 18,   'RUSSIAN '  );
INSERt into language_table     VALUES     ( 19,   'SWAHILI '  );
INSERt into language_table     VALUES     ( 20,   'TURKISH '  );
COMMIT;


/*
Load integer_table.
*/



BEGIN
  FOR I IN 1..100000 LOOP
      INSERT INTO INTEGER_TABLE VALUES(I);
      IF MOD(I,1000) = 0 THEN COMMIT;
      END IF;
  END LOOP;
END;
/
COMMIT;
DELETE FROM integer_table
WHERE ainteger > 90000;
COMMIT;




/*
Verify results.
*/

SELECT COUNT(*) FROM integer_table;
SELECT * FROM lastname_table;
SELECT * FROM firstname_table;
SELECT * FROM letter_table;
SELECT * FROM street_table;
SELECT * FROM address_table;
SELECT * FROM date_table;
SELECT * FROM language_table;

set feedback off
set termout off

select /* QueryJFV 1*/
      i.ainteger,
      f.firstname,
      l.lastname,
      l1.letter,
        /*  Will have 23 streets.   
      s.street,   
        /*  Will have 13 city / state / zips  */
      a.city,
      a.state,
      a.zip,
      d.adate,   /*  Will have 12 dates  */
      la.descr
from integer_table i, lastname_table l, firstname_table f, street_table s, 
     address_tablea, letter_table l1, date_table d, language_table la
where i.ainteger = l.ainteger and l.ainteger = f.ainteger;

select  /* JFV 2*/
       b1.bigno,
       b2.bname,
       b2.comments,
       b3.bcomments,
       b3.binteger
from big b1, big2 b2, bigpart b3
where b1.bigno = b2.bigno 
and b1.bigno = b3.bigno 
and b1.bname = b3.bname
and b3.comments NOT like '%TEST%' and b1integer between 5000 and 900000;
 update bigpart
set bname = 'Above the 100000 threshold'
where bigno > 100000;
set feedback on
set termout on
