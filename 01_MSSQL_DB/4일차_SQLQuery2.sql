CREATE TABLE CUSTOMER(
	CUST_ID NVARCHAR(10),
	CUST_NM NVARCHAR(20),
	CUST_AGE INT DEFAULT 0,
	CUST_LVL NVARCHAR(10),
	CUST_JOB NVARCHAR(20),
	CUST_POINT INT DEFAULT 0
	PRIMARY KEY(CUST_ID)
	CONSTRAINT AGE_LIM CHECK(CUST_AGE<=60));

INSERT INTO CUTSTOMER(CUST_ID, CUST_NM, CUST_AGE, CUST_LVL, CUST_JOB, CUST_POINT)
VALUES ('APPLE', '정소화', 20, 'GOLD', '학생', 1000)


INSERT INTO CUTSTOMER(CUST_ID, CUST_NM, CUST_AGE, CUST_LVL, CUST_JOB, CUST_POINT)
VALUES ('BANANA', '김선우', 25, 'VIP', '간호사', 2500)


INSERT INTO CUTSTOMER(CUST_ID, CUST_NM, CUST_AGE, CUST_LVL, CUST_JOB, CUST_POINT)
VALUES ('CARROT', '고명석', 28, 'GOLD', '교사', 4000)


INSERT INTO CUTSTOMER(CUST_ID, CUST_NM, CUST_AGE, CUST_LVL, CUST_JOB, CUST_POINT)
VALUES ('ORANGE', '김용욱', 22, 'SILVER', '학생')


INSERT INTO CUTSTOMER(CUST_ID, CUST_NM, CUST_AGE, CUST_LVL, CUST_JOB, CUST_POINT)
VALUES ('APPLE', '정소화', 20, 'GOLD', '학생', 1000)