USE [CR]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 27-03-2025 18:34:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[AddressId] [int] NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AddressId]) VALUES (N'5c5ac067-f074-4716-8d7b-454b26e95497', NULL, NULL, N'test@gmail.com', N'TEST@GMAIL.COM', N'test@gmail.com', N'TEST@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEGhM1sVbgcuW6DJQjjnA/ZI1HggzOLVMRlB6QpuHO/mwbkC3GXTulBAzDJ4Ueo1sDA==', N'XVSMX7Y6TTC4MPERUCHEHVC6R4VC67M5', N'95268080-3245-460b-8983-b86d8ebd07a5', NULL, 0, 0, NULL, 1, 0, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AddressId]) VALUES (N'7bb052c4-ef8b-431f-ab28-7cf3530963d8', N'Nancy', N'Shah', N'nancy.shah1002@gmail.com', N'NANCY.SHAH1002@GMAIL.COM', N'nancy.shah1002@gmail.com', N'NANCY.SHAH1002@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEBGZOD1voU22TFqc61TQMldNVN1TgUO3CuvinCB4W/E9lvsnI4qZdn5RELv69nwyAg==', N'QTLLMR3ATEVDZZXTOOSK3S5DYP7CAIQQ', N'1f85f1fb-6485-4e58-876f-cd3d15050476', NULL, 0, 0, NULL, 1, 0, 2)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AddressId]) VALUES (N'7f07513b-74da-4a91-a2e4-3c4ed789ce5d', N'Test', N'1', N'test1@gmail.com', N'TEST1@GMAIL.COM', N'test1@gmail.com', N'TEST1@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEDOQT8pFDPdIa/VrSP/Xd2FbO9waAlUupgZbzdIShz7/5x/tg3VPT+zzsXv18oUIug==', N'H45X7MEGTETBKGE5A5LAWPGTOADKG7NK', N'69b74216-f630-40a5-8f4c-016c765ec988', NULL, 0, 0, NULL, 1, 0, 1)
GO
ALTER TABLE [dbo].[AspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsers_Addresses_AddressId] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Addresses] ([Id])
GO
ALTER TABLE [dbo].[AspNetUsers] CHECK CONSTRAINT [FK_AspNetUsers_Addresses_AddressId]
GO
