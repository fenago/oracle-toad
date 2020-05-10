CREATE TABLE ats (
category  VARCHAR2(20),
outval    NUMBER(3),
inval     NUMBER(3));

INSERT INTO ats VALUES ('Groceries', 10, NULL);
INSERT INTO ats VALUES ('Payroll', NULL, 100);
INSERT INTO ats VALUES ('Groceries', 20, NULL);
INSERT INTO ats VALUES ('Payroll', NULL, 200);
INSERT INTO ats VALUES ('Groceries', 30, NULL);
commit;
SELECT * FROM ats;

SELECT category, SUM(NVL2(outval, -outval, inval)) NET
FROM ats
GROUP BY category;
