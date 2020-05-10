/* CREAGENS.QRY
**
** Build and load the interim tables that are used in generating sample 
** data.
** These tables are not part of the database, they are just used for 
** loading the sample data into the database.
**
** Sample data for the entire database is generated in LOADDATA.  
** In LOADDATA the TITLE table is loaded with sample data, all other 
** tables are loaded by doing joins involving these tables.
**

*/


/*    
** If the objects already exist (i.e. if this is a rebuild), drop them.
*/

CREATE OR REPLACE PROCEDURE exec (sql_cmd IN VARCHAR2) IS
	curs_id	INTEGER;
	dummy	INTEGER;
BEGIN
	curs_id := DBMS_SQL.OPEN_CURSOR;
	DBMS_SQL.PARSE(curs_id, sql_cmd, DBMS_SQL.V7);
	dummy := DBMS_SQL.EXECUTE(curs_id);
	DBMS_SQL.CLOSE_CURSOR(curs_id);
END exec;
/
DECLARE
TEMP  	VARCHAR2(5) := 'FALSE';

BEGIN
SELECT 'TRUE' INTO TEMP FROM TAB
WHERE TNAME = 'INTEGER_TABLE';
        if (TEMP = 'TRUE') THEN  
          EXEC('DROP TABLE INTEGER_TABLE');
          EXEC('DROP TABLE LASTNAME_TABLE');
          EXEC('DROP TABLE FIRSTNAME_TABLE');
          EXEC('DROP TABLE STREET_TABLE');
          EXEC('DROP TABLE ADDRESS_TABLE');
          EXEC('DROP TABLE LETTER_TABLE');
          EXEC('DROP TABLE DATE_TABLE');
          EXEC('DROP TABLE LANGUAGE_TABLE');
        END IF;
END;
/


/*  Will have one row each for integers 1 thru 100.  */
/*  Used to generate up to 100 copies of each item.  */
CREATE TABLE integer_table
  (
  MYinteger          NUMBER(5)          NOT NULL
  );
SET PAUSE 'PRESS ANY KEY TO CONTINUE' PAUSE ON;
/*  Will have 26 last names, one each for A - Z.     */
CREATE TABLE lastname_table
  (
  MYinteger          NUMBER(5)          NOT NULL,
  lastname         VARCHAR2(25)       NOT NULL 
  )
;
/*  Will have 26 first names, one each for A - Z.    */
CREATE TABLE firstname_table
  (
  MYinteger          NUMBER(5)          NOT NULL,
  firstname        VARCHAR2(25)       NOT NULL 
  )
;
/*  Will have 26 initials, one each for A - Z.       */
CREATE TABLE letter_table
  (
  MYinteger          NUMBER(5)          NOT NULL,
  letter           VARCHAR2(255)      NOT NULL
  )
;
 /*  Will have 23 streets.                            */
CREATE TABLE street_table
  (
  MYinteger          NUMBER(5)          NOT NULL,
  street           VARCHAR2(25)       NOT NULL
  )
;
/*  Will have 13 city / state / zips                 */
CREATE TABLE address_table
  (
  MYinteger          NUMBER(5)          NOT NULL,
  city             VARCHAR2(25)       NOT NULL,
  state            CHAR(2)            NOT NULL,
  zip              CHAR(7)            NOT NULL
  )
;
/*  Will have 12 dates.                              */
CREATE TABLE date_table
  (
  MYinteger          NUMBER(5)          NOT NULL,
  MYdate             date               NOT NULL
  )
;
/*
** Will have 20 languages.
*/

CREATE TABLE language_table
  (
  MYinteger          NUMBER(5)          NOT NULL,
  descr            VARCHAR2(50)       NOT NULL
  )
;

/*
** Display the result
*/

SELECT Tname
FROM TAB
WHERE TABtype = 'TABLE'
and Tname IN ( 'integer_table',
              'lastname_table',
              'firstname_table',
              'street_table',
              'address_table',
              'letter_table',
              'date_table',
              'language_table' ) 
Order by Tname;
COMMIT;


/*
Load lastname_table.
*/
INSERT INTO lastname_table     VALUES     (   1,   'ANDERSON');
INSERT INTO lastname_table     VALUES     (   2,   'BARR');
INSERT INTO lastname_table     VALUES     (   3,   'CHEN');
INSERT INTO lastname_table     VALUES     (   4,   'DORR');
INSERT INTO lastname_table     VALUES     (   5,   'EFLIN');
INSERT INTO lastname_table     VALUES     (   6,   'FLORINI');
INSERT INTO lastname_table     VALUES     (   7,   'GOHAN');
INSERT INTO lastname_table     VALUES     (   8,   'HAHN');
INSERT INTO lastname_table     VALUES     (   9,   'INFANTE');
INSERT INTO lastname_table     VALUES     (  10,   'JONES');
INSERT INTO lastname_table     VALUES     (  11,   'KAHRMANN');
INSERT INTO lastname_table     VALUES     (  12,   'LING');
INSERT INTO lastname_table     VALUES     (  13,   'MAKAI');
INSERT INTO lastname_table     VALUES     (  14,   'NELSON');
INSERT INTO lastname_table     VALUES     (  15,   'OLPHANT');
INSERT INTO lastname_table     VALUES     (  16,   'PAYNTER');
INSERT INTO lastname_table     VALUES     (  17,   'QUINT');
INSERT INTO lastname_table     VALUES     (  18,   'RYAN');
INSERT INTO lastname_table     VALUES     (  19,   'STEIN');
INSERT INTO lastname_table     VALUES     (  20,   'TOLSKY');
INSERT INTO lastname_table     VALUES     (  21,   'UNAKLET');
INSERT INTO lastname_table     VALUES     (  22,   'VANN');
INSERT INTO lastname_table     VALUES     (  23,   'WOLFMULE');
INSERT INTO lastname_table     VALUES     (  24,   'XAVIER');
INSERT INTO lastname_table     VALUES     (  25,   'YEONG');
INSERT INTO lastname_table     VALUES     (  26,   'ZUCKER');
COMMIT;


/*
Load firstname_table.
*/
INSERT INTO firstname_table    VALUES     (   1,   'ANDREW');
INSERT INTO firstname_table    VALUES     (   2,   'BILL');
INSERT INTO firstname_table    VALUES     (   3,   'CASSANDRA');
INSERT INTO firstname_table    VALUES     (   4,   'DENNIS');
INSERT INTO firstname_table    VALUES     (   5,   'ELLEN');
INSERT INTO firstname_table    VALUES     (   6,   'FRANCES');
INSERT INTO firstname_table    VALUES     (   7,   'GILLBER');
INSERT INTO firstname_table    VALUES     (   8,   'HELLEN');
INSERT INTO firstname_table    VALUES     (   9,   'IMANNA');
INSERT INTO firstname_table    VALUES     (  10,   'JAYNE');
INSERT INTO firstname_table    VALUES     (  11,   'KARL');
INSERT INTO firstname_table    VALUES     (  12,   'LUCY');
INSERT INTO firstname_table    VALUES     (  13,   'MAX');
INSERT INTO firstname_table    VALUES     (  14,   'NELLIE');
INSERT INTO firstname_table    VALUES     (  15,   'ORPAH');
INSERT INTO firstname_table    VALUES     (  16,   'PATRICIA');
INSERT INTO firstname_table    VALUES     (  17,   'QUINTEN');
INSERT INTO firstname_table    VALUES     (  18,   'REDD');
INSERT INTO firstname_table    VALUES     (  19,   'SANDRA');
INSERT INTO firstname_table    VALUES     (  20,   'TAMMY');
INSERT INTO firstname_table    VALUES     (  21,   'UTA');
INSERT INTO firstname_table    VALUES     (  22,   'VINCENT');
INSERT INTO firstname_table    VALUES     (  23,   'WANDA');
INSERT INTO firstname_table    VALUES     (  24,   'XAVIER');
INSERT INTO firstname_table    VALUES     (  25,   'YOLANDA');
INSERT INTO firstname_table    VALUES     (  26,   'ZYLPHA');
COMMIT;


/*
Load letter_table.
*/
INSERT INTO letter_table
    SELECT *
    FROM lastname_table;
COMMIT;


/*
Load street_table.
*/
INSERT INTO street_table    VALUES     (   1,   'APPLE LN.');
INSERT INTO street_table    VALUES     (   2,   'BOWERY ESTATES');
INSERT INTO street_table    VALUES     (   3,   'CANNERY ROW');
INSERT INTO street_table    VALUES     (   4,   'DOGWOOD DR.');
INSERT INTO street_table    VALUES     (   5,   'ELM ST.');
INSERT INTO street_table    VALUES     (   6,   'FILM STAR DR.');
INSERT INTO street_table    VALUES     (   7,   'GOSHEN RD.');
INSERT INTO street_table    VALUES     (   8,   'THE HIGHLANDS');
INSERT INTO street_table    VALUES     (   9,   'IMAGE TYPE WAY');
INSERT INTO street_table    VALUES     (  10,   'JAMES RD.');
INSERT INTO street_table    VALUES     (  11,   'KING ST.');
INSERT INTO street_table    VALUES     (  12,   'LINEAR CURVE');
INSERT INTO street_table    VALUES     (  13,   'MAPLE ST.');
INSERT INTO street_table    VALUES     (  14,   'NEW PIKE RD.');
INSERT INTO street_table    VALUES     (  15,   'OREGON TR.');
INSERT INTO street_table    VALUES     (  16,   'POTHOLE WAY');
INSERT INTO street_table    VALUES     (  17,   'QUEEN ANNE DR.');
INSERT INTO street_table    VALUES     (  18,   'RACE TRACK RD.');
INSERT INTO street_table    VALUES     (  19,   'STONEY WAY');
INSERT INTO street_table    VALUES     (  20,   'TIGHT ROPE RD.');
INSERT INTO street_table    VALUES     (  21,   'UPPER LOWLANDS');
INSERT INTO street_table    VALUES     (  22,   'VIKING VINE LN.');
INSERT INTO street_table    VALUES     (  23,   'WILLOW RD.');
COMMIT;


/*
Load address_table.
*/
INSERT INTO address_table    VALUES     (   1,   'SEATTLE', 'WA', '98124');
INSERT INTO address_table    VALUES     (   2,   'SEATTLE', 'WA', '98022');
INSERT INTO address_table    VALUES     (   3,   'SEATTLE', 'WA', '98102');
INSERT INTO address_table    VALUES     (   4,   'KENT','WA','98206');
INSERT INTO address_table    VALUES     (   5,   'RENTON', 'WA', '98012');
INSERT INTO address_table    VALUES     (   6,   'KIRKLAND', 'WA', '98033');
INSERT INTO address_table    VALUES     (   7,   'REDMOND', 'WA', '98052');
INSERT INTO address_table    VALUES     (   8,   'AUBURN', 'WA', '98007');
INSERT INTO address_table    VALUES     (   9,   'EDMONDS', 'WA', '98136');
INSERT INTO address_table    VALUES     (  10,   'WEST SEATTLE', 'WA','98055');
INSERT INTO address_table    VALUES     (  11,   'LYNNWOOD', 'WA', '98072');
INSERT INTO address_table    VALUES     (  12,   'NOME', 'AK', '97890');
INSERT INTO address_table    VALUES     (  13,   'GRESHAM', 'OR', '99432');
COMMIT;


/*
Load date_table.
*/
INSERT INTO date_table         VALUES     (   1,   '01-JAN-92'  );
INSERT INTO date_table         VALUES     (   2,   '02-FEB-92'  );
INSERT INTO date_table         VALUES     (   3,   '03-MAR-92'  );
INSERT INTO date_table         VALUES     (   4,   '04-APR-92'  );
INSERT INTO date_table         VALUES     (   5,   '05-MAY-92'  );
INSERT INTO date_table         VALUES     (   6,   '06-JUN-92'  );
INSERT INTO date_table         VALUES     (   7,   '07-JUL-92'  );
INSERT INTO date_table         VALUES     (   8,   '08-AUG-92'  );
INSERT INTO date_table         VALUES     (   9,   '09-SEP-92'  );
INSERT INTO date_table         VALUES     (  10,   '10-OCT-92'  );
INSERT INTO date_table         VALUES     (  11,   '11-NOV-92'  );
INSERT INTO date_table         VALUES     (  12,   '12-DEC-92'  );
COMMIT;


/*
Load language_table.
*/
INSERT INTO language_table     VALUES     (  1,   'ARABIC  '  );
INSERT INTO language_table     VALUES     (  2,   'BANTU   '  );
INSERT INTO language_table     VALUES     (  3,   'CHINESE '  );
INSERT INTO language_table     VALUES     (  4,   'DANISH  '  );
INSERT INTO language_table     VALUES     (  5,   'ENGLISH '  );
INSERT INTO language_table     VALUES     (  6,   'FRENCH  '  );
INSERT INTO language_table     VALUES     (  7,   'GERMAN  '  );
INSERT INTO language_table     VALUES     (  8,   'HIROGLPH'  );
INSERT INTO language_table     VALUES     (  9,   'ITALIAN '  );
INSERT INTO language_table     VALUES     ( 10,   'JAPANESE'  );
INSERT INTO language_table     VALUES     ( 11,   'KURDISH '  );
INSERT INTO language_table     VALUES     ( 12,   'LAO     '  );
INSERT INTO language_table     VALUES     ( 13,   'MANX    '  );
INSERT INTO language_table     VALUES     ( 14,   'NEPALESE'  );
INSERT INTO language_table     VALUES     ( 15,   'OMANI   '  );
INSERT INTO language_table     VALUES     ( 16,   'PORTUGUES'  );
INSERT INTO language_table     VALUES     ( 17,   'QUIPISH '  );
INSERT INTO language_table     VALUES     ( 18,   'RUSSIAN '  );
INSERT INTO language_table     VALUES     ( 19,   'SWAHILI '  );
INSERT INTO language_table     VALUES     ( 20,   'TURKISH '  );
COMMIT;

/*
Load integer_table.
*/

INSERT INTO integer_table    VALUES       ( 1);
DECLARE
MAX_INTEGER     NUMBER(5) := 1;
BEGIN
SELECT MAX(MYINTEGER) INTO MAX_INTEGER FROM INTEGER_TABLE;
  WHILE MAX_integer < 100 LOOP 
        INSERT INTO integer_table
      SELECT MYinteger + ( SELECT MAX(MYinteger) FROM integer_table )
      FROM integer_table;
      SELECT MAX(MYINTEGER) INTO MAX_INTEGER FROM INTEGER_TABLE;
    END LOOP;
END;
/
DELETE FROM integer_table
WHERE MYinteger > 100;


SET PAUSE OFF;


/*
Verify results.
*/

SELECT * FROM integer_table;
SELECT * FROM lastname_table;
SELECT * FROM firstname_table;
SELECT * FROM letter_table;
SELECT * FROM street_table;
SELECT * FROM address_table;
SELECT * FROM date_table;
SELECT * FROM language_table;
COMMIT;

@@LOADDATA;

@@CREATAB1;

@@badDATA2;

