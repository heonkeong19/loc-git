SELECT O.�ֹ���, O.�ֹ���ǰ,
	SUM(O.����) AS ����, 
	SUM(O.�ܰ�) AS �ܰ�,
	SUM(O.���� * O.�ܰ�) AS �ֹ��ݾ�, SUM((O.�ܰ�)*0.1) AS �ΰ���
FROM ORD AS O
WHERE O.�ֹ�����='2021-04-01'
GROUP BY O.�ֹ���, O.�ֹ���ǰ

UNION ALL

SELECT O.�ֹ���, O.�ֹ���ǰ,
	SUM(O.����) AS ����, 
	SUM(O.�ܰ�) AS �ܰ�,
	SUM(O.���� * O.�ܰ�) AS �ֹ��ݾ�, SUM((O.�ܰ�)*0.1) AS �ΰ���
FROM ORD AS O
WHERE O.�ֹ�����='2021-03-31'
GROUP BY O.�ֹ���, O.�ֹ���ǰ

--UNION ��Ģ 
--1. ���� ���ƾ� �� 
--2. �ʵ� ������ Ÿ���� �����ؾ� �Ѵ�(�̸��� �޶� ������ ������ �Ȱ��ƾ� �Ѵ�) 
--3. �̸� �ٸ��� �� ó�� �ʵ�� ġȯ���ش�.

--���ε��� �����͸� �ϳ��� ��� ����Ϸ��� �� �� ���
--���� �ֹ�����, ���� ��������, ǰ�� ǰ���˻�, �˻� â��� �� => ���ε��� ������ ���� �� ����
--�ֳĸ� �����Ȳ�� üũ�ؾ��ϱ� ������. �׷� �� UNION ALL�� �����

--����: ������ 10�� �̻�, �ֹ������� 10�� �̻�, ��ǰ 10�� �̻�
--���������� �ֹ��� ���� ���� ��� ���: �ֹ��� �̸�, �ֹ���
--���������� �ֹ��ݾ� ���� ���� ��� ���
SELECT * FROM CUST
SELECT * FROM ORD
SELECT * FROM PRD

SELECT O.�ֹ���,
	COUNT(O.�ֹ���) AS �ֹ�����
FROM ORD AS O
GROUP BY O.�ֹ���
ORDER BY �ֹ����� DESC

--SELECT O.�ֹ���,
--	SUM(O.����) AS �ֹ���
--FROM ORD AS O
--GROUP BY O.�ֹ���
--ORDER BY SUM(O.����) DESC

SELECT O.�ֹ���, 
	SUM(O.���� * O.�ܰ�) AS �ֹ��ݾ�
FROM ORD AS O
GROUP BY O.�ֹ���
ORDER BY �ֹ��ݾ� DESC

--SELECT O.�ֹ���,
--	SUM(O.�ܰ�) AS �ֹ��ݾ�
--FROM ORD AS O
--GROUP BY O.�ֹ���
--ORDER BY SUM(O.�ܰ�) DESC


--�ּ�ó�� CTRL K, U/ �ּ�Ǯ�� CTRL K,C

--�׷����� ���� �� ���� �����ϰ� ���� �����ϱ�

