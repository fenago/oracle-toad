Rem NAME :      cresummit.sql
Rem
Rem FUNCTION
Rem   Create and populate tables and sequences to support the Summit 
Rem   Sporting Goods business scenario.  This would be used in several 
Rem   Oracle classes and demonstration files.
Rem   The schema of summit is modified to have appropriate names.
Rem   NOTES
Rem 
Rem Created  
Rem     shraman       18/04/99
Rem     

set feedback off
prompt Creating and populating tables and sequences.  Please wait.
spool summit.log
connect summit/summit

DROP TABLE EMPLOYEE CASCADE CONSTRAINTS;
DROP TABLE DEPARTMENT CASCADE CONSTRAINTS;
DROP TABLE REGION CASCADE CONSTRAINTS;
DROP TABLE IMAGE CASCADE CONSTRAINTS;
DROP TABLE PRODUCT CASCADE CONSTRAINTS;
DROP TABLE CUSTOMER CASCADE CONSTRAINTS;
DROP TABLE ORDERS CASCADE CONSTRAINTS;
DROP TABLE ITEM CASCADE CONSTRAINTS;
DROP TABLE INVENTORY CASCADE CONSTRAINTS;
DROP TABLE WAREHOUSE CASCADE CONSTRAINTS;
DROP TABLE LONG_TEXT CASCADE CONSTRAINTS;
DROP TABLE TITLE CASCADE CONSTRAINTS;
DROP FUNCTION GET_PRODUCT_IMAGE;
DROP VIEW EMPLOYEE;

Rem Create sequences.  
Rem    Starting values for sequences begin at the existing maxima for
Rem    existing primary key values, plus increments.

CREATE SEQUENCE CUSTOMER_id
   MINVALUE 1 
   MAXVALUE 9999999 
   INCREMENT BY 1 
   START WITH 216
   NOCACHE 
   NOORDER 
   NOCYCLE;
CREATE SEQUENCE DEPARTMENT_id
   MINVALUE 1 
   MAXVALUE 9999999 
   INCREMENT BY 1 
   START WITH 51
   NOCACHE 
   NOORDER 
   NOCYCLE;
CREATE SEQUENCE EMPLOYEE_id
   MINVALUE 1 
   MAXVALUE 9999999 
   INCREMENT BY 1 
   START WITH 26
   NOCACHE 
   NOORDER 
   NOCYCLE;
CREATE SEQUENCE IMAGE_id
   MINVALUE 1 
   MAXVALUE 9999999 
   INCREMENT BY 1 
   START WITH 1981
   NOCACHE 
   NOORDER 
   NOCYCLE;
CREATE SEQUENCE LONG_TEXT_id
   MINVALUE 1 
   MAXVALUE 9999999 
   INCREMENT BY 1 
   START WITH 1369
   NOCACHE 
   NOORDER 
   NOCYCLE;
CREATE SEQUENCE ORDER_id
   MINVALUE 1 
   MAXVALUE 9999999 
   INCREMENT BY 1 
   START WITH 113
   NOCACHE 
   NOORDER 
   NOCYCLE;
CREATE SEQUENCE PRODUCT_id
   MINVALUE 1 
   MAXVALUE 9999999 
   INCREMENT BY 1 
   START WITH 50537
   NOCACHE 
   NOORDER 
   NOCYCLE;
CREATE SEQUENCE REGION_id
   MINVALUE 1 
   MAXVALUE 9999999 
   INCREMENT BY 1 
   START WITH 6
   NOCACHE 
   NOORDER 
   NOCYCLE;
CREATE SEQUENCE WAREHOUSE_id
   MINVALUE 1 
   MAXVALUE 9999999 
   INCREMENT BY 1 
   START WITH 10502
   NOCACHE 
   NOORDER 
   NOCYCLE;


Rem Create and populate tables.

CREATE TABLE CUSTOMER 
(id                         NUMBER(7) 
   CONSTRAINT CUSTOMER_id_nn NOT NULL,
 name                       VARCHAR2(50) 
   CONSTRAINT CUSTOMER_name_nn NOT NULL,
 phone                      VARCHAR2(25),
 address                    VARCHAR2(400),
 city                       VARCHAR2(30),
 state                      VARCHAR2(20),
 country                    VARCHAR2(30),
 zip_code                   VARCHAR2(75),
 credit_rating              VARCHAR2(9),
 sales_rep_id               NUMBER(7),
 region_id                  NUMBER(7),
 comments                   VARCHAR2(255),
     CONSTRAINT CUSTOMER_id_pk PRIMARY KEY (id),
     CONSTRAINT CUSTOMER_credit_rating_ck
	CHECK (credit_rating IN ('EXCELLENT', 'GOOD', 'POOR')));

INSERT INTO CUSTOMER VALUES (
   201, 'Unisports', '55-2066101',
   '72 Via Bahia', 'Sao Paolo', NULL, 'Brazil', NULL,
   'EXCELLENT', 12, 2, 'Customer usually orders large amounts and has ' ||
   'a high order total.  This is okay as long as the credit rating remains ' ||
   'excellent.');
INSERT INTO CUSTOMER VALUES (
   202, 'Simms Atheletics', '81-20101',
   '6741 Takashi Blvd.', 'Osaka', NULL, 'Japan', NULL,
   'POOR', 14, 4, 'Customer should always pay by cash until his credit ' ||
   'rating improves.');
INSERT INTO CUSTOMER VALUES (
   203, 'Delhi Sports', '91-10351',
   '11368 Chanakya', 'New Delhi', NULL, 'India', NULL,
   'GOOD', 14, 4, 'Customer specializes in baseball equipment and is the ' ||
   'largest retailer in India.');
INSERT INTO CUSTOMER VALUES (
   204, 'Womansport', '1-206-104-0103',
   '281 King Street', 'Seattle', 'Washington', 'USA', '98101',
   'EXCELLENT', 11, 1, NULL);
INSERT INTO CUSTOMER VALUES (
   205, 'Kam''s Sporting Goods', '852-3692888',
   '15 Henessey Road', 'Hong Kong', NULL, NULL, NULL,
   'EXCELLENT', 15, 4, NULL);
INSERT INTO CUSTOMER VALUES (
   206, 'Sportique', '33-2257201',
   '172 Rue de Rivoli', 'Cannes', NULL, 'France', NULL,
   'EXCELLENT', 15, 5, 'Customer specializes in Soccer.  Likes to order ' ||
   'accessories in bright colors.');
INSERT INTO CUSTOMER VALUES (
   207, 'Sweet Rock Sports', '234-6036201',
   '6 Saint Antoine', 'Lagos', NULL, 'Nigeria', NULL,
   'GOOD', NULL, 3, NULL);
INSERT INTO CUSTOMER VALUES (
   208, 'Muench Sports', '49-527454',
   '435 Gruenestrasse', 'Stuttgart', NULL, 'Germany', NULL,
   'GOOD', 15, 5, 'Customer usually pays small orders by cash and ' ||
   'large orders on credit.');
INSERT INTO CUSTOMER VALUES (
   209, 'Beisbol Si!', '809-352689',
   '792 Playa Del Mar', 'San Pedro de Macon''s', NULL, 'Dominican Republic', 
   NULL, 'EXCELLENT', 11, 1, NULL);
INSERT INTO CUSTOMER VALUES (
   210, 'Futbol Sonora', '52-404562',
   '3 Via Saguaro', 'Nogales', NULL, 'Mexico', NULL,
   'EXCELLENT', 12, 2, 'Customer is difficult to reach by phone.  Try mail.');
INSERT INTO CUSTOMER VALUES (
   211, 'Kuhn''s Sports', '42-111292',
   '7 Modrany', 'Prague', NULL, 'Czechoslovakia', NULL,
   'EXCELLENT', 15, 5, NULL);
INSERT INTO CUSTOMER VALUES (
   212, 'Hamada Sport', '20-1209211',
   '57A Corniche', 'Alexandria', NULL, 'Egypt', NULL,
   'EXCELLENT', 13, 3, 'Customer orders sea and water equipment.');
INSERT INTO CUSTOMER VALUES (
   213, 'Big John''s Sports Emporium', '1-415-555-6281',
   '4783 18th Street', 'San Francisco', 'CA', 'USA', '94117',
   'EXCELLENT', 11, 1, 'Customer has a dependable credit record.');
INSERT INTO CUSTOMER VALUES (
   214, 'Ojibway Retail', '1-716-555-7171',
   '415 Main Street', 'Buffalo', 'NY', 'USA', '14202',
   'POOR', 11, 1, NULL);
INSERT INTO CUSTOMER VALUES (
   215, 'Sporta Russia', '7-3892456',
   '6000 Yekatamina', 'Saint Petersburg', NULL, 'Russia', NULL,
   'POOR', 15, 5, 'This customer is very friendly, but has difficulty ' ||
   'paying bills.  Insist upon cash.');
COMMIT;


CREATE TABLE DEPARTMENT 
(id                         NUMBER(7) 
   CONSTRAINT DEPARTMENT_id_nn NOT NULL,
 name                       VARCHAR2(25) 
   CONSTRAINT DEPARTMENT_name_nn NOT NULL,
 region_id                  NUMBER(7),
     CONSTRAINT DEPARTMENT_id_pk PRIMARY KEY (id),
     CONSTRAINT DEPARTMENT_name_region_id_uk UNIQUE (name, region_id));

INSERT INTO DEPARTMENT VALUES (
   10, 'Finance', 1);
INSERT INTO DEPARTMENT VALUES (
   31, 'Sales', 1);
INSERT INTO DEPARTMENT VALUES (
   32, 'Sales', 2);
INSERT INTO DEPARTMENT VALUES (
   33, 'Sales', 3);
INSERT INTO DEPARTMENT VALUES (
   34, 'Sales', 4);
INSERT INTO DEPARTMENT VALUES (
   35, 'Sales', 5);
INSERT INTO DEPARTMENT VALUES (
   41, 'Operations', 1);
INSERT INTO DEPARTMENT VALUES (
   42, 'Operations', 2);
INSERT INTO DEPARTMENT VALUES (
   43, 'Operations', 3);
INSERT INTO DEPARTMENT VALUES (
   44, 'Operations', 4);
INSERT INTO DEPARTMENT VALUES (
   45, 'Operations', 5);
INSERT INTO DEPARTMENT VALUES (
   50, 'Administration', 1);
COMMIT;


CREATE TABLE EMPLOYEE 
(id                         NUMBER(7) 
   CONSTRAINT EMPLOYEE_id_nn NOT NULL,
 last_name                  VARCHAR2(25) 
   CONSTRAINT EMPLOYEE_last_name_nn NOT NULL,
 first_name                 VARCHAR2(25),
 userid                     VARCHAR2(8),
 start_date                 DATE,
 comments                   VARCHAR2(255),
 manager_id                 NUMBER(7),
 title                      VARCHAR2(25),
 dept_id                    NUMBER(7),
 salary                     NUMBER(11, 2),
 commission_pct             NUMBER(4, 2),
     CONSTRAINT EMPLOYEE_id_pk PRIMARY KEY (id),
     CONSTRAINT EMPLOYEE_userid_uk UNIQUE (userid),
     CONSTRAI