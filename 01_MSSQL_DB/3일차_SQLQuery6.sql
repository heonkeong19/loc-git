SELECT *
FROM CUST C
	LEFT OUTER JOIN ORD O ON C.고객아이디=O.주문고객
WHERE C.등급 = 'GOLD'

--릴레이션은 데이터무결성 때문에 잡아논 거고 JOIN은 원하는 결과 가져오는 거

--25세 이상만
SELECT *
FROM CUST C
	LEFT OUTER JOIN ORD O ON C.고객아이디=O.주문고객 --AND C.나이>=25
WHERE C.등급 = 'GOLD' --AND C.나이>=25

SELECT *
FROM CUST C
	LEFT OUTER JOIN ORD O ON C.고객아이디=O.주문고객 AND C.나이>=25
	--AND C.나이>=25보다 C.고객아이디=O.주문고객 조건이 먼저 필터링됐기 때문에 20이 포함되어서 나오는 것.
WHERE C.등급 = 'GOLD' 

SELECT *
FROM CUST C
	LEFT OUTER JOIN ORD O ON C.고객아이디=O.주문고객 --AND C.나이>=25
WHERE C.등급 = 'GOLD' AND C.나이>=25

--왜 둘이 결과가 다른 것인가!

--결과1)
--고객아이디, 고객이름, 나이, 구매수량, 합계금액(↑)

--결과2)
--고객아이디, 고객이름, 나이, 제품명, 구매수량(↑)

SELECT * FROM CUST
SELECT * FROM ORD
SELECT * FROM PRD

SELECT C.고객아이디, C.고객이름, C.나이, O.수량, O.수량*O.단가 AS 합계금액
FROM CUST C
	LEFT OUTER JOIN ORD O ON C.고객아이디=O.주문고객 
ORDER BY O.수량*O.단가 DESC

SELECT C.고객아이디, C.고객이름, C.나이, O.주문제품, O.수량
FROM CUST C
	LEFT OUTER JOIN ORD O ON C.고객아이디=O.주문고객 
ORDER BY O.수량 DESC

SELECT 
	P.제품이름, O.주문제품, O.수량 --여기다가 내가 뽑아올 친구들을 선언해줄 것

	,* 
FROM PRD P
	LEFT OUTER JOIN ORD O ON P.제품이름 = O.주문제품
	LEFT OUTER JOIN CUST C ON O.주문고객 = C.고객아이디
	--계속 확장할 수 있다!
	--컬럼 이름은 옆에서 볼 수 있음
	--레프트 라이트 같이 쓰면 그냥 풀 조인임

SELECT C.고객아이디, C.고객이름
FROM CUST C
	LEFT OUTER JOIN ORD O ON C.고객아이디=O.주문고객 
GROUP BY C.고객아이디, C.고객이름, C.나이

SELECT C.고객아이디, C.고객이름, C.나이
FROM CUST C
	LEFT OUTER JOIN ORD O ON C.고객아이디=O.주문고객 
GROUP BY C.고객아이디, C.고객이름, C.나이

SELECT O.주문고객, C.고객이름
FROM CUST C
	LEFT OUTER JOIN ORD O ON C.고객아이디=O.주문고객 
GROUP BY O.주문고객, C.고객이름

SELECT O.주문고객, C.고객이름, C.나이
FROM CUST C
	LEFT OUTER JOIN ORD O ON C.고객아이디=O.주문고객 
GROUP BY O.주문고객, C.고객이름, C.나이

SELECT O.주문고객
FROM ORD O
GROUP BY O.주문고객

SELECT O.주문고객--, O.수량
FROM ORD O
GROUP BY O.주문고객, O.수량
--안에서 주문고객, 수량으로 그룹화되고 있지만 가져오는 것만 주문고객으로.

--조건문 PK 아니어도 됨
--필드의 코드(값)이 같은 애들끼리 묶어주면 된다.
--재정의가 가능하다

SELECT *
FROM ORD O
	LEFT OUTER JOIN PRD P ON P.제품이름 = O.주문제품

SELECT *
FROM ORD O
	RIGHT OUTER JOIN PRD P ON P.제품이름 = O.주문제품

SELECT *
FROM ORD O
	INNER JOIN PRD P ON P.제품이름 = O.주문제품
--둘다 참일 때 BUT 누락 정보가 발생함