SELECT * FROM CUST
SELECT * FROM ORDERS

INSERT INTO CUST(고객아이디, 고객이름, 나이, 등급, 직업, 적립금)
VALUES	   ('APPLE', '김현준', 20, 'GOLD', '학생', 1000)

INSERT INTO CUST(고객아이디, 고객이름, 나이, 등급, 직업, 적립금)
VALUES	   ('BANANA', '정소화', 25, 'VIP', '간호사', 2500)

INSERT INTO CUST(고객아이디, 고객이름, 나이, 등급, 직업, 적립금)
VALUES	   ('CARROT', '원유선', 28, 'GOLD', '교사', 4500)

INSERT INTO CUST(고객아이디, 고객이름, 나이, 등급, 직업, 적립금)
VALUES	   ('ORANGE', '정지영', 22, 'SILVER', '학생', 0)

INSERT INTO ORDERS(주문번호, 주문고객, 주문제품, 수량, 단가, 주문일자)
VALUES	   (1001, 'CARROT', '진짜우동', 10, 2000, '2021-04-02')

INSERT INTO ORDERS(주문번호, 주문고객, 주문제품, 수량, 단가, 주문일자)
VALUES	   (1002, 'BANANA', '맛있는 파이', 5, 500, '2021-04-01')

INSERT INTO ORDERS(주문번호, 주문고객, 주문제품, 수량, 단가, 주문일자)
VALUES	   (1003, 'APPLE', '그대로만두', 11, 4500, '2021-03-31')
