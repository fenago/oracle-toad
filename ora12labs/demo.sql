create table test (
testcol VARCHAR2(50));

INSERT INTO test VALUES ('abcde');
INSERT INTO test VALUES ('12345');
INSERT INTO test VALUES ('1a4A5');
INSERT INTO test VALUES ('12a45');
INSERT INTO test VALUES ('12aBC');
INSERT INTO test VALUES ('12abc');
INSERT INTO test VALUES ('12ab5');
INSERT INTO test VALUES ('12aa5');
INSERT INTO test VALUES ('12AB5');
INSERT INTO test VALUES ('ABCDE');
INSERT INTO test VALUES ('123-5');
INSERT INTO test VALUES ('12.45');
INSERT INTO test VALUES ('1a4b5');
INSERT INTO test VALUES ('1 3 5');
INSERT INTO test VALUES ('1  45');
INSERT INTO test VALUES ('1   5');
INSERT INTO test VALUES ('a  b  c  d');
INSERT INTO test VALUES ('a b  c   d    e');
INSERT INTO test VALUES ('a              e');
INSERT INTO test VALUES ('Steven');
INSERT INTO test VALUES ('Stephen');
INSERT INTO test VALUES ('111.222.3333');
INSERT INTO test VALUES ('222.333.4444');
INSERT INTO test VALUES ('333.444.5555');
COMMIT;