/*  In the INIT.ora file place the ARCHIVE LOG START = TRUE                */
/*  Check to see if the database is currently in ARCHIVELOG Mode by:       */
/*  using SQLDBA. Type in ARCHIVE LOG LIST.                                */

/*  STeps to place in ARCHIVELOG:                                          */
/*  1.  Shutdown database                                                  */
/*  2.  Startup up in mount mode                                           */
/*  3.  alter database archivelog;                                         */
/*  4.  alter database open;                                               */
/*  5.  Archive log start;                                                 */
