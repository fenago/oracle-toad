1. Unfo or rollback uncommitted changes in the database.
2. Provide read consistent views to users of data which is in the
   process of changing.


   Transactions              Rollback segments

       <=16                         4
       <=32                         8
       >32                      #trans/4


