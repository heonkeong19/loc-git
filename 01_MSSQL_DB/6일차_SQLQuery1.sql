CREATE TABLE CUSTOMER(
	CUST_CD		NVARCHAR(10)		NOT NULL, 
	CUST_NM		NVARCHAR(20)		NOT NULL,
	CUST_AGE	INT				DEFAULT 0,
	CUST_LVL	NVARCHAR(10),
	CUST_JOB	NVARCHAR(20),	
	CUST_POINT	INT				DEFAULT 0,
	PRIMARY KEY(CUST_CD),
	CHECK(CUST_AGE <=60)
);

CREATE TABLE PRODUCTS(
		PROD_CD		NVARCHAR(10)		NOT NULL,
		PROD_NM		NVARCHAR(20)		NOT NULL,
		PROD_QY		INT				DEFAULT 0,
		PROD_PRI	DECIMAL(18,4)	DEFAULT 0,
		PROD_VEND	NVARCHAR(20),
		PRIMARY KEY(PROD_CD),
		CHECK(PROD_QY>=0 AND PROD_QY<=10000)
	);


CREATE TABLE ORDERS(
	ORD_CD		NVARCHAR(10)		NOT NULL,
	CUST_CD		NVARCHAR(10),
	PROD_CD		NVARCHAR(10),
	ORDER_QTY	INT,
	ORDER_ADD	NVARCHAR(20),
	ORDER_REGDT	DATETIME		DEFAULT	GETDATE(),
	FOREIGN KEY(CUST_CD)	REFERENCES CUSTOMER(CUST_CD),
	FOREIGN KEY(PROD_CD)	REFERENCES PRODUCTS(PROD_CD)
);

--NVARCHAR 다국어지원 할 거면. 어떤 문자든 2바이트로 저장
--VARCHAR 영어 1바이트, 한글 2바이트로 저장

INSERT INTO CUSTOMER(
	CUST_CD, 
	CUST_NM,
	CUST_AGE,
	CUST_LVL,
	CUST_JOB,	
	CUST_POINT)
VALUES
('APPLE', '정소화', 20, 'GOLD', '학생', 1000),
('BANANA', '김선우', 25, 'VIP', '간호사', 2500),
('CARROT', '고명석', 28, 'GOLD', '교사', 4500),
('ORANGE', '김용욱', 22, 'SILVER', '학생', ''),
('MELON', '성원용', 35, 'GOLD', '회사원', 5000),
('PEACH', '오형준','', 'SILVER', '의사', 300),
('PEAR', '채광준', 31, 'SILVER', '회사원', 500);

INSERT INTO PRODUCTS(
	PROD_CD,
	PROD_NM,
	PROD_QY,
	PROD_PRI,
	PROD_VEND)
VALUES
('P01', '그냥만두', 5000, 4500, '대한식품'),
('P02', '매운쫄면', 2500, 5500, '민국푸드'),
('P03', '쿵떡파이', 3600, 2600, '한빛제과'),
('P04', '맛난초콜릿', 1250, 2500, '한빛제과'),
('P05', '얼큰라면', 2200, 1200, '대한식품'),
('P06', '통통우동', 1000, 1550, '민국푸드'),
('P07', '달콤비스킷', 1650, 1500, '한빛제과');


INSERT INTO ORDERS(
	ORD_CD,
	CUST_CD,
	PROD_CD,
	ORDER_QTY,
	ORDER_ADD,
	ORDER_REGDT)
VALUES
('O61', 'APPLE', 'P30', 10, '서울시 마포구', '2019-01-01'),
('O62', 'APPLE', 'P31', 5, '인천시 계양구', '2019-01-10'),
('O63', 'BANANA', 'P36', 45, '경기도 부천시', '2019-01-11'),
('O64', 'CARROT', 'P32', 8, '부산시 금정구', '2019-02-01'),
('O65', 'BANANA', 'P26', 36, '경기도 용인시', '2019-02-20'),
('O66', 'BANANA', 'P41', 19, '충청북도 보은군', '2019-03-02'),
('O67', 'APPLE', 'P43', 22, '서울시 영등포구', '2019-03-15'),
('O68', 'PEAR', 'P33', 50, '강원도 춘천시', '2019-04-10'),
('O69', 'BANANA', 'P24', 15, '전라남도 목포시', '2019-04-11'),
('O70', 'CARROT', 'P33', 20, '경기도 안양시', '');

SELECT PROD_CD, PROD_PRI 가격
FROM PRODUCTS

SELECT PROD_NM, PROD_PRI+500 조정단가
FROM PRODUCTS

SELECT PROD_CD, ORDER_QTY, ORDER_REGDT
FROM ORDERS
WHERE CUST_CD = 'APPLE' AND ORDER_QTY>=15;

SELECT CUST_NM, CUST_AGE, CUST_LVL, CUST_POINT
FROM CUSTOMER
WHERE CUST_NM LIKE '_용%';

SELECT CUST_CD, CUST_NM, CUST_LVL
FROM CUSTOMER
WHERE CUST_CD LIKE '_____';

SELECT *
FROM ORDERS

INSERT INTO CUSTOMER
VALUES('PRIMARY', '김선우')

--FK 제약조건으로 묶이는 경우에 CHECK 조건 추가가 불가능인 건가?
--가능
 ALTER TABLE PRODUCTS ADD CONSTRAINT PRI_LIM CHECK(PROD_PRI<=10000)

/*
근데 이 프로그램은 커밋 롤백 개념이 없는 건가?
있는데 그거는 최고관리자만 가지고 있고 최고관리자가 권한을 부여하는 식으로 진행됨.
커밋이랑 롤백은 개별 데이터베이스에서는 그냥 자동으로 진행되는 것인 듯.
*/

--숫자로 가져오기 가능? 숫자로 가져오는 건 오더 바이를 할 때 속성명 써두고 그거에 숫자를 부여해서 가져오기만 가능
--데이터 처음에 가져올 때는 입력해야 함.
SELECT CUST_CD, CUST_AGE, *
FROM CUSTOMER



INSERT INTO CUSTOMER
VALUES
('FROZEN', '김하늬', 29, 'GOLD', '직장인', 6600),
('DIOR', '이유리', '', '', '', '');

INSERT INTO CUSTOMER(CUST_CD, CUST_NM)
VALUES('MORGEN', '호수')

SELECT *
FROM CUSTOMER

--널이 나왔으면 좋겠는데 어떻게 하는지를 모르것네
--컬럼명 NOT NULL 2개만 셀렉해서 INSERT INTO 구문에 넣고 VALUES에 값 넣고 그외 입력 안 하면 NULL값 설정
--즉, 내가 알고 있는 속성만 입력하면 되는 듯.

SELECT PROD_VEND, COUNT(DISTINCT PROD_VEND) COUNT_VEND
FROM PRODUCTS
GROUP BY PROD_VEND

SELECT *
FROM ORDERS

SELECT *
FROM PRODUCTS

SELECT PROD_VEND, COUNT(*) AS PROD_COUTN, MAX(PROD_PRI) AS MAX_PRICE
FROM PRODUCTS
GROUP BY PROD_VEND HAVING COUNT(*) >=3;

SELECT CUST_LVL, COUNT(*) AS CUST_COUNT, AVG(CUST_POINT) AS AVG_POINT
FROM CUSTOMER
GROUP BY CUST_LVL HAVING AVG(CUST_POINT) >=1000;

--내가 하고 싶은 거: PROD_CD, PROD_NM, ORDER_QTY를 가져오는데 PROD_NM별로 보여주기

SELECT O.PROD_CD, P.PROD_NM, SUM(O.ORDER_QTY) AS TOTAL
FROM ORDERS O
LEFT OUTER JOIN PRODUCTS P
ON O.PROD_CD = P.PROD_CD
GROUP BY O.PROD_CD, P.PROD_NM
--GROUP BY절에는 집계함수 외를 다 써줘야 나온다. 조인 시

SELECT * FROM CUSTOMER
SELECT * FROM PRODUCTS
SELECT * FROM ORDERS

SELECT P.PROD_NM
FROM CUSTOMER C, PRODUCTS P, ORDERS O
WHERE C.CUST_NM = '고명석' AND C.CUST_CD = O.CUST_CD 
AND P.PROD_CD = O.PROD_CD;

INSERT INTO CUSTOMER(CUST_CD, CUST_NM, CUST_AGE, CUST_LVL, CUST_POINT)
VALUES('TOMATO', '정은심', 36, 'GOLD', 4000);

UPDATE PRODUCTS
SET PROD_NM = '통큰파이'
WHERE PROD_CD = 'P03';

UPDATE PRODUCTS
SET PROD_PRI = PROD_PRI * 1.1

SELECT * , PROD_PRI*0.9 AS PAST_PRI
FROM PRODUCTS

SELECT COUNT(*) FROM CUSTOMER

SELECT COUNT(*) FROM PRODUCTS

SELECT COUNT(*) FROM ORDERS

--고객이름 정소화 주문수량을 5개로 수정
UPDATE ORDERS
SET ORDER_QTY = 5
WHERE CUST_CD IN(SELECT CUST_CD FROM CUSTOMER WHERE CUST_NM = '정소화')

SELECT C.CUST_CD, C.CUST_NM, * 
FROM ORDERS O
LEFT OUTER JOIN CUSTOMER C
ON O.CUST_CD = C.CUST_CD

ALTER TABLE ORDER_01 DROP COLUMN ORD_REGDT

SELECT C.CUST_CD, O.ORDER_QTY, O.ORD_CD
FROM CUSTOMER C, ORDERS O
WHERE O.ORDER_QTY>=20
ORDER BY O.ORDER_QTY ASC

SELECT *
FROM ORDERS

UPDATE ORDERS
SET ORDER_QTY = 20
WHERE CUST_CD = 'MELON'

/* 
'APPLE'이 탈퇴를 함. 'APPLE'의 정보를 날려줘라.
HOW?
그냥 날림. 대신에 고객사에 정확하게 이야기를 해줘야 함. 
"주문내역도 같이 삭제해야 하니 이 부분에 대해 결정해서 알려달라.
주문내역을 백업을 하시는 게 낫다. 주문내역을 지운 다음에 고객아이디를 지우겠습니다."
그러면 고객사에서 회의하고 결정해서 백업하고 지우라고 한다.
백업: 서로 합의를 한다음에 해당 고객이 주문한 내용만 조회해서 백업을 시킨 다음 복사/파일화 해서 보내주고
그 데이터를 확보한 다음에 지워줘라.

CF. 회원가입 페이지가 가장 디테일하게 설계되어 있음.
삭제할 때도 릴레이션이 있어도 삭제할 수 있지만 릴레이션을 안 묶어놓음.
SELECT에서만 묶어놓고 릴레이션을 묶어놓지 않는다. -> SELECT에서 어떻게 묶어놓지? 그거를 뷰로 만드나?
-> 다른 테이블에 A_CD, B_CD 속성을 만들어. 값을 같게 만들어. 그리고 PK로 지정해.
그리고 WHERE A.A_CD = B.B_CD 로 묶어주면 되면 SELECT 입장에서는 FK로 받아들여서 묶어버림.
**값이 같은 게 포인트
단, 발생 가능 문제: 참조가 안 되고 있으니까 B에 이상한 값이 들어갈 수 있음. 그리고 그걸 거를 수가 없음
그래서 데이터베이스 설계할 때는 잘 안 씀!

삭제할 때 테이블 이름 다르게 하면 되니까! 삭제 가능
왜냐면 값 속성이 같으니까.
*/

DELETE 
FROM ORDERS
WHERE CUST_CD = 'APPLE'

DELETE 
FROM CUSTOMER
WHERE CUST_CD = 'APPLE'

SELECT * FROM CUSTOMER
SELECT * FROM ORDERS
SELECT * FROM PRODUCTS

SELECT P.PROD_NM
FROM PRODUCTS P, ORDERS O
WHERE O.CUST_CD = 'BANANA' AND P.PROD_CD = O.PROD_CD

--판매
SELECT O.ORD_CD, O.ORDER_REGDT
FROM ORDERS O, CUSTOMER C
WHERE C.CUST_AGE >= 30 AND C.CUST_CD = O.CUST_CD

SELECT P.PROD_NM
FROM PRODUCTS P, CUSTOMER C
WHERE C.CUST_NM = '고명석'

SELECT MAX(ORDER_REGDT) FROM ORDERS
ORDER BY ORDER_REGDT DESC

DELETE 
FROM ORDERS
WHERE ORDER_REGDT = '2019-05-22'

/*DELETE 구문에서는 집계함수를 아예 쓰지 않음. 
집계함수는 선택된 모든 컬럼에 영향.
DROP, DELETE는 모든 컬럼에 적용하지 못하게 되어 있음
웬만한 기능은 다 못씀. 날라갈까봐
DELETE는 조심히 지워야 하기 때문에 조건을 정확히 지정해서 지우자.
DELETE는 논리연산자도 안 된다..
*/

/*
다시 회원가입.
회원정보 포인트를 1000점으로 주겠다.
*/

INSERT INTO CUSTOMER(
	CUST_CD, 
	CUST_NM,
	CUST_AGE,
	CUST_LVL,
	CUST_JOB,	
	CUST_POINT)
VALUES
('APPLE', '정소화', 20, 'SILVER', '학생', 1000)

UPDATE CUSTOMER
SET CUST_POINT = 2000
WHERE CUST_CD = 'APPLE'

UPDATE CUSTOMER
SET CUST_POINT = CUST_POINT * 1.2

--재밌다!!!!!!!

--고객정보 BANANA라는 사람이 제품코드 P03 5천개
UPDATE PRODUCTS
SET PROD_QY = 10000
WHERE PROD_CD = 'P03'

SELECT *
FROM ORDERS
WHERE CUST_CD = 'BANANA'

INSERT INTO ORDERS
VALUES('O50', 'BANANA', 'P03', 5000, '', '')
--자동으로 리스트 생성이 안 되나? 파이썬으로 해결 가능

SELECT * FROM CUSTOMER
SELECT * FROM PRODUCTS
SELECT * FROM ORDERS


--MELON 고객이 탈퇴
DELETE 
FROM CUSTOMER
WHERE CUST_CD = 'MELON'

SELECT * FROM CUSTOMER
SELECT * FROM ORDERS

/*MES 생산 영업 쪽이랑 프로그래밍 쪽이랑 협업해가지고 하는 거!
바로 대답하는 게 아니라 시간 맞춰서 대답*/

--재밌다!!!!
/* 제품이 3개가 더 늘어났다.
*/
INSERT INTO PRODUCTS
VALUES
('P61', '탕탕탕면', 3000, 3000, '대한식품'),
('P62', '통통통떡', 3200, 4300, '한빛제과'),
('P63', '똑똑똑술', 5300, 1200, '민국푸드');

SELECT * FROM PRODUCTS
WHERE PROD_CD = 'P61' OR PROD_CD = 'P62' OR PROD_CD = 'P63'


SELECT * FROM CUSTOMER
WHERE CUST_CD IN('APPLE', 'BANANA', 'CARROT')

SELECT * FROM ORDERS
WHERE CUST_CD = 'BANANA'

UPDATE ORDERS
SET ORDER_QTY = 30
WHERE PROD_CD = 'P03' AND CUST_CD = 'BANANA'

/*P01, P02, P03 안 팔아서 삭제
DELETE 
FROM PRODUCTS
WHERE PROD_CD = 'P01'
*/
 
--고객 3명이 추가가 됐다. 고객 정보는 임의로 입력
SELECT * FROM ORDERS
ORDER BY CUST_POINT DESC

INSERT INTO CUSTOMER
VALUES
('WISE', '김오옹', 34, 'GOLD', '학생', 3222),
('WISES', '김옹', 33, 'VIP', '직장인', 3002),
('WEISE', '김옹이', 24, 'SILVER', '의사', 222);

/*A 고객이 P04 5개, B가 05 7개, C가 06 15개
*/

SELECT * FROM PRODUCTS
SELECT * FROM ORDERS
ORDER BY ORD_CD DESC

INSERT INTO ORDERS
VALUES
('O71', 'WISE', 'P04', 5, '',''),
('O72', 'WISES', 'P05', 7, '',''),
('O73', 'WEISE', 'P06', 15, '','')

/*
ALTER TABLE ORDERS ALTER COLUMN ORDER_REGDT DATE
아마도 데이터가 있어서 변경이 안 되는 건가? 데이터가 있어서 변경이 안 되는 ALTER가 있을 것

Q.12 바나나 회원탈퇴, 멜론 재가입*/

INSERT INTO CUSTOMER
VALUES('MELON', '김아무개', 29, 'GOLD', '간호사', 1000)

--실제 지우는 순서
DELETE 
FROM ORDERS

DELETE 
FROM PRODUCTS

DROP TABLE ORDERS

DROP TABLE PRODUCTS

DELETE 
FROM CUSTOMER

DROP TABLE CUSTOMER