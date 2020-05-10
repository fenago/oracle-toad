
INSERT INTO title    VALUES       ( 1,  'GONE WITH THE WIND',  'MITCHELL, MARGET', NULL);
INSERT INTO title    VALUES       ( 2,  'THE COLOR PURPLE',  'WALKER, ALICE', NULL);
INSERT INTO title    VALUES       ( 3,  'HOTEL',  'HEMSLEY, LORNA', NULL);
INSERT INTO title    VALUES       ( 4,  'THE SECRET LIFE OF MR T.',  'MITTY, WALTER', NULL);
INSERT INTO title    VALUES       ( 5,  'WE',  'LINDBERG, ANNE MORROW', NULL);
INSERT INTO title    VALUES       ( 6,  'SHE',  'HAGGARD, H RYDER', NULL);
INSERT INTO title    VALUES       ( 7,  'THE PROGRAMMERS GUIDE TO WINDOWS',  'DURANT, CARLSON, AND YAO', NULL);
INSERT INTO title    VALUES       ( 8,  'WINNE IL PU',  'MILNE, H H', NULL);
INSERT INTO title    VALUES       ( 9,  'LE ROUGE ET LE NOIR',  'STENDAHL, ANDRE', NULL);
INSERT INTO title    VALUES       (10,  'CIVILIZATION AND ITS DISCONTENTS',  'FREUD, SIGMUND', NULL);
INSERT INTO title    VALUES       (11,  'TOTEM AND TABOO',  'FREUD, SIGMUND', NULL);
INSERT INTO title    VALUES       (12,  'SILAS MARNER',  'ELIOT, GEORGE', NULL);
INSERT INTO title    VALUES       (13,  'LIES AND VIDOETAPES',  'PINNOCHIO', NULL);
INSERT INTO title    VALUES       (14,  'GROUP REPRESENTATIONS IN HILBERT SPACE',  'VINOGRADOV, VALERY', NULL);
INSERT INTO title    VALUES       (15,  'THE SEVEN BUNNYWUNNIES',  'SWEETSTORY, HELEN', NULL);
INSERT INTO title    VALUES       (16,  'THE MYSTERIOUS WITHOUT STYLE',  'HART, GARY', NULL);
INSERT INTO title    VALUES       (17,  'MAN AND SUPERMAN',  'STALLONE, SLY', NULL);
INSERT INTO title    VALUES       (18,  'THE CHOCOLATE SOUFFLES',  'CROCKER, BETTY', NULL);
INSERT INTO title    VALUES       (19,  'CLOCKWORK ORANGE',  'CROCKER, BETTY', NULL);
INSERT INTO title    VALUES       (20,  'BABAR LEARNS C++',  'BRUNHOFF, JEAN', NULL);
INSERT INTO title    VALUES       (21,  'OS/2 PROGRAMMERS REF. I', 'MS PRESS', NULL);
INSERT INTO title    VALUES       (22,  'OS/2 PROGRAMMERS REF. II', 'MS PRESS', NULL);
INSERT INTO title    VALUES       (23,  'OS/2 PROGRAMMERS REF. III', 'MS PRESS', NULL);
INSERT INTO title    VALUES       (24,  'INSIDE OS/2', 'LETWIN, GORDON', NULL);
INSERT INTO title    VALUES       (25,  'C FOR YOURSELF', 'MS PRESS', NULL);


/*
**  Load item.
*/
 /*  Every title (25), every language (20), both covers(2).  */
 /*  Therefore, there will be 1000 items.                    */
 /*  ISBNs will be consecutive, beginning with 1.            */
INSERT INTO item
SELECT ((title.title_no-1)*20)+language_table.Ainteger
     ,   title.title_no
     ,   language_table.descr
     ,   'HARDBACK'
     ,   'Y'
FROM title, language_table;
COMMIT;
INSERT INTO item
SELECT ((title.title_no-1)*20)+language_table.Ainteger+500
     , title.title_no
     , language_table.descr
     , 'SOFTBACK'
     , 'Y'
FROM title, language_table;
     /*  Randomly make a small portion of      */
     /*  the hard cover books non-loanable.    */
UPDATE item
SET loanable = 'N'
WHERE (isbn*title_no) = 0
AND cover = 'HARDBACK';

COMMIT;


/*
**  Load copy.
*/
    /*  Adjust the number of copies here.              */
   /*  There will be MAX_COPIES copies of each item.  */
   /*  There are 1000 items in the database.          */
   /*  The maximum that MAX_COPIES can be is 100.     */
VAR max_copies NUMBER;
EXEC :max_copies := 5;

INSERT INTO copy
SELECT isbn
     , Ainteger
     , title_no
     , 'N' 
FROM item, integer_table
WHERE Ainteger <= :max_copies;


/*
**  Randomly loan out twenty percent of the copies.  For performance
**  reasons, first mark the copies as loaned then loan them out.
*/
  /*  Prepare to record the elapsed time.  */

UPDATE copy
SET on_loan = 'Y'
WHERE (isbn+copy_no)  in(1,2, 4, 5);

INSERT INTO loan
SELECT isbn
     , copy_no
     , title_no
     , isbn + copy_no
     , SYSDATE
     , SYSDATE
FROM copy
WHERE on_loan = 'Y';


/*
**  Load reservation.
*/
 
                    /*  For performance reasons, produce a mini-member and  */
                    /*  a mini-item table, and then join these mini tables. */
VAR MEMBER NUMBER;
SELECT member_no
INTO :member
FROM member
WHERE member_no = 1;

VAR ITEM NUMBER;
SELECT isbn
INTO :item
FROM item
WHERE isbn = 1;

INSERT INTO reservation
SELECT member_no
     , isbn
     , SYSDATE
     , NULL
FROM member, item
WHERE member_no = isbn;


/*
**  Load loanhist.
*/

/*  Generate loan history.  Do it by using the current loans as the basis.  */
/*  Since there is an almost complete turnover of loans every two weeks,    */
/*  replicate the Loan table into LoanHist for every two weeks worth of     */
/*  history, changing ISBNs and Member Numbers as you go.  Since the ISBNs  */
/*  have changed, the Title Numbers in LoanHist will have to be resynched.  */
/*  For performance reasons, an index is used.                              */


VAR max_cycles NUMBER
EXEC :max_cycles := 26;
VAR Cycle NUMBER
EXEC :cycle := 1;


BEGIN
WHILE :cycle <= :max_cycles LOOP
    INSERT INTO loanhist
    SELECT isbn+:cycle
         , copy_no  
         , SYSDATE
         , 0          
         , 8788+1
         , SYSDATE
         , SYSDATE + 30
         , null
         , null
         , null
         , null
    FROM loan;
   :cycle := :cycle + 1;
  END LOOP;
END;
/
    UPDATE loanhist 
    SET title_no = 500
    ;

        
/*
**  Update the LoanHist table to include fine information for a few loans.
*/

UPDATE loanhist
SET fine_assessed = 5.00
WHERE copy_no BETWEEN 1 AND 10;
COMMIT;
UPDATE loanhist
SET fine_paid = fine_assessed
WHERE fine_assessed != 0
AND member_no = 0;
COMMIT;
UPDATE loanhist
SET fine_paid = fine_assessed / (member_no+1)
WHERE fine_assessed != 0
AND member_no >= 0;

UPDATE loanhist
SET fine_waived = fine_assessed - fine_paid
WHERE fine_assessed != 0
AND fine_paid != fine_assessed
AND member_no >= 0;
/