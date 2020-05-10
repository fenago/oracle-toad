

/*
**  Load member, adult, and juvenile.
*/
var  message varchar2(255)   /* check the elapsed time.  */
var  began   varchar2(10)   
SELECT to_char(sysdate) into :began from dual;

                       /*  Adjust the desired number of members here.       */
                       /*  The maximum that noof_members can be is 16,000.  */
var noof_members number
exec :noof_members := 10000;


                       /*  Regardless of the desired number of members,     */
                       /*    they are always inserted in batches that       */
                       /*    are some multiple (@gulp) of 26*26 so as       */
                       /*    to keep the log file from getting too large.   */
                       /*  Member numbers will be consecutive, beginning    */
                       /*    with 1.                                        */
                       /*  One half of the members are then selected as     */
                       /*    adults, and the other half as juveniles.       */
                       /*  The adults are updated with random address info. */
var first number
exec :first := 0;
var last  number
exec :last := 0;
var gulp number
exec :gulp := 13

       
BEGIN
    exec :first := :last + 1
    exec :last  := :last + :gulp
    
                       /*  This is one of the few times you will ever use   */
                       /*  an unrestricted join, otherwise known as a       */
                       /*  cartesian product.                               */

    INSERT member
    SELECT ((letter_table.myinteger-1)*26*26)+((firstname_table.myinteger-1)*26)+lastname_table.integer 
         , lastname_table.lastname 
         , firstname_table.firstname
         , letter_table.letter
         , NULL
    FROM letter_table, firstname_table, lastname_table
    WHERE letter_table.integer between :first and :last

    
    
    INSERT adult
    SELECT member_no
         , ' '
         , ' '
         , ' '
         , ' '
         , NULL
         , sysdate
    FROM member
    WHERE member_no > null((SELECT max(member_no) from adult),0)
    AND member_no%2 = 1

    
    UPDATE adult
    SET street = street_table.street 
      , city  = address_table.city 
      , state = address_table.state
      , zip   = address_table.zip
    FROM adult, street_table, address_table 
    WHERE street_table.myinteger = max(member_no)  + 1
    AND address_table.myinteger = max(member_no) + 1
    AND adult.street = ' '

    
    INSERT juvenile
    SELECT member_no
         , member_no-1
         , birth_date = sysdate 
    FROM member
    WHERE member_no > isnull((SELECT max(member_no) from juvenile),0)
    AND member_no%2 = 0

    
END
GO
DELETE FROM member
WHERE member_no > @noof_members
DELETE FROM adult
WHERE member_no > @noof_members
DELETE FROM juvenile
WHERE member_no > @noof_members


SELECT @message = 'Time (in minutes:seconds) to load Member/Adult/Juvenile.  ' + convert( char(2), datediff(ss,@began,getdate())/60 ) + ':' + convert( char(2), datediff(ss,@began,getdate())%60 )    PRINT @message
GO
    


/*
**  Load title.
*/
                                   /*  Prepare to record the elapsed time.  */
DECLARE @message char(255)  DECLARE @began datetime  SELECT @began = getdate()

                        /*  Title numbers will be consecutive, beginning    */
                        /*    with 1.                                       */

INSERT title    VALUES       ( 1,  'GONE WITH THE WIND',  'MITCHELL, MARGET', NULL)
INSERT title    VALUES       ( 2,  'THE COLOR PURPLE',  'WALKER, ALICE', NULL)
INSERT title    VALUES       ( 3,  'HOTEL',  'HEMSLEY, LORNA', NULL)
INSERT title    VALUES       ( 4,  'THE SECRET LIFE OF MR T.',  'MITTY, WALTER', NULL)
INSERT title    VALUES       ( 5,  'WE',  'LINDBERG, ANNE MORROW', NULL)
INSERT title    VALUES       ( 6,  'SHE',  'HAGGARD, H RYDER', NULL)
INSERT title    VALUES       ( 7,  'THE PROGRAMMERS GUIDE TO WINDOWS',  'DURANT, CARLSON, AND YAO', NULL)
INSERT title    VALUES       ( 8,  'WINNE IL PU',  'MILNE, H H', NULL)
INSERT title    VALUES       ( 9,  'LE ROUGE ET LE NOIR',  'STENDAHL, ANDRE', NULL)
INSERT title    VALUES       (10,  'CIVILIZATION AND ITS DISCONTENTS',  'FREUD, SIGMUND', NULL)
INSERT title    VALUES       (11,  'TOTEM AND TABOO',  'FREUD, SIGMUND', NULL)
INSERT title    VALUES       (12,  'SILAS MARNER',  'ELIOT, GEORGE', NULL)
INSERT title    VALUES       (13,  'LIES AND VIDOETAPES',  'PINNOCHIO', NULL)
INSERT title    VALUES       (14,  'GROUP REPRESENTATIONS IN HILBERT SPACE',  'VINOGRADOV, VALERY', NULL)
INSERT title    VALUES       (15,  'THE SEVEN BUNNYWUNNIES',  'SWEETSTORY, HELEN', NULL)
INSERT title    VALUES       (16,  'THE MYSTERIOUS WITHOUT STYLE',  'HART, GARY', NULL)
INSERT title    VALUES       (17,  'MAN AND SUPERMAN',  'STALLONE, SLY', NULL)
INSERT title    VALUES       (18,  'THE CHOCOLATE SOUFFLES',  'CROCKER, BETTY', NULL)
INSERT title    VALUES       (19,  'CLOCKWORK ORANGE',  'CROCKER, BETTY', NULL)
INSERT title    VALUES       (20,  'BABAR LEARNS C++',  'BRUNHOFF, JEAN', NULL)
INSERT title    VALUES       (21,  'OS/2 PROGRAMMERS REF. I', 'MS PRESS', NULL)
INSERT title    VALUES       (22,  'OS/2 PROGRAMMERS REF. II', 'MS PRESS', NULL)
INSERT title    VALUES       (23,  'OS/2 PROGRAMMERS REF. III', 'MS PRESS', NULL)
INSERT title    VALUES       (24,  'INSIDE OS/2', 'LETWIN, GORDON', NULL)
INSERT title    VALUES       (25,  'C FOR YOURSELF', 'MS PRESS', NULL)
GO

/*
**  Load item.
*/
                /*  Every title (25), every language (20), both covers(2).  */
                /*  Therefore, there will be 1000 items.                    */
                /*  ISBNs will be consecutive, beginning with 1.            */
INSERT item
SELECT ((title.title_no-1)*20)+language_table.integer
     ,   title.title_no
     ,   language_table.descr
     ,   'HARDBACK'
     ,   'Y'
FROM title, language_table
GO
INSERT item
SELECT ((title.title_no-1)*20)+language_table.integer+500
     , title.title_no
     , language_table.descr
     , 'SOFTBACK'
     , 'Y'
FROM title, language_table
                                  /*  Randomly make a small portion of      */
     GO                             /*  the hard cover books non-loanable.    */
UPDATE item
SET loanable = 'N'
WHERE (isbn*title_no)%37 = 0
AND cover = 'HARDBACK'

GO


/*
**  Load copy.
*/
                         /*  Adjust the number of copies here.              */
                         /*  There will be MAX_COPIES copies of each item.  */
                         /*  There are 1000 items in the database.          */
                         /*  The maximum that MAX_COPIES can be is 100.     */
DECLARE @max_copies int
SELECT  @max_copies = 10

INSERT copy
SELECT isbn
     , integer
     , title_no
     , 'N' 
FROM item, integer_table
WHERE integer <= @max_copies

GO
SELECT @message = 'Time (in minutes:seconds) to load Title/Item/Copy.  ' + convert( char(2), datediff(ss,@began,getdate())/60 ) + ':' + convert( char(2), datediff(ss,@began,getdate())%60 )    PRINT @message
GO


/*
**  Randomly loan out twenty percent of the copies.  For performance
**  reasons, first mark the copies as loaned then loan them out.
*/
                                   /*  Prepare to record the elapsed time.  */
DECLARE @message char(255)  DECLARE @began datetime  SELECT @began = getdate()

UPDATE copy
SET on_loan = 'Y'
WHERE (isbn+copy_no)%5  =  CONVERT(int, (RAND() * 5) )
GO
INSERT loan
SELECT isbn
     , copy_no
     , title_no
     , isbn + copy_no
     , dateadd(day, ((isbn*copy_no)%16)-16, GETDATE())
     , dateadd(day, ((isbn*copy_no)%16)-2,  GETDATE())
FROM copy
WHERE on_loan = 'Y'
GO

SELECT @message = 'Time (in minutes:seconds) to load Loan.  ' + convert( char(2), datediff(ss,@began,getdate())/60 ) + ':' + convert( char(2), datediff(ss,@began,getdate())%60 )    PRINT @message
GO    


/*
**  Load reservation.
*/
                                   /*  Prepare to record the elapsed time.  */
DECLARE @message char(255)  DECLARE @began datetime  SELECT @began = getdate()

                    /*  Just a very small percentage of titles and copies.  */
                    /*  For performance reasons, produce a mini-member and  */
                    /*  a mini-item table, and then join these mini tables. */

SELECT member_no
INTO #member
FROM member
WHERE member_no % 31 = 1
GO
SELECT isbn
INTO #item
FROM item
WHERE isbn % 17 = 1
GO
INSERT reservation
SELECT member_no
     , isbn
     , GETDATE()
     , NULL
FROM #member, #item
WHERE member_no % 7 = isbn % 13
GO

SELECT @message = 'Time (in minutes:seconds) to load Reservation.  ' + convert( char(2), datediff(ss,@began,getdate())/60 ) + ':' + convert( char(2), datediff(ss,@began,getdate())%60 )    PRINT @message
GO



/*
**  Load loanhist.
*/

/*  Generate loan history.  Do it by using the current loans as the basis.  */
/*  Since there is an almost complete turnover of loans every two weeks,    */
/*  replicate the Loan table into LoanHist for every two weeks worth of     */
/*  history, changing ISBNs and Member Numbers as you go.  Since the ISBNs  */
/*  have changed, the Title Numbers in LoanHist will have to be resynched.  */
/*  For performance reasons, an index is used.                              */


CREATE UNIQUE CLUSTERED INDEX item_ident ON item (isbn)
GO

                                   /*  Prepare to record the elapsed time.  */
DECLARE @message char(255)  DECLARE @began datetime  SELECT @began = getdate()

                         /*  Adjust the amount of history here.             */
                         /*  The number of loans in LoanHist will be equal  */
                         /*      to the number of rows in the Loan table    */
                         /*      times @max_cycles.  Each 'cycle' equals    */
                         /*      two weeks of loans; or 26 cycles per year. */

DECLARE @max_cycles int    SELECT @max_cycles = 26
DECLARE @cycle int         SELECT @cycle = 1
DECLARE @noof_members int  SELECT @noof_members = (SELECT count(*) FROM member)

WHILE (@cycle <= @max_cycles)
BEGIN
    INSERT loanhist
    SELECT isbn+@cycle
         , copy_no  
         , dateadd(week,-(@cycle*2),out_date)
         , 0          
         , (convert(int,ceiling((rand((isbn*copy_no))*(isbn*copy_no)*10)))%@noof_members)+1
         , dateadd(day, 14, dateadd(week,-(@cycle*2),out_date))
         , dateadd(day, (isbn*copy_no) % 16, dateadd(week,-(@cycle*2),out_date))
         , null
         , null
         , null
         , null
    FROM loan

    UPDATE loanhist 
    SET title_no = item.title_no
    FROM item, loanhist
    WHERE item.isbn = loanhist.isbn
    AND loanhist.title_no = 0

    DUMP TRAN asademo WITH TRUNCATE_ONLY
    
    SELECT @cycle = @cycle + 1
END
    
/*
**  Update the LoanHist table to include fine information for a few loans.
*/

UPDATE loanhist
SET fine_assessed = convert(money,member_no%10)
WHERE (isbn+copy_no)%37 = 0

UPDATE loanhist
SET fine_paid = fine_assessed
WHERE fine_assessed != 0
AND member_no%2 = 0

UPDATE loanhist
SET fine_paid = fine_assessed / ((member_no%9)+1)
WHERE fine_assessed != 0
AND member_no%22 = 0

UPDATE loanhist
SET fine_waived = fine_assessed - fine_paid
WHERE fine_assessed != 0
AND fine_paid != fine_assessed
AND member_no%4 = 0

DUMP TRAN asademo WITH TRUNCATE_ONLY
    
SELECT @message = 'Time (in minutes:seconds) to load LoanHist.  ' + convert( char(2), datediff(ss,@began,getdate())/60 ) + ':' + convert( char(2), datediff(ss,@began,getdate())%60 )    PRINT @message
GO

DROP INDEX  item.item_ident
GO


/*
**  Check for success.
*/




