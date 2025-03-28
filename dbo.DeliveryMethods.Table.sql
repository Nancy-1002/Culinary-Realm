USE [CR]
GO
/****** Object:  Table [dbo].[DeliveryMethods]    Script Date: 27-03-2025 18:34:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryMethods](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ShortName] [nvarchar](max) NOT NULL,
	[DeliveryTime] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_DeliveryMethods] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DeliveryMethods] ON 

INSERT [dbo].[DeliveryMethods] ([Id], [ShortName], [DeliveryTime], [Description], [Price]) VALUES (1, N'UPS1', N'1-2 Days', N'Fastest delivery time', CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[DeliveryMethods] ([Id], [ShortName], [DeliveryTime], [Description], [Price]) VALUES (2, N'UPS2', N'2-5 Days', N'Get it within 5 days', CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[DeliveryMethods] ([Id], [ShortName], [DeliveryTime], [Description], [Price]) VALUES (3, N'UPS3', N'5-10 Days', N'Slower but cheap', CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[DeliveryMethods] ([Id], [ShortName], [DeliveryTime], [Description], [Price]) VALUES (4, N'FREE', N'1-2 Weeks', N'Free! You get what you pay for', CAST(0.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[DeliveryMethods] OFF
GO
