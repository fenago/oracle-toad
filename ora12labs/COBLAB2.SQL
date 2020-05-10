       IDENTIFICATION DIVISION.                                         00010000
       PROGRAM-ID.  DB2PGM2.                                            00020000
      *                                                                 00030000
      * THIS IS THE SKELETON TO WORKSHOP VII, EMBEDDED SQL PROGRAM.     00040000
      *                                                                 00050000
       ENVIRONMENT DIVISION.                                            00060000
      *                                                                 00070000
       DATA DIVISION.                                                   00080000
      *                                                                 00090000
           EJECT                                                        00100000
       WORKING-STORAGE SECTION.                                         00110000
      *                                                                 00120000
       77  FILLER    PIC X(15) VALUE 'WORKING STORAGE'.                 00130000
       77  LAST-RECORD  PIC X(3) VALUE 'YES'.                           00140000
       01  PRESIDENT-REC.                                               00150000
           10 PR-PRES-NAME            PIC X(20)  VALUE                  00160000
              'KLINGER, MAXWELL    '.                                   00170000
           10 PR-BIRTH-YEAR           PIC 9(04)  VALUE  1920.           00180000
           10 PR-YEARS-SERV           PIC 9(02)  VALUE  4.              00190000
           10 PR-DEATH-AGE            PIC 9(02)  VALUE  0.              00200000
           10 PR-PARTY                PIC X(20)  VALUE                  00210000
               'REPUBLICAN'.                                            00220000
           10 PR-STATE-BORN           PIC X(20)  VALUE                  00230000
               'OHIO'.                                                  00240000
           10 FILLER                  PIC X(11)  VALUE  SPACES.         00250000
       01  ELECTION-REC.                                                00260000
           10 ER-ELECT-YEAR           PIC 9(04)  VALUE  1948.           00270000
           10 ER-CANDIDATE            PIC X(20)  VALUE                  00280000
               'KLINGER, MAXWELL'.                                      00290000
           10 ER-VOTES                PIC 9(03)  VALUE  527.            00300000
           10 ER-WIN-LOSE             PIC X(01)  VALUE  'W'.            00310000
           10 FILLER                  PIC X(51)  VALUE  SPACES.         00320000
      *                                                                 00330000
           EJECT                                                        00730000
       PROCEDURE DIVISION.                                              00740000
      *                                                                 00750000
      *                                                                 00970000
       BEGIN-PROGRAM.                                                   01010000
      *                                                                 01020000
           PERFORM C100-INSERT-PRESIDENT                                01030000
              THRU C100-INSERT-PRESIDENT-EXIT.                          01040000
      *                                                                 01050000
           PERFORM D100-INSERT-ELECTION                                 01060000
              THRU D100-INSERT-ELECTION-EXIT.                           01070000
      *                                                                 01080000
           PERFORM R100-CHANGE-WIN-LOSE                                 01090000
              THRU R100-CHANGE-WIN-LOSE-EXIT.                           01100000
      *                                                                 01110000
           PERFORM S100-CHANGE-DEMOCRAT                                 01120000
              THRU S100-CHANGE-DEMOCRAT-EXIT.                           01130000
      *                                                                 01140000
           PERFORM T100-DELETE-HOSPERS                                  01150000
              THRU T100-DELETE-HOSPERS-EXIT.                            01160000
      *                                                                 01170000
           GOBACK.                                                      01180000
      *                                                                 01190000
      *                                                                 01200000
      *                                                                 01210000
      *                                                                 01220000
      *    THIS SECTION WILL UPDATE THE PRESIDENT TABLE.                01230000
      *                                                                 01240000
      *                                                                 01250000
       C100-INSERT-PRESIDENT.                                           01260000
                                                                        01270000
      *                                                                 01440000
      *                                                                 01450000
      *                                                                 01460000
      *                                                                 01470000
       C100-INSERT-PRESIDENT-EXIT.                                      01480000
           EXIT.                                                        01490000
      *                                                                 01500000
      *                                                                 01510000
      *    THIS SECTION WILL UPDATE THE ELECTION TABLE.                 01520000
      *                                                                 01530000
      *                                                                 01540000
       D100-INSERT-ELECTION.                                            01550000
      *                                                                 01560000
      *                                                                 01570000
      *                                                                 01740000
      *                                                                 01750000
      *                                                                 01760000
      *                                                                 01770000
       D100-INSERT-ELECTION-EXIT.                                       01780000
           EXIT.                                                        01790000
      *                                                                 01800000
      *                                                                 01810000
      *    THIS SECTION WILL MODIFY THE COLUMN                          01820000
      *    WINNER-LOSER-INDIC.                                          01830000
      *                                                                 01840000
      *                                                                 01850000
       R100-CHANGE-WIN-LOSE.                                            01860000
      *                                                                 01870000
                                                                        01880001
                                                                        01890001
                                                                        01900001
                                                                        01910001
                                                                        01920001
       R100-CHANGE-WIN-LOSE-EXIT.                                       02090000
           EXIT.                                                        02100000
       R2000-LOOP-PROCESS SECTION.                                      02110000
      *                                                                 02115000
      *                                                                 02122000
                                                                        02123001
                                                                        02124001
                                                                        02125001
                                                                        02126001
       R2000-LOOP-PROCESS-EXIT.                                         02130000
            EXIT.                                                       02140000
                                                                        02150000
      *                                                                 02160000
       S100-CHANGE-DEMOCRAT.                                            02170000
      *                                                                 02180000
      *                                                                 02350000
      *                                                                 02360000
      *                                                                 02370000
      *                                                                 02380000
      *                                                                 02390000
       S100-CHANGE-DEMOCRAT-EXIT.                                       02400000
           EXIT.                                                        02410000
      *                                                                 02420000
      *                                                                 02430000
      *    THIS SECTION WILL REMOVE J HOSPERS                           02440000
      *    AS A CANDIDATE.                                              02450000
      *                                                                 02460000
      *                                                                 02470000
       T100-DELETE-HOSPERS.                                             02480000
      *                                                                 02490000
      *                                                                 02720000
      *                                                                 02720101
      *                                                                 02720201
      *                                                                 02721001
       T100-DELETE-HOSPERS-EXIT.                                        02730000
           EXIT.                                                        02740000
      *                                                                 02750000
      *                                                                 02760000
      *                                                                 02770000
      **************************** END OF PROGRAM **********************02780000
