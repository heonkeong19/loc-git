USE [SAP_TEST]
GO

/****** Object:  Table [dbo].[CUST]    Script Date: 2021-04-02 오후 5:17:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CUST](
	[고객아이디] [nchar](20) NOT NULL,
	[고객이름] [nchar](20) NULL,
	[나이] [int] NULL,
	[등급] [nchar](10) NULL,
	[직업] [nchar](10) NULL,
	[적립금] [int] NULL,
	[주문] [nchar](10) NULL,
 CONSTRAINT [PK_CUST] PRIMARY KEY CLUSTERED 
(
	[고객아이디] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


DROP TABLE [dbo].[CUST]
GO