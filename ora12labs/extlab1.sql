CREATE TABLE all_objects_xt
    ORGANIZATION EXTERNAL
    (
       TYPE ORACLE_DATAPUMP
       DEFAULT DIRECTORY xt_dir
       LOCATION ( 'all_objects_xt.dmp' )
    )
    AS   
       SELECT *
      FROM   all_objects
/
