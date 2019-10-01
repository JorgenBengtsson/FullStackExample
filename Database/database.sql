USE [FullStackExample]
GO
/****** Object:  Table [dbo].[address]    Script Date: 2019-10-01 21:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[address](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NOT NULL,
	[street] [varchar](100) NOT NULL,
	[city] [varchar](50) NOT NULL,
	[country] [varchar](50) NOT NULL,
	[phone] [varchar](50) NOT NULL,
 CONSTRAINT [PK_address] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 2019-10-01 21:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](150) NOT NULL,
	[created] [date] NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[address] ON 
GO
INSERT [dbo].[address] ([id], [userid], [street], [city], [country], [phone]) VALUES (1, 1, N'Street 1', N'City One', N'Country 1', N'123456789')
GO
INSERT [dbo].[address] ([id], [userid], [street], [city], [country], [phone]) VALUES (2, 2, N'Street 2', N'City Two', N'Country 2', N'123456789')
GO
SET IDENTITY_INSERT [dbo].[address] OFF
GO
SET IDENTITY_INSERT [dbo].[user] ON 
GO
INSERT [dbo].[user] ([id], [username], [password], [created]) VALUES (1, N'user1', N'pwd1', CAST(N'2019-10-01' AS Date))
GO
INSERT [dbo].[user] ([id], [username], [password], [created]) VALUES (2, N'user2', N'pwd2', CAST(N'2019-10-01' AS Date))
GO
SET IDENTITY_INSERT [dbo].[user] OFF
GO
ALTER TABLE [dbo].[user] ADD  CONSTRAINT [DF_user_created]  DEFAULT (getdate()) FOR [created]
GO
ALTER TABLE [dbo].[address]  WITH CHECK ADD  CONSTRAINT [FK_address_user] FOREIGN KEY([userid])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[address] CHECK CONSTRAINT [FK_address_user]
GO
