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

--NVARCHAR �ٱ������� �� �Ÿ�. � ���ڵ� 2����Ʈ�� ����
--VARCHAR ���� 1����Ʈ, �ѱ� 2����Ʈ�� ����

INSERT INTO CUSTOMER(
	CUST_CD, 
	CUST_NM,
	CUST_AGE,
	CUST_LVL,
	CUST_JOB,	
	CUST_POINT)
VALUES
('APPLE', '����ȭ', 20, 'GOLD', '�л�', 1000),
('BANANA', '�輱��', 25, 'VIP', '��ȣ��', 2500),
('CARROT', '���', 28, 'GOLD', '����', 4500),
('ORANGE', '����', 22, 'SILVER', '�л�', ''),
('MELON', '������', 35, 'GOLD', 'ȸ���', 5000),
('PEACH', '������','', 'SILVER', '�ǻ�', 300),
('PEAR', 'ä����', 31, 'SILVER', 'ȸ���', 500);

INSERT INTO PRODUCTS(
	PROD_CD,
	PROD_NM,
	PROD_QY,
	PROD_PRI,
	PROD_VEND)
VALUES
('P01', '�׳ɸ���', 5000, 4500, '���ѽ�ǰ'),
('P02', '�ſ��̸�', 2500, 5500, '�α�Ǫ��'),
('P03', '��������', 3600, 2600, '�Ѻ�����'),
('P04', '�������ݸ�', 1250, 2500, '�Ѻ�����'),
('P05', '��ū���', 2200, 1200, '���ѽ�ǰ'),
('P06', '����쵿', 1000, 1550, '�α�Ǫ��'),
('P07', '���޺�Ŷ', 1650, 1500, '�Ѻ�����');


INSERT INTO ORDERS(
	ORD_CD,
	CUST_CD,
	PROD_CD,
	ORDER_QTY,
	ORDER_ADD,
	ORDER_REGDT)
VALUES
('O61', 'APPLE', 'P30', 10, '����� ������', '2019-01-01'),
('O62', 'APPLE', 'P31', 5, '��õ�� ��籸', '2019-01-10'),
('O63', 'BANANA', 'P36', 45, '��⵵ ��õ��', '2019-01-11'),
('O64', 'CARROT', 'P32', 8, '�λ�� ������', '2019-02-01'),
('O65', 'BANANA', 'P26', 36, '��⵵ ���ν�', '2019-02-20'),
('O66', 'BANANA', 'P41', 19, '��û�ϵ� ������', '2019-03-02'),
('O67', 'APPLE', 'P43', 22, '����� ��������', '2019-03-15'),
('O68', 'PEAR', 'P33', 50, '������ ��õ��', '2019-04-10'),
('O69', 'BANANA', 'P24', 15, '���󳲵� ������', '2019-04-11'),
('O70', 'CARROT', 'P33', 20, '��⵵ �Ⱦ��', '');

SELECT PROD_CD, PROD_PRI ����
FROM PRODUCTS

SELECT PROD_NM, PROD_PRI+500 �����ܰ�
FROM PRODUCTS

SELECT PROD_CD, ORDER_QTY, ORDER_REGDT
FROM ORDERS
WHERE CUST_CD = 'APPLE' AND ORDER_QTY>=15;

SELECT CUST_NM, CUST_AGE, CUST_LVL, CUST_POINT
FROM CUSTOMER
WHERE CUST_NM LIKE '_��%';

SELECT CUST_CD, CUST_NM, CUST_LVL
FROM CUSTOMER
WHERE CUST_CD LIKE '_____';

SELECT *
FROM ORDERS

INSERT INTO CUSTOMER
VALUES('PRIMARY', '�輱��')

--FK ������������ ���̴� ��쿡 CHECK ���� �߰��� �Ұ����� �ǰ�?
--����
 ALTER TABLE PRODUCTS ADD CONSTRAINT PRI_LIM CHECK(PROD_PRI<=10000)

/*
�ٵ� �� ���α׷��� Ŀ�� �ѹ� ������ ���� �ǰ�?
�ִµ� �װŴ� �ְ�����ڸ� ������ �ְ� �ְ�����ڰ� ������ �ο��ϴ� ������ �����.
Ŀ���̶� �ѹ��� ���� �����ͺ��̽������� �׳� �ڵ����� ����Ǵ� ���� ��.
*/

--���ڷ� �������� ����? ���ڷ� �������� �� ���� ���̸� �� �� �Ӽ��� ��ΰ� �װſ� ���ڸ� �ο��ؼ� �������⸸ ����
--������ ó���� ������ ���� �Է��ؾ� ��.
SELECT CUST_CD, CUST_AGE, *
FROM CUSTOMER



INSERT INTO CUSTOMER
VALUES
('FROZEN', '���ϴ�', 29, 'GOLD', '������', 6600),
('DIOR', '������', '', '', '', '');

INSERT INTO CUSTOMER(CUST_CD, CUST_NM)
VALUES('MORGEN', 'ȣ��')

SELECT *
FROM CUSTOMER

--���� �������� ���ڴµ� ��� �ϴ����� �𸣰ͳ�
--�÷��� NOT NULL 2���� �����ؼ� INSERT INTO ������ �ְ� VALUES�� �� �ְ� �׿� �Է� �� �ϸ� NULL�� ����
--��, ���� �˰� �ִ� �Ӽ��� �Է��ϸ� �Ǵ� ��.

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

--���� �ϰ� ���� ��: PROD_CD, PROD_NM, ORDER_QTY�� �������µ� PROD_NM���� �����ֱ�

SELECT O.PROD_CD, P.PROD_NM, SUM(O.ORDER_QTY) AS TOTAL
FROM ORDERS O
LEFT OUTER JOIN PRODUCTS P
ON O.PROD_CD = P.PROD_CD
GROUP BY O.PROD_CD, P.PROD_NM
--GROUP BY������ �����Լ� �ܸ� �� ����� ���´�. ���� ��

SELECT * FROM CUSTOMER
SELECT * FROM PRODUCTS
SELECT * FROM ORDERS

SELECT P.PROD_NM
FROM CUSTOMER C, PRODUCTS P, ORDERS O
WHERE C.CUST_NM = '���' AND C.CUST_CD = O.CUST_CD 
AND P.PROD_CD = O.PROD_CD;

INSERT INTO CUSTOMER(CUST_CD, CUST_NM, CUST_AGE, CUST_LVL, CUST_POINT)
VALUES('TOMATO', '������', 36, 'GOLD', 4000);

UPDATE PRODUCTS
SET PROD_NM = '��ū����'
WHERE PROD_CD = 'P03';

UPDATE PRODUCTS
SET PROD_PRI = PROD_PRI * 1.1

SELECT * , PROD_PRI*0.9 AS PAST_PRI
FROM PRODUCTS

SELECT COUNT(*) FROM CUSTOMER

SELECT COUNT(*) FROM PRODUCTS

SELECT COUNT(*) FROM ORDERS

--���̸� ����ȭ �ֹ������� 5���� ����
UPDATE ORDERS
SET ORDER_QTY = 5
WHERE CUST_CD IN(SELECT CUST_CD FROM CUSTOMER WHERE CUST_NM = '����ȭ')

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
'APPLE'�� Ż�� ��. 'APPLE'�� ������ �������.
HOW?
�׳� ����. ��ſ� ���翡 ��Ȯ�ϰ� �̾߱⸦ ����� ��. 
"�ֹ������� ���� �����ؾ� �ϴ� �� �κп� ���� �����ؼ� �˷��޶�.
�ֹ������� ����� �Ͻô� �� ����. �ֹ������� ���� ������ �����̵� ����ڽ��ϴ�."
�׷��� ���翡�� ȸ���ϰ� �����ؼ� ����ϰ� ������ �Ѵ�.
���: ���� ���Ǹ� �Ѵ����� �ش� ���� �ֹ��� ���븸 ��ȸ�ؼ� ����� ��Ų ���� ����/����ȭ �ؼ� �����ְ�
�� �����͸� Ȯ���� ������ �������.

CF. ȸ������ �������� ���� �������ϰ� ����Ǿ� ����.
������ ���� �����̼��� �־ ������ �� ������ �����̼��� �� �������.
SELECT������ ������� �����̼��� ������� �ʴ´�. -> SELECT���� ��� �������? �װŸ� ��� ���峪?
-> �ٸ� ���̺� A_CD, B_CD �Ӽ��� �����. ���� ���� �����. �׸��� PK�� ������.
�׸��� WHERE A.A_CD = B.B_CD �� �����ָ� �Ǹ� SELECT ���忡���� FK�� �޾Ƶ鿩�� �������.
**���� ���� �� ����Ʈ
��, �߻� ���� ����: ������ �� �ǰ� �����ϱ� B�� �̻��� ���� �� �� ����. �׸��� �װ� �Ÿ� ���� ����
�׷��� �����ͺ��̽� ������ ���� �� �� ��!

������ �� ���̺� �̸� �ٸ��� �ϸ� �Ǵϱ�! ���� ����
�ֳĸ� �� �Ӽ��� �����ϱ�.
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

--�Ǹ�
SELECT O.ORD_CD, O.ORDER_REGDT
FROM ORDERS O, CUSTOMER C
WHERE C.CUST_AGE >= 30 AND C.CUST_CD = O.CUST_CD

SELECT P.PROD_NM
FROM PRODUCTS P, CUSTOMER C
WHERE C.CUST_NM = '���'

SELECT MAX(ORDER_REGDT) FROM ORDERS
ORDER BY ORDER_REGDT DESC

DELETE 
FROM ORDERS
WHERE ORDER_REGDT = '2019-05-22'

/*DELETE ���������� �����Լ��� �ƿ� ���� ����. 
�����Լ��� ���õ� ��� �÷��� ����.
DROP, DELETE�� ��� �÷��� �������� ���ϰ� �Ǿ� ����
������ ����� �� ����. ���󰥱��
DELETE�� ������ ������ �ϱ� ������ ������ ��Ȯ�� �����ؼ� ������.
DELETE�� �������ڵ� �� �ȴ�..
*/

/*
�ٽ� ȸ������.
ȸ������ ����Ʈ�� 1000������ �ְڴ�.
*/

INSERT INTO CUSTOMER(
	CUST_CD, 
	CUST_NM,
	CUST_AGE,
	CUST_LVL,
	CUST_JOB,	
	CUST_POINT)
VALUES
('APPLE', '����ȭ', 20, 'SILVER', '�л�', 1000)

UPDATE CUSTOMER
SET CUST_POINT = 2000
WHERE CUST_CD = 'APPLE'

UPDATE CUSTOMER
SET CUST_POINT = CUST_POINT * 1.2

--��մ�!!!!!!!

--������ BANANA��� ����� ��ǰ�ڵ� P03 5õ��
UPDATE PRODUCTS
SET PROD_QY = 10000
WHERE PROD_CD = 'P03'

SELECT *
FROM ORDERS
WHERE CUST_CD = 'BANANA'

INSERT INTO ORDERS
VALUES('O50', 'BANANA', 'P03', 5000, '', '')
--�ڵ����� ����Ʈ ������ �� �ǳ�? ���̽����� �ذ� ����

SELECT * FROM CUSTOMER
SELECT * FROM PRODUCTS
SELECT * FROM ORDERS


--MELON ���� Ż��
DELETE 
FROM CUSTOMER
WHERE CUST_CD = 'MELON'

SELECT * FROM CUSTOMER
SELECT * FROM ORDERS

/*MES ���� ���� ���̶� ���α׷��� ���̶� �����ذ����� �ϴ� ��!
�ٷ� ����ϴ� �� �ƴ϶� �ð� ���缭 ���*/

--��մ�!!!!
/* ��ǰ�� 3���� �� �þ��.
*/
INSERT INTO PRODUCTS
VALUES
('P61', '��������', 3000, 3000, '���ѽ�ǰ'),
('P62', '�����붱', 3200, 4300, '�Ѻ�����'),
('P63', '�ȶȶȼ�', 5300, 1200, '�α�Ǫ��');

SELECT * FROM PRODUCTS
WHERE PROD_CD = 'P61' OR PROD_CD = 'P62' OR PROD_CD = 'P63'


SELECT * FROM CUSTOMER
WHERE CUST_CD IN('APPLE', 'BANANA', 'CARROT')

SELECT * FROM ORDERS
WHERE CUST_CD = 'BANANA'

UPDATE ORDERS
SET ORDER_QTY = 30
WHERE PROD_CD = 'P03' AND CUST_CD = 'BANANA'

/*P01, P02, P03 �� �ȾƼ� ����
DELETE 
FROM PRODUCTS
WHERE PROD_CD = 'P01'
*/
 
--�� 3���� �߰��� �ƴ�. �� ������ ���Ƿ� �Է�
SELECT * FROM ORDERS
ORDER BY CUST_POINT DESC

INSERT INTO CUSTOMER
VALUES
('WISE', '�����', 34, 'GOLD', '�л�', 3222),
('WISES', '���', 33, 'VIP', '������', 3002),
('WEISE', '�����', 24, 'SILVER', '�ǻ�', 222);

/*A ���� P04 5��, B�� 05 7��, C�� 06 15��
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
�Ƹ��� �����Ͱ� �־ ������ �� �Ǵ� �ǰ�? �����Ͱ� �־ ������ �� �Ǵ� ALTER�� ���� ��

Q.12 �ٳ��� ȸ��Ż��, ��� �簡��*/

INSERT INTO CUSTOMER
VALUES('MELON', '��ƹ���', 29, 'GOLD', '��ȣ��', 1000)

--���� ����� ����
DELETE 
FROM ORDERS

DELETE 
FROM PRODUCTS

DROP TABLE ORDERS

DROP TABLE PRODUCTS

DELETE 
FROM CUSTOMER

DROP TABLE CUSTOMER