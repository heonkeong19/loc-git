CREATE TABLE TESTTABLE(
	CUST_ID	VARCHAR(20) NOT NULL,
	CUST_PW VARCHAR(20) NOT NULL,
	CUST_POINT INT
	PRIMARY KEY(CUST_ID)
);

INSERT INTO TESTTABLE
VALUES
('A', '가나다라', 1000),
('B', '가나다라', 1000),
('C', 'SKEKFKSK', 1000),
('D', 'EKFKDFJDKF', 1000),
('E', 'DKDALSKFJD', 1000);
