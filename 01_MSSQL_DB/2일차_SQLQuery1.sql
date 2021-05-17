USE [SAP_TEST]
GO

/****** Object:  Table [dbo].[CUST]    Script Date: 2021-04-02 ���� 5:17:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CUST](
	[�����̵�] [nchar](20) NOT NULL,
	[���̸�] [nchar](20) NULL,
	[����] [int] NULL,
	[���] [nchar](10) NULL,
	[����] [nchar](10) NULL,
	[������] [int] NULL,
	[�ֹ�] [nchar](10) NULL,
 CONSTRAINT [PK_CUST] PRIMARY KEY CLUSTERED 
(
	[�����̵�] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


DROP TABLE [dbo].[CUST]
GO