SELECT *
FROM 고객

SELECT *
FROM 직원

SELECT 고객번호, 고객이름, 나이, '' AS 직위
FROM 고객

UNION ALL

SELECT 직원번호, 직원이름, 0 AS 나이, 직위
FROM 직원
--속성이 일치하지 않을 때는 일치하지 않는 부분을 채워주고 연결하면 됨
--인공지능이 해야할 부분 -> 사람이 직접 채워주는 없는 속성을 자동으로 채워서 결과값 볼 수 있게 하기

