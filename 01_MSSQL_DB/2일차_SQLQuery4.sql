USE [SAP_TEST]
GO

/****** Object:  Table [dbo].[ORDERS]    Script Date: 2021-04-02 ���� 5:58:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ORDERS](
	[�ֹ���ȣ] [int] NOT NULL,
	[�ֹ���] [nchar](20) NULL,
	[�ֹ���ǰ] [nchar](10) NULL,
	[����] [int] NULL,
	[�ܰ�] [int] NULL,
	[�ֹ�����] [nchar](10) NULL,
 CONSTRAINT [PK_ORDERS] PRIMARY KEY CLUSTERED 
(
	[�ֹ���ȣ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ORDERS]  WITH CHECK ADD  CONSTRAINT [FK_ORDERS_CUST] FOREIGN KEY([�ֹ���])
REFERENCES [dbo].[CUST] ([�����̵�])
GO

ALTER TABLE [dbo].[ORDERS] CHECK CONSTRAINT [FK_ORDERS_CUST]
GO


DROP TABLE [dbo].[ORDERS]
GO

DROP TABLE [dbo].[CUST]
GO

DROP TABLE [dbo].[PRDS]
GO
