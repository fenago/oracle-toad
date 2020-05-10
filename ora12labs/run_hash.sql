Enter value for 1: PERS_PERSON_TBL

alter session set hash_area_size=5033164;                                                                                           

Execution Plan
----------------------------------------------------------                                                                          
Plan hash value: 3663659301                                                                                                         
                                                                                                                                    
-------------------------------------------------------------------------------------------------------------                       
| Id  | Operation                             | Name                | Rows  | Bytes | Cost (%CPU)| Time     |                       
-------------------------------------------------------------------------------------------------------------                       
|   0 | SELECT STATEMENT                      |                     |     1 |   117 |   192   (0)| 00:00:03 |                       
|   1 |  SORT AGGREGATE                       |                     |     1 |   117 |            |          |                       
|   2 |   VIEW                                | SYS_DBA_SEGS        |    19 |  2223 |   192   (0)| 00:00:03 |                       
|   3 |    UNION-ALL                          |                     |       |       |            |          |                       
|   4 |     NESTED LOOPS                      |                     |     1 |   132 |   135   (0)| 00:00:02 |                       
|   5 |      NESTED LOOPS OUTER               |                     |     1 |   125 |   134   (0)| 00:00:02 |                       
|   6 |       NESTED LOOPS                    |                     |     1 |   121 |   133   (0)| 00:00:02 |                       
|   7 |        NESTED LOOPS                   |                     |     1 |   115 |   133   (0)| 00:00:02 |                       
|   8 |         NESTED LOOPS                  |                     |     1 |    89 |   132   (0)| 00:00:02 |                       
|   9 |          TABLE ACCESS BY INDEX ROWID  | OBJ$                |     2 |    78 |   110   (0)| 00:00:02 |                       
|* 10 |           INDEX SKIP SCAN             | I_OBJ2              |     2 |       |   108   (0)| 00:00:02 |                       
|* 11 |          VIEW                         | SYS_OBJECTS         |     1 |    50 |    11   (0)| 00:00:01 |                       
|  12 |           UNION ALL PUSHED PREDICATE  |                     |       |       |            |          |                       
|* 13 |            TABLE ACCESS CLUSTER       | TAB$                |     1 |    23 |     2   (0)| 00:00:01 |                       
|* 14 |             INDEX UNIQUE SCAN         | I_OBJ#              |     1 |       |     1   (0)| 00:00:01 |                       
|  15 |            TABLE ACCESS BY INDEX ROWID| TABPART$            |     1 |    16 |     1   (0)| 00:00:01 |                       
|* 16 |             INDEX UNIQUE SCAN         | I_TABPART_OBJ$      |     1 |       |     0   (0)| 00:00:01 |                       
|  17 |            TABLE ACCESS CLUSTER       | CLU$                |     1 |    14 |     2   (0)| 00:00:01 |                       
|* 18 |             INDEX UNIQUE SCAN         | I_OBJ#              |     1 |       |     1   (0)| 00:00:01 |                       
|* 19 |            TABLE ACCESS BY INDEX ROWID| IND$                |     1 |    18 |     2   (0)| 00:00:01 |                       
|* 20 |             INDEX UNIQUE SCAN         | I_IND1              |     1 |       |     1   (0)| 00:00:01 |                       
|  21 |            TABLE ACCESS BY INDEX ROWID| INDPART$            |     1 |    16 |     1   (0)| 00:00:01 |                       
|* 22 |             INDEX UNIQUE SCAN         | I_INDPART_OBJ$      |     1 |       |     0   (0)| 00:00:01 |                       
|* 23 |            TABLE ACCESS BY INDEX ROWID| LOB$                |     1 |    21 |     2   (0)| 00:00:01 |                       
|* 24 |             INDEX UNIQUE SCAN         | I_LOB2              |     1 |       |     1   (0)| 00:00:01 |                       
|  25 |            TABLE ACCESS BY INDEX ROWID| TABSUBPART$         |     1 |    52 |     0   (0)| 00:00:01 |                       
|* 26 |             INDEX UNIQUE SCAN         | I_TABSUBPART$_OBJ$  |     1 |       |     0   (0)| 00:00:01 |                       
|  27 |            TABLE ACCESS BY INDEX ROWID| INDSUBPART$         |     1 |    52 |     0   (0)| 00:00:01 |                       
|* 28 |             INDEX UNIQUE SCAN         | I_INDSUBPART_OBJ$   |     1 |       |     0   (0)| 00:00:01 |                       
|  29 |            TABLE ACCESS BY INDEX ROWID| LOBFRAG$            |     1 |    17 |     1   (0)| 00:00:01 |                       
|* 30 |             INDEX UNIQUE SCAN         | I_LOBFRAG$_FRAGOBJ$ |     1 |       |     0   (0)| 00:00:01 |                       
|* 31 |         TABLE ACCESS CLUSTER          | SEG$                |     1 |    26 |     1   (0)| 00:00:01 |                       
|* 32 |          INDEX UNIQUE SCAN            | I_FILE#_BLOCK#      |     1 |       |     0   (0)| 00:00:01 |                       
|* 33 |        INDEX UNIQUE SCAN              | I_FILE2             |     1 |     6 |     0   (0)| 00:00:01 |                       
|* 34 |       INDEX RANGE SCAN                | I_USER2             |     1 |     4 |     1   (0)| 00:00:01 |                       
|  35 |      TABLE ACCESS CLUSTER             | TS$                 |     1 |     7 |     1   (0)| 00:00:01 |                       
|* 36 |       INDEX UNIQUE SCAN               | I_TS#               |     1 |       |     0   (0)| 00:00:01 |                       
|  37 |     NESTED LOOPS                      |                     |     1 |    83 |     5   (0)| 00:00:01 |                       
|  38 |      NESTED LOOPS OUTER               |                     |     1 |    76 |     4   (0)| 00:00:01 |                       
|  39 |       NESTED LOOPS                    |                     |     1 |    72 |     3   (0)| 00:00:01 |                       
|  40 |        NESTED LOOPS                   |                     |     1 |    43 |     2   (0)| 00:00:01 |                       
|* 41 |         TABLE ACCESS BY INDEX ROWID   | UNDO$               |     1 |    37 |     2   (0)| 00:00:01 |                       
|* 42 |          INDEX RANGE SCAN             | I_UNDO2             |     1 |       |     1   (0)| 00:00:01 |                       
|* 43 |         INDEX UNIQUE SCAN             | I_FILE2             |     1 |     6 |     0   (0)| 00:00:01 |                       
|* 44 |        TABLE ACCESS CLUSTER           | SEG$                |     1 |    29 |     1   (0)| 00:00:01 |                       
|* 45 |         INDEX UNIQUE SCAN             | I_FILE#_BLOCK#      |     1 |       |     0   (0)| 00:00:01 |                       
|* 46 |       INDEX RANGE SCAN                | I_USER2             |     1 |     4 |     1   (0)| 00:00:01 |                       
|  47 |      TABLE ACCESS CLUSTER             | TS$                 |     1 |     7 |     1   (0)| 00:00:01 |                       
|* 48 |       INDEX UNIQUE SCAN               | I_TS#               |     1 |       |     0   (0)| 00:00:01 |                       
|  49 |     NESTED LOOPS                      |                     |    17 |   918 |    52   (0)| 00:00:01 |                       
|  50 |      NESTED LOOPS OUTER               |                     |    17 |   799 |    35   (0)| 00:00:01 |                       
|  51 |       NESTED LOOPS                    |                     |    17 |   731 |    18   (0)| 00:00:01 |                       
|  52 |        TABLE ACCESS FULL              | FILE$               |     8 |    72 |     2   (0)| 00:00:01 |                       
|* 53 |        TABLE ACCESS CLUSTER           | SEG$                |     2 |    68 |     2   (0)| 00:00:01 |                       
|* 54 |         INDEX RANGE SCAN              | I_FILE#_BLOCK#      |     1 |       |     1   (0)| 00:00:01 |                       
|* 55 |       INDEX RANGE SCAN                | I_USER2             |     1 |     4 |     1   (0)| 00:00:01 |                       
|  56 |      TABLE ACCESS CLUSTER             | TS$                 |     1 |     7 |     1   (0)| 00:00:01 |                       
|* 57 |       INDEX UNIQUE SCAN               | I_TS#               |     1 |       |     0   (0)| 00:00:01 |                       
-------------------------------------------------------------------------------------------------------------                       
                                                                                                                                    
Predicate Information (identified by operation id):                                                                                 
---------------------------------------------------                                                                                 
                                                                                                                                    
  10 - access("O"."NAME"='PERS_PERSON_TBL')                                                                                         
       filter("O"."NAME"='PERS_PERSON_TBL')                                                                                         
  11 - filter("O"."TYPE#"="SO"."OBJECT_TYPE_ID")                                                                                    
  13 - filter(BITAND("T"."PROPERTY",1024)=0)                                                                                        
  14 - access("T"."OBJ#"="O"."OBJ#")                                                                                                
  16 - access("TP"."OBJ#"="O"."OBJ#")                                                                                               
  18 - access("C"."OBJ#"="O"."OBJ#")                                                                                                
  19 - filter("I"."TYPE#"=1 OR "I"."TYPE#"=2 OR "I"."TYPE#"=3 OR "I"."TYPE#"=4 OR "I"."TYPE#"=6 OR                                  
              "I"."TYPE#"=7 OR "I"."TYPE#"=8 OR "I"."TYPE#"=9)                                                                      
  20 - access("I"."OBJ#"="O"."OBJ#")                                                                                                
  22 - access("IP"."OBJ#"="O"."OBJ#")                                                                                               
  23 - filter(BITAND("L"."PROPERTY",64)=0 OR BITAND("L"."PROPERTY",128)=128)                                                        
  24 - access("L"."LOBJ#"="O"."OBJ#")                                                                                               
  26 - access("TSP"."OBJ#"="O"."OBJ#")                                                                                              
  28 - access("ISP"."OBJ#"="O"."OBJ#")                                                                                              
  30 - access("LF"."FRAGOBJ#"="O"."OBJ#")                                                                                           
  31 - filter("S"."TYPE#"="SO"."SEGMENT_TYPE_ID")                                                                                   
  32 - access("S"."TS#"="SO"."TS_NUMBER" AND "S"."FILE#"="SO"."HEADER_FILE" AND                                                     
              "S"."BLOCK#"="SO"."HEADER_BLOCK")                                                                                     
  33 - access("S"."TS#"="F"."TS#" AND "S"."FILE#"="F"."RELFILE#")                                                                   
  34 - access("O"."OWNER#"="U"."USER#"(+))                                                                                          
  36 - access("S"."TS#"="TS"."TS#")                                                                                                 
  41 - filter("UN"."STATUS$"<>1)                                                                                                    
  42 - access("UN"."NAME"='PERS_PERSON_TBL')                                                                                        
  43 - access("UN"."TS#"="F"."TS#" AND "UN"."FILE#"="F"."RELFILE#")                                                                 
  44 - filter("S"."TYPE#"=1 OR "S"."TYPE#"=10)                                                                                      
  45 - access("S"."TS#"="UN"."TS#" AND "S"."FILE#"="UN"."FILE#" AND "S"."BLOCK#"="UN"."BLOCK#")                                     
  46 - access("S"."USER#"="U"."USER#"(+))                                                                                           
  48 - access("S"."TS#"="TS"."TS#")                                                                                                 
  53 - filter("S"."TYPE#"<>6 AND "S"."TYPE#"<>5 AND "S"."TYPE#"<>8 AND "S"."TYPE#"<>10 AND                                          
              "S"."TYPE#"<>1)                                                                                                       
  54 - access("S"."TS#"="F"."TS#" AND "S"."FILE#"="F"."RELFILE#")                                                                   
       filter(TO_CHAR("F"."FILE#")||'.'||TO_CHAR("S"."BLOCK#")='PERS_PERSON_TBL')                                                   
  55 - access("S"."USER#"="U"."USER#"(+))                                                                                           
  57 - access("S"."TS#"="TS"."TS#")                                                                                                 


Statistics
----------------------------------------------------------                                                                          
         22  recursive calls                                                                                                        
          0  db block gets                                                                                                          
        113  consistent gets                                                                                                        
          6  physical reads                                                                                                         
          0  redo size                                                                                                              
        617  bytes sent via SQL*Net to client                                                                                       
        520  bytes received via SQL*Net from client                                                                                 
          2  SQL*Net roundtrips to/from client                                                                                      
          0  sorts (memory)                                                                                                         
          0  sorts (disk)                                                                                                           
          1  rows processed                                                                                                         

