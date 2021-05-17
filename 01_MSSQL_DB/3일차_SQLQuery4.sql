SELECT * 
FROM CUST
WHERE 고객이름 = '김현준'

SELECT * 
FROM CUST
WHERE 고객이름 != '김현준'

SELECT * 
FROM CUST
WHERE 고객이름 IN('김현준', '정소화')
ORDER BY 고객아이디 DESC

SELECT * 
FROM CUST
WHERE 고객이름 IN('김현준', '정소화')
ORDER BY 고객아이디 ASC

SELECT * 
FROM CUST AS A
	LEFT OUTER JOIN ORD O
	ON O.주문고객=A.고객아이디

--INSERT INTO CUST(고객아이디, 고객이름)
--VALUSES('KOREA', '한국')

SELECT * 
FROM ORD AS O
	LEFT OUTER JOIN CUST A
	ON A.고객아이디=O.주문고객

SELECT A.고객아이디, A.고객이름, O.주문제품, O.수량, O.단가
FROM ORD AS O
	LEFT OUTER JOIN CUST A
	ON A.고객아이디=O.주문고객

SELECT A.고객아이디, A.고객이름, O.주문제품, O.수량, O.단가,
	O.수량 * O.단가 AS 주문금액, (O.단가)*0.1 AS 부가세
FROM ORD AS O
	LEFT OUTER JOIN CUST A
	ON O.주문고객=A.고객아이디

SELECT A.고객아이디, A.고객이름, O.주문제품, 
	SUM(O.수량) AS 수량, 
	SUM(O.단가) AS 단가,
	SUM(O.수량 * O.단가) AS 주문금액, SUM((O.단가)*0.1) AS 부가세
FROM ORD AS O
	LEFT OUTER JOIN CUST A
	ON O.주문고객=A.고객아이디
GROUP BY A.고객아이디, A.고객이름, O.주문제품
ORDER BY A.고객아이디


SELECT O.주문고객,
	SUM(O.수량) AS 수량, 
	SUM(O.단가) AS 단가,
	SUM(O.수량 * O.단가) AS 주문금액, SUM((O.단가)*0.1) AS 부가세
FROM ORD AS O
GROUP BY O.주문고객
ORDER BY O.주문고객
--

SELECT O.주문제품,
	SUM(O.수량) AS 수량, 
	SUM(O.단가) AS 단가,
	SUM(O.수량 * O.단가) AS 주문금액, SUM((O.단가)*0.1) AS 부가세
FROM ORD AS O
GROUP BY O.주문제품
ORDER BY O.주문제품
--담당자, 회사 입장


SELECT O.주문고객, O.주문제품,
	SUM(O.수량) AS 수량, 
	SUM(O.단가) AS 단가,
	SUM(O.수량 * O.단가) AS 주문금액, SUM((O.단가)*0.1) AS 부가세
FROM ORD AS O
GROUP BY O.주문고객, O.주문제품
ORDER BY O.주문제품
--SUM이 있어도 없어도 GROUP BY는 사용 가능하다
--단 내가 보고 싶은 게 판매수량이기 때문에 SUM을 넣어주는 것


SELECT O.주문고객, O.주문제품
FROM ORD AS O
GROUP BY O.주문고객, O.주문제품
--이걸 실행하면 내가 보고 싶은 화면이 출력됨.
--여기다 수식을 추가해서 판매수량을 나타내주기

SELECT O.주문고객, O.주문제품, COUNT(O.주문제품) AS 카운트
FROM ORD AS O
GROUP BY O.주문고객, O.주문제품

CREATE VIEW [dbo].[제품주문집계]
as
SELECT O.주문제품,
	SUM(O.수량) AS 수량, 
	SUM(O.단가) AS 단가,
	SUM(O.수량 * O.단가) AS 주문금액, SUM((O.단가)*0.1) AS 부가세
FROM ORD AS O
GROUP BY O.주문제품
GO

SELECT *
FROM 제품주문집계
--저장한 값을 내가 필요할 때마다 호출해서 사용

