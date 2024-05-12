CREATE SEQUENCE community_seq
    START WITH 8
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
   
   
   CREATE SEQUENCE report_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE TABLE COMMUNITY (
    COMMUNITYNO NUMBER PRIMARY KEY,
    ID_EMAIL VARCHAR2(100) NOT NULL,
    title VARCHAR2(50) NOT NULL,
    CContent VARCHAR2(4000) NOT NULL,
    writtenDate DATE NOT NULL
);

CREATE TABLE REPORT (
    REPORTNO NUMBER PRIMARY KEY,
    victimID varchar2(50) NOT NULL,
    offenderID varchar2(50) NOT NULL,
    reportReason varchar2(100) NOT NULL,
    reportDate DATE NOT NULL,
    COMMUNITYNO NUMBER,
    chatno NUMBER
  );

ALTER TABLE REPORT DROP CONSTRAINT fk_COMMUNITYNO;

DROP  TABLE COMMUNITY;

DROP  TABLE REPORT;

DROP SEQUENCE community_seq;

DROP SEQUENCE report_seq;

SELECT * FROM community;

SELECT COMMUNITYNO, c.ID_EMAIL, title, CCONTENT, WRITTENDATE, name FROM community c left join memberjsw m on c.id_email=m.id_email ORDER BY COMMUNITYNO;




SELECT *\r\n" + "FROM Community\r\n" + "WHERE category LIKE ?\r\n"
				+ "AND title LIKE ?  order by writtendate";

SELECT * FROM report;

INSERT INTO COMMUNITY (COMMUNITYNO,ID_EMAIL,title,CContent,writtenDate) VALUES(community_seq.nextval,'godls@naver.com','놀아요','놀자',sysdate);

INSERT INTO PRODUCT (pno, CATEGORY, TITLE, price, PCONTENT, TRANSACTIONMETHOD, TRANSACTIONLOCATION,WRITTENDATE, PAVAILABLE) VALUES(product_seq.nextval, '운동기구', '사주세요', 3000, '운동기구 사주세요', '직거래', '강남구', sysdate, 1); 