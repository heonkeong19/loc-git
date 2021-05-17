
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

--�浹�� ����� ORDERS�� ����� CUSTOMER�� ���� ��

ALTER TABLE CUSTOMER ADD CONSTRAINT CHEK_AGE CHECK(CUST_AGE<=60);

--������ �� ���� �Է�
INSERT INTO CUSTOMER
VALUES
('APPLE','����ȭ',20, 'GOLD', '�л�', 1000),
('BANANA','�輱��',25, 'VIP', '��ȣ��', 2500),
('CARROT','���',28, 'GOLD', '����', 4500),
('ORANGE', '����', 22,'SILVER', '�л�', 0),
('MELON', '������', 35, 'GOLD', 'ȸ���', 5000)

--����
INSERT INTO CUSTOMER
VALUES('PEACH', '������',NULL,'SILVER', '�ǻ�', 300)

SELECT * FROM CUSTOMER

--����
INSERT INTO CUSTOMER
VALUES('PEAR', 'ä����', DEFAULT, 'SILVER', 'ȸ���', 500);

/*�Ұ���
INSERT INTO CUSTOMER
VALUES('GRAPE', '������', , 'VIP', '���', 6500);
����Ʈ���� �־ �ȵǴ� �ǰ�? �ƴϸ� ���ʿ� �Է������� �ɷ��ִ� �ǰ�?
�׷��� ����Ʈ���� �� ������? �׳� �� �Է��϶� ����. ȣ���ÿ� ����ϴ� �ǰ�?
���ʿ� �Է��� �ƿ� �� �Ǵµ� ������ ��찡 �߻������Ѱ�?
*/

INSERT INTO PRODUCTS(PROD_CD, PROD_NM, PROD_QY,	PROD_PRI, PROD_VEND)
VALUES
('P01', '�׳ɸ���', 5000, 4500, '���ѽ�ǰ'),
('P02', '�ſ��̸�', 2500, 5500, '�α�Ǫ��'),
('P03', '��������', 3600, 2600, '�Ѻ�����'),
('P04', '�������ݸ�', 1250, 2500, '�Ѻ�����'),
('P05', '��ū���', 2200, 1200, '���ѽ�ǰ'),
('P06', '����쵿', 1000, 1550, '�α�Ǫ��'),
('P07', '���޺�Ŷ', 1650, 1500, '�Ѻ�����');

INSERT INTO ORDERS(ORD_CD, CUST_CD, PROD_CD, ORDER_QTY, ORDER_ADD, ORDER_REGDT)
VALUES
('o01', 'APPLE', 'P03', 10, '����� ������', '2019-01-01'),
('o02', 'MELON', 'P01', 5, '��õ�� ��籸', '2019-01-10'),
('o03', 'BANANA', 'P06', 45, '��⵵ ��õ��', '2019-01-11'),
('o04', 'CARROT', 'P02', 8, '�λ�� ������', '2019-02-01'),
('o05', 'MELON', 'P06', 36, '��⵵ ���ν�', '2019-02-20'),
('o06', 'BANANA', 'P01', 19, '��û�ϵ� ������', '2019-03-02'),
('o07', 'APPLE', 'P03', 22, '����� ��������', '2019-03-15'),
('o08', 'PEAR', 'P02', 50, '������ ��õ��', '2019-04-10'),
('o09', 'BANANA', 'P04', 15, '���󳲵� ������', '2019-04-11'),
('o10', 'CARROT', 'P03', 20, '��⵵ �Ⱦ��', '2019-05-22');

/* DELETE TIP
���� SELECT�� ������� �ϴ� �����͸� ��ȸ

SELECT *
FROM CUSTOMER
WHERE CUST_CD = 'APPLE'

SELECT * �κ��� DELETE�� ����
*/

/*SELECT ���� ���̺� �� ���� �ϱ� : UNION - �� ���� ���ƾ� �ؼ� �ȵ�.
SELECT *
FROM CUSTOMER
UNION
SELECT *
FROM ORDERS
UNION
SELECT *
FROM PRODUCTS
=> ���: �Ұ���
*/

SELECT CUST_POINT * 2 AS DOUBLES
FROM CUSTOMER
