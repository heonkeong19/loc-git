SELECT * FROM CUST
SELECT * FROM ORD
SELECT * FROM PRD

INSERT INTO CUST(고객아이디, 고객이름, 나이, 등급, 직업, 적립금)
VALUES('APPLE', '김현준', 20, 'GOLD', '학생', 1000)

INSERT INTO CUST(고객아이디, 고객이름, 나이, 등급, 직업, 적립금)
VALUES('BANANA', '정소화', 25, 'VIP', '간호사', 2500)

INSERT INTO CUST(고객아이디, 고객이름, 나이, 등급, 직업, 적립금)
VALUES('CARROT', '원유선', 28, 'GOLD', '교사', 4500)

INSERT INTO CUST(고객아이디, 고객이름, 나이, 등급, 직업, 적립금)
VALUES('ORANGE', '정지영', 22, 'SIVER', '학생', 0)


INSERT INTO ORD(주문번호, 주문고객, 주문제품, 수량, 단가, 주문일자)
VALUES(1002, 'CARROT', '맛있는파이', 5, 500, '2021-04-01')

INSERT INTO ORD(주문번호, 주문고객, 주문제품, 수량, 단가, 주문일자)
VALUES(1003, 'BANANA', '그대로만두', 11, 4500, '2021-04-01')

INSERT INTO PRD(제품번호, 제품이름, 제조사, 원산지)
VALUES(100, '진짜우동', '농심', '강원도')

INSERT INTO PRD(제품번호, 제품이름, 제조사, 원산지)
VALUES(200, '맛있는파이', '오뚜기', '전라도')

INSERT INTO PRD(제품번호, 제품이름, 제조사, 원산지)
VALUES(300, '그대로만두', '삼양', '경상도')

INSERT INTO ORD(주문번호, 주문고객, 주문제품, 수량, 단가, 주문일자)
VALUES(1001, 'CHERRY', '진짜우동', 10, 2000, '2021-04-02')

INSERT INTO ORD(주문번호, 주문고객, 주문제품, 수량, 단가, 주문일자)
VALUES(1001, 'APPLE', '', 10, 2000, '2021-04-02')

