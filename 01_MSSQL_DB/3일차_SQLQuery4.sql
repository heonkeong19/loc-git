SELECT * 
FROM CUST
WHERE ���̸� = '������'

SELECT * 
FROM CUST
WHERE ���̸� != '������'

SELECT * 
FROM CUST
WHERE ���̸� IN('������', '����ȭ')
ORDER BY �����̵� DESC

SELECT * 
FROM CUST
WHERE ���̸� IN('������', '����ȭ')
ORDER BY �����̵� ASC

SELECT * 
FROM CUST AS A
	LEFT OUTER JOIN ORD O
	ON O.�ֹ���=A.�����̵�

--INSERT INTO CUST(�����̵�, ���̸�)
--VALUSES('KOREA', '�ѱ�')

SELECT * 
FROM ORD AS O
	LEFT OUTER JOIN CUST A
	ON A.�����̵�=O.�ֹ���

SELECT A.�����̵�, A.���̸�, O.�ֹ���ǰ, O.����, O.�ܰ�
FROM ORD AS O
	LEFT OUTER JOIN CUST A
	ON A.�����̵�=O.�ֹ���

SELECT A.�����̵�, A.���̸�, O.�ֹ���ǰ, O.����, O.�ܰ�,
	O.���� * O.�ܰ� AS �ֹ��ݾ�, (O.�ܰ�)*0.1 AS �ΰ���
FROM ORD AS O
	LEFT OUTER JOIN CUST A
	ON O.�ֹ���=A.�����̵�

SELECT A.�����̵�, A.���̸�, O.�ֹ���ǰ, 
	SUM(O.����) AS ����, 
	SUM(O.�ܰ�) AS �ܰ�,
	SUM(O.���� * O.�ܰ�) AS �ֹ��ݾ�, SUM((O.�ܰ�)*0.1) AS �ΰ���
FROM ORD AS O
	LEFT OUTER JOIN CUST A
	ON O.�ֹ���=A.�����̵�
GROUP BY A.�����̵�, A.���̸�, O.�ֹ���ǰ
ORDER BY A.�����̵�


SELECT O.�ֹ���,
	SUM(O.����) AS ����, 
	SUM(O.�ܰ�) AS �ܰ�,
	SUM(O.���� * O.�ܰ�) AS �ֹ��ݾ�, SUM((O.�ܰ�)*0.1) AS �ΰ���
FROM ORD AS O
GROUP BY O.�ֹ���
ORDER BY O.�ֹ���
--

SELECT O.�ֹ���ǰ,
	SUM(O.����) AS ����, 
	SUM(O.�ܰ�) AS �ܰ�,
	SUM(O.���� * O.�ܰ�) AS �ֹ��ݾ�, SUM((O.�ܰ�)*0.1) AS �ΰ���
FROM ORD AS O
GROUP BY O.�ֹ���ǰ
ORDER BY O.�ֹ���ǰ
--�����, ȸ�� ����


SELECT O.�ֹ���, O.�ֹ���ǰ,
	SUM(O.����) AS ����, 
	SUM(O.�ܰ�) AS �ܰ�,
	SUM(O.���� * O.�ܰ�) AS �ֹ��ݾ�, SUM((O.�ܰ�)*0.1) AS �ΰ���
FROM ORD AS O
GROUP BY O.�ֹ���, O.�ֹ���ǰ
ORDER BY O.�ֹ���ǰ
--SUM�� �־ ��� GROUP BY�� ��� �����ϴ�
--�� ���� ���� ���� �� �Ǹż����̱� ������ SUM�� �־��ִ� ��


SELECT O.�ֹ���, O.�ֹ���ǰ
FROM ORD AS O
GROUP BY O.�ֹ���, O.�ֹ���ǰ
--�̰� �����ϸ� ���� ���� ���� ȭ���� ��µ�.
--����� ������ �߰��ؼ� �Ǹż����� ��Ÿ���ֱ�

SELECT O.�ֹ���, O.�ֹ���ǰ, COUNT(O.�ֹ���ǰ) AS ī��Ʈ
FROM ORD AS O
GROUP BY O.�ֹ���, O.�ֹ���ǰ

CREATE VIEW [dbo].[��ǰ�ֹ�����]
as
SELECT O.�ֹ���ǰ,
	SUM(O.����) AS ����, 
	SUM(O.�ܰ�) AS �ܰ�,
	SUM(O.���� * O.�ܰ�) AS �ֹ��ݾ�, SUM((O.�ܰ�)*0.1) AS �ΰ���
FROM ORD AS O
GROUP BY O.�ֹ���ǰ
GO

SELECT *
FROM ��ǰ�ֹ�����
--������ ���� ���� �ʿ��� ������ ȣ���ؼ� ���

