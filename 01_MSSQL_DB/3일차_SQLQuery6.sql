SELECT *
FROM CUST C
	LEFT OUTER JOIN ORD O ON C.�����̵�=O.�ֹ���
WHERE C.��� = 'GOLD'

--�����̼��� �����͹��Ἲ ������ ��Ƴ� �Ű� JOIN�� ���ϴ� ��� �������� ��

--25�� �̻�
SELECT *
FROM CUST C
	LEFT OUTER JOIN ORD O ON C.�����̵�=O.�ֹ��� --AND C.����>=25
WHERE C.��� = 'GOLD' --AND C.����>=25

SELECT *
FROM CUST C
	LEFT OUTER JOIN ORD O ON C.�����̵�=O.�ֹ��� AND C.����>=25
	--AND C.����>=25���� C.�����̵�=O.�ֹ��� ������ ���� ���͸��Ʊ� ������ 20�� ���ԵǾ ������ ��.
WHERE C.��� = 'GOLD' 

SELECT *
FROM CUST C
	LEFT OUTER JOIN ORD O ON C.�����̵�=O.�ֹ��� --AND C.����>=25
WHERE C.��� = 'GOLD' AND C.����>=25

--�� ���� ����� �ٸ� ���ΰ�!

--���1)
--�����̵�, ���̸�, ����, ���ż���, �հ�ݾ�(��)

--���2)
--�����̵�, ���̸�, ����, ��ǰ��, ���ż���(��)

SELECT * FROM CUST
SELECT * FROM ORD
SELECT * FROM PRD

SELECT C.�����̵�, C.���̸�, C.����, O.����, O.����*O.�ܰ� AS �հ�ݾ�
FROM CUST C
	LEFT OUTER JOIN ORD O ON C.�����̵�=O.�ֹ��� 
ORDER BY O.����*O.�ܰ� DESC

SELECT C.�����̵�, C.���̸�, C.����, O.�ֹ���ǰ, O.����
FROM CUST C
	LEFT OUTER JOIN ORD O ON C.�����̵�=O.�ֹ��� 
ORDER BY O.���� DESC

SELECT 
	P.��ǰ�̸�, O.�ֹ���ǰ, O.���� --����ٰ� ���� �̾ƿ� ģ������ �������� ��

	,* 
FROM PRD P
	LEFT OUTER JOIN ORD O ON P.��ǰ�̸� = O.�ֹ���ǰ
	LEFT OUTER JOIN CUST C ON O.�ֹ��� = C.�����̵�
	--��� Ȯ���� �� �ִ�!
	--�÷� �̸��� ������ �� �� ����
	--����Ʈ ����Ʈ ���� ���� �׳� Ǯ ������

SELECT C.�����̵�, C.���̸�
FROM CUST C
	LEFT OUTER JOIN ORD O ON C.�����̵�=O.�ֹ��� 
GROUP BY C.�����̵�, C.���̸�, C.����

SELECT C.�����̵�, C.���̸�, C.����
FROM CUST C
	LEFT OUTER JOIN ORD O ON C.�����̵�=O.�ֹ��� 
GROUP BY C.�����̵�, C.���̸�, C.����

SELECT O.�ֹ���, C.���̸�
FROM CUST C
	LEFT OUTER JOIN ORD O ON C.�����̵�=O.�ֹ��� 
GROUP BY O.�ֹ���, C.���̸�

SELECT O.�ֹ���, C.���̸�, C.����
FROM CUST C
	LEFT OUTER JOIN ORD O ON C.�����̵�=O.�ֹ��� 
GROUP BY O.�ֹ���, C.���̸�, C.����

SELECT O.�ֹ���
FROM ORD O
GROUP BY O.�ֹ���

SELECT O.�ֹ���--, O.����
FROM ORD O
GROUP BY O.�ֹ���, O.����
--�ȿ��� �ֹ���, �������� �׷�ȭ�ǰ� ������ �������� �͸� �ֹ�������.

--���ǹ� PK �ƴϾ ��
--�ʵ��� �ڵ�(��)�� ���� �ֵ鳢�� �����ָ� �ȴ�.
--�����ǰ� �����ϴ�

SELECT *
FROM ORD O
	LEFT OUTER JOIN PRD P ON P.��ǰ�̸� = O.�ֹ���ǰ

SELECT *
FROM ORD O
	RIGHT OUTER JOIN PRD P ON P.��ǰ�̸� = O.�ֹ���ǰ

SELECT *
FROM ORD O
	INNER JOIN PRD P ON P.��ǰ�̸� = O.�ֹ���ǰ
--�Ѵ� ���� �� BUT ���� ������ �߻���