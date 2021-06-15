DROP TABLE PERSON;
DROP TABLE JOB;
--테이블 및 시퀀스 생성
CREATE TABLE JOB(
    JNO NUMBER(2) PRIMARY KEY,
    JNAME VARCHAR2(30) NOT NULL);
CREATE TABLE PERSON(
    NO NUMBER(4) PRIMARY KEY,
    NAME VARCHAR2(30) NOT NULL,
    JNO NUMBER(2) REFERENCES JOB(JNO) NOT NULL,
    KOR NUMBER(8),
    ENG NUMBER(8),
    MAT NUMBER(8));
DROP SEQUENCE PERSON_NO_SQ;
CREATE SEQUENCE PERSON_NO_SQ MAXVALUE 9999 NOCYCLE NOCACHE;
SELECT * FROM JOB;
INSERT INTO JOB VALUES (10,'배우');
INSERT INTO JOB VALUES (20,'가수');
INSERT INTO JOB VALUES (30,'엠씨');
--1번 쿼리(이름, 직업명, 국, 영, 수 입력 받아 insert
SELECT * FROM PERSON;
delete from person where name='홍홍홍';
INSERT INTO PERSON VALUES (PERSON_NO_SQ.NEXTVAL, '홍길동', (SELECT JNO FROM JOB WHERE JNAME='배우'),100,100,100);
INSERT INTO PERSON VALUES (PERSON_NO_SQ.NEXTVAL, '정우성', (SELECT JNO FROM JOB WHERE JNAME='배우'),90,80,81);
INSERT INTO PERSON VALUES (PERSON_NO_SQ.NEXTVAL, '박세영', (SELECT JNO FROM JOB WHERE JNAME='배우'),80,90,80);
INSERT INTO PERSON VALUES (PERSON_NO_SQ.NEXTVAL, '배수지', (SELECT JNO FROM JOB WHERE JNAME='가수'),20,90,90);
INSERT INTO PERSON VALUES (PERSON_NO_SQ.NEXTVAL, '홍길동', (SELECT JNO FROM JOB WHERE JNAME='가수'),95,95,95);
--2번 쿼리 선택한 직업의 (등수, 이름(번호), 직업명, 국, 영, 수, 총점) 출력 (총점이 큰 순서대로)
SELECT NAME||'('||P.JNO||')' NAMENO, JNAME, KOR, ENG, MAT FROM JOB J, PERSON P WHERE J.JNO=P.JNO ORDER BY KOR+ENG+MAT DESC;
SELECT ROWNUM RANKING, S.*
    FROM (SELECT NAME||'('||P.JNO||')' NAMENO, JNAME, KOR, ENG, MAT, KOR+ENG+MAT ALLSUM FROM JOB J, PERSON P WHERE J.JNO=P.JNO AND JNAME='배우' ORDER BY KOR+ENG+MAT DESC) S;
--3번 쿼리 모든 (등수, 이름(번호), 직업명, 국, 영, 수, 총점) 출력 (총점이 큰 순서대로)
SELECT ROWNUM RANKING, S.*
    FROM (SELECT NAME||'('||P.JNO||')' NAMENO, JNAME, KOR, ENG, MAT, KOR+ENG+MAT ALLSUM FROM JOB J, PERSON P WHERE J.JNO=P.JNO ORDER BY KOR+ENG+MAT DESC) S;
ROLLBACK;
commit;