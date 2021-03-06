--------------------------------------------------------
--  File created - Friday-March-16-2012   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table STFHISTORY
--------------------------------------------------------

  CREATE TABLE "COMP"."STFHISTORY" 
   (	"DCN" VARCHAR2(5 BYTE), 
	"SEQ" NUMBER(5,0), 
	"PM" VARCHAR2(3 BYTE), 
	"SOF" VARCHAR2(1 BYTE), 
	"FY" VARCHAR2(4 BYTE), 
	"APPN" VARCHAR2(4 BYTE), 
	"AMSCO" VARCHAR2(8 BYTE), 
	"EOR" VARCHAR2(4 BYTE), 
	"RE_SOURCE" VARCHAR2(3 BYTE), 
	"REF" VARCHAR2(14 BYTE), 
	"UIC" VARCHAR2(5 BYTE), 
	"TYPE_DUTY" VARCHAR2(3 BYTE), 
	"TYPE_TRANS" VARCHAR2(2 BYTE), 
	"AMOUNT" NUMBER(12,2), 
	"DATE_ENTERED" NUMBER(8,0), 
	"SSN_5" NUMBER(5,0), 
	"END_DT" NUMBER(6,0), 
	"DOV_NR" VARCHAR2(6 BYTE), 
	"DOV_DATE" NUMBER(3,0), 
	"TL_NBR" VARCHAR2(5 BYTE), 
	"DSSN" NUMBER(4,0), 
	"PRN" VARCHAR2(3 BYTE), 
	"SUPPLEMENTAL" VARCHAR2(1 BYTE), 
	"DUE_DATE" NUMBER(8,0), 
	"WRITE_OFF" VARCHAR2(1 BYTE), 
	"AUDIT_CODE" VARCHAR2(1 BYTE), 
	"RESCHEDULED" VARCHAR2(1 BYTE), 
	"RECV_BILL" VARCHAR2(5 BYTE), 
	"LIMIT" VARCHAR2(4 BYTE), 
	"UNIT_PRICE" NUMBER(11,2), 
	"QUANTITY" NUMBER(6,0), 
	"BILL_NR" VARCHAR2(5 BYTE), 
	"DODAC_BUY" VARCHAR2(6 BYTE), 
	"DODAC_SELL" VARCHAR2(6 BYTE), 
	"UNIT_ISSUE" VARCHAR2(2 BYTE), 
	"RIC" VARCHAR2(3 BYTE), 
	"ADVICE" VARCHAR2(2 BYTE), 
	"NSN" VARCHAR2(13 BYTE), 
	"UNFILL" VARCHAR2(1 BYTE), 
	"MILSTRIP" VARCHAR2(1 BYTE), 
	"YYMM_OBLGATE" NUMBER(6,0), 
	"FINAL" VARCHAR2(1 BYTE), 
	"WIG" VARCHAR2(1 BYTE), 
	"WITHDRAW" VARCHAR2(2 BYTE), 
	"EIC" VARCHAR2(2 BYTE), 
	"ORDER_NBR" VARCHAR2(6 BYTE), 
	"START_DATE" DATE, 
	"END_DATE" DATE, 
	"MAN_DAYS" NUMBER(4,0), 
	"NBR_PERS" NUMBER(6,0), 
	"SSN" VARCHAR2(9 BYTE), 
	"CIV_GRC" VARCHAR2(2 BYTE), 
	"CIV_MAN_HRS" NUMBER(7,0), 
	"CROSS_REF" VARCHAR2(14 BYTE), 
	"STATUS" VARCHAR2(2 BYTE), 
	"TYPE_DISBURSEMENT" VARCHAR2(1 BYTE), 
	"OA" VARCHAR2(2 BYTE), 
	"PROJ_CODES" VARCHAR2(3 BYTE), 
	"MDEP" VARCHAR2(4 BYTE), 
	"FCA" VARCHAR2(5 BYTE), 
	"PY" VARCHAR2(4 BYTE), 
	"DATE_TM_CREATED" VARCHAR2(14 BYTE), 
	"APC" VARCHAR2(4 BYTE), 
	"NAME" VARCHAR2(22 BYTE), 
	"DATE_TM_SENT" VARCHAR2(14 BYTE), 
	"BLK_NBR" VARCHAR2(11 BYTE), 
	"CUSTOMER_NBR" VARCHAR2(6 BYTE), 
	"PC_CONTRACT_NBR" VARCHAR2(16 BYTE), 
	"PC_MOD_NBR" VARCHAR2(6 BYTE), 
	"PC_VENDOR_NAME" VARCHAR2(30 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 2356936704 NEXT 65536 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "COMP_1" ;
--------------------------------------------------------
--  DDL for Index STFHIST_SSN_IDX
--------------------------------------------------------

  CREATE INDEX "COMP"."STFHIST_SSN_IDX" ON "COMP"."STFHISTORY" ("SSN") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 176160768 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "COMPINDEX" ;
--------------------------------------------------------
--  DDL for Index STFHIST_FY_IDX
--------------------------------------------------------

  CREATE INDEX "COMP"."STFHIST_FY_IDX" ON "COMP"."STFHISTORY" ("FY", "TYPE_DUTY", "AMSCO", "FCA", "TYPE_TRANS", "APPN") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 452984832 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "COMPINDEX" ;
--------------------------------------------------------
--  DDL for Index STFHIST_REF_IDX
--------------------------------------------------------

  CREATE INDEX "COMP"."STFHIST_REF_IDX" ON "COMP"."STFHISTORY" ("REF", "EOR", "AMSCO", "APPN", "FY", "SOF", "TYPE_TRANS", "MILSTRIP") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 704643072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "COMPINDEX" ;
--------------------------------------------------------
--  DDL for Index STFHIST_SOF_IDX
--------------------------------------------------------

  CREATE INDEX "COMP"."STFHIST_SOF_IDX" ON "COMP"."STFHISTORY" ("SOF", "FY", "APPN", "REF", "TYPE_TRANS") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 494927872 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "COMPINDEX" ;
--------------------------------------------------------
--  DDL for Index STFHIST_ORDNR_IDX
--------------------------------------------------------

  CREATE INDEX "COMP"."STFHIST_ORDNR_IDX" ON "COMP"."STFHISTORY" ("ORDER_NBR") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 32505856 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "COMPINDEX" ;
--------------------------------------------------------
--  DDL for Index STFHIST_APC_IDX
--------------------------------------------------------

  CREATE INDEX "COMP"."STFHIST_APC_IDX" ON "COMP"."STFHISTORY" ("APC") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 192937984 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "COMPINDEX" ;
--------------------------------------------------------
--  DDL for Index STFHIST_TM_IDX
--------------------------------------------------------

  CREATE INDEX "COMP"."STFHIST_TM_IDX" ON "COMP"."STFHISTORY" ("DATE_TM_CREATED") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 293601280 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "COMPINDEX" ;
--------------------------------------------------------
--  DDL for Index STFHIST_IMAP1_IDX
--------------------------------------------------------

  CREATE INDEX "COMP"."STFHIST_IMAP1_IDX" ON "COMP"."STFHISTORY" ("DCN", "SEQ") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 192937984 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "COMPINDEX" ;
--------------------------------------------------------
--  DDL for Index STFHIST_IMAP2_IDX
--------------------------------------------------------

  CREATE INDEX "COMP"."STFHIST_IMAP2_IDX" ON "COMP"."STFHISTORY" ("NSN", "REF", "FY", "APC", "DODAC_BUY", "EOR") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 545259520 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "COMPINDEX" ;
--------------------------------------------------------
--  DDL for Index STFHIST_PM_IDX
--------------------------------------------------------

  CREATE INDEX "COMP"."STFHIST_PM_IDX" ON "COMP"."STFHISTORY" ("PM", "SOF", "FY", "APPN", "AMSCO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 427819008 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "COMPINDEX" ;
--------------------------------------------------------
--  Constraints for Table STFHISTORY
--------------------------------------------------------

  ALTER TABLE "COMP"."STFHISTORY" MODIFY ("DCN" NOT NULL ENABLE);
 
  ALTER TABLE "COMP"."STFHISTORY" MODIFY ("SEQ" NOT NULL ENABLE);

