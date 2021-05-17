SELECT O.주문고객, O.주문제품,
	SUM(O.수량) AS 수량, 
	SUM(O.단가) AS 단가,
	SUM(O.수량 * O.단가) AS 주문금액, SUM((O.단가)*0.1) AS 부가세
FROM ORD AS O
WHERE O.주문일자='2021-04-01'
GROUP BY O.주문고객, O.주문제품

UNION ALL

SELECT O.주문고객, O.주문제품,
	SUM(O.수량) AS 수량, 
	SUM(O.단가) AS 단가,
	SUM(O.수량 * O.단가) AS 주문금액, SUM((O.단가)*0.1) AS 부가세
FROM ORD AS O
WHERE O.주문일자='2021-03-31'
GROUP BY O.주문고객, O.주문제품

--UNION 규칙 
--1. 개수 같아야 함 
--2. 필드 개수와 타입은 동일해야 한다(이름은 달라도 되지만 구조는 똑같아야 한다) 
--3. 이름 다르면 맨 처음 필드로 치환해준다.

--따로따로 데이터를 하나의 뷰로 사용하려고 할 때 사용
--영업 주문정보, 생산 생산정보, 품질 품질검사, 검사 창고로 들어감 => 따로따로 데이터 추출 후 머지
--왜냐면 진행상황을 체크해야하기 때문에. 그럴 때 UNION ALL을 사용함

--전재: 고객정보 10명 이상, 주문데이터 10건 이상, 제품 10건 이상
--고객기준으로 주문량 많은 순서 결과 출력: 주문자 이름, 주문량
--고객기준으로 주문금액 많은 순서 결과 출력
SELECT * FROM CUST
SELECT * FROM ORD
SELECT * FROM PRD

SELECT O.주문고객,
	COUNT(O.주문고객) AS 주문개수
FROM ORD AS O
GROUP BY O.주문고객
ORDER BY 주문개수 DESC

--SELECT O.주문고객,
--	SUM(O.수량) AS 주문량
--FROM ORD AS O
--GROUP BY O.주문고객
--ORDER BY SUM(O.수량) DESC

SELECT O.주문고객, 
	SUM(O.수량 * O.단가) AS 주문금액
FROM ORD AS O
GROUP BY O.주문고객
ORDER BY 주문금액 DESC

--SELECT O.주문고객,
--	SUM(O.단가) AS 주문금액
--FROM ORD AS O
--GROUP BY O.주문고객
--ORDER BY SUM(O.단가) DESC


--주석처리 CTRL K, U/ 주석풀기 CTRL K,C

--그룹으로 묶을 거 먼저 생각하고 조건 생성하기

