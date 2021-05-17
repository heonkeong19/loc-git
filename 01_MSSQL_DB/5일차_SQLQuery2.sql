
CREATE TABLE CUSTOMER(
	CUST_CD		VARCHAR(10) NOT NULL,
	CUST_NM		VARCHAR(20) NOT NULL,
	CUST_AGE	INT			DEFAULT 0,
	CUST_LVL	VARCHAR(10) NOT NULL,
	CUST_JOB	VARCHAR(20) NOT NULL,
	CUST_POINT	INT			DEFAULT 0,
	PRIMARY KEY	(CUST_CD),
	CONSTRAINT CHECK_AGE CHECK (CUST_AGE = 60)
);

CREATE TABLE PRODUCTS(
	PROD_CD		VARCHAR(10)		NOT NULL,
	PROD_NM		VARCHAR(20)		NOT NULL,
	PROD_QY		INT				DEFAULT 0,
	PROD_PRI	DECIMAL(18,4)	DEFAULT 0,
	PROD_VEND	VARCHAR(20)
	PRIMARY KEY (PROD_CD),
	CHECK(PROD_QY >=0 AND PROD_QY <=10000)
);

CREATE TABLE ORDERS(
	ORD_CD		VARCHAR(10)		NOT NULL,
	CUST_CD		VARCHAR(10)		NOT NULL,
	PROD_CD		VARCHAR(10)		DEFAULT 0,
	ORDER_QTY	INT				DEFAULT 0,
	ORDER_ADD	VARCHAR(20),
	ORDER_REGDT	DATETIME DEFAULT GETDATE(),
	PRIMARY KEY	(ORD_CD),
	FOREIGN KEY(CUST_CD) REFERENCES CUSTOMER(CUST_CD),
	FOREIGN KEY(PROD_CD) REFERENCES PRODUCTS(PROD_CD),

	CHECK(ORDER_QTY >= 0 AND ORDER_QTY <= 10000)
);

--충돌이 생기면 ORDERS를 지우고 CUSTOMER를 지울 것

ALTER TABLE CUSTOMER ADD CONSTRAINT CHEK_AGE CHECK(CUST_AGE<=60);

--데이터 한 번에 입력
INSERT INTO CUSTOMER
VALUES
('APPLE','정소화',20, 'GOLD', '학생', 1000),
('BANANA','김선우',25, 'VIP', '간호사', 2500),
('CARROT','고명석',28, 'GOLD', '교사', 4500),
('ORANGE', '김용욱', 22,'SILVER', '학생', 0),
('MELON', '성원용', 35, 'GOLD', '회사원', 5000)

--가능
INSERT INTO CUSTOMER
VALUES('PEACH', '오형준',NULL,'SILVER', '의사', 300)

SELECT * FROM CUSTOMER

--가능
INSERT INTO CUSTOMER
VALUES('PEAR', '채광주', DEFAULT, 'SILVER', '회사원', 500);

/*불가능
INSERT INTO CUSTOMER
VALUES('GRAPE', '윤여정', , 'VIP', '배우', 6500);
디폴트값이 있어서 안되는 건가? 아니면 애초에 입력제한이 걸려있는 건가?
그러면 디폴트값을 왜 설정해? 그냥 다 입력하라구 하지. 호옥시에 대비하는 건가?
애초에 입력이 아예 안 되는데 만약의 경우가 발생가능한가?
*/

INSERT INTO PRODUCTS(PROD_CD, PROD_NM, PROD_QY,	PROD_PRI, PROD_VEND)
VALUES
('P01', '그냥만두', 5000, 4500, '대한식품'),
('P02', '매운쫄면', 2500, 5500, '민국푸드'),
('P03', '쿵떡파이', 3600, 2600, '한빛제과'),
('P04', '맛난초콜릿', 1250, 2500, '한빛제과'),
('P05', '얼큰라면', 2200, 1200, '대한식품'),
('P06', '통통우동', 1000, 1550, '민국푸드'),
('P07', '달콤비스킷', 1650, 1500, '한빛제과');

INSERT INTO ORDERS(ORD_CD, CUST_CD, PROD_CD, ORDER_QTY, ORDER_ADD, ORDER_REGDT)
VALUES
('o01', 'APPLE', 'P03', 10, '서울시 마포구', '2019-01-01'),
('o02', 'MELON', 'P01', 5, '인천시 계양구', '2019-01-10'),
('o03', 'BANANA', 'P06', 45, '경기도 부천시', '2019-01-11'),
('o04', 'CARROT', 'P02', 8, '부산시 금정구', '2019-02-01'),
('o05', 'MELON', 'P06', 36, '경기도 용인시', '2019-02-20'),
('o06', 'BANANA', 'P01', 19, '충청북도 보은군', '2019-03-02'),
('o07', 'APPLE', 'P03', 22, '서울시 영등포구', '2019-03-15'),
('o08', 'PEAR', 'P02', 50, '강원도 춘천시', '2019-04-10'),
('o09', 'BANANA', 'P04', 15, '전라남도 목포시', '2019-04-11'),
('o10', 'CARROT', 'P03', 20, '경기도 안양시', '2019-05-22');

/* DELETE TIP
먼저 SELECT로 지우고자 하는 데이터를 조회

SELECT *
FROM CUSTOMER
WHERE CUST_CD = 'APPLE'

SELECT * 부분을 DELETE로 변경
*/

/*SELECT 여러 테이블 한 번에 하기 : UNION - 열 개수 같아야 해서 안됨.
SELECT *
FROM CUSTOMER
UNION
SELECT *
FROM ORDERS
UNION
SELECT *
FROM PRODUCTS
=> 결과: 불가능
*/

SELECT CUST_POINT * 2 AS DOUBLES
FROM CUSTOMER
