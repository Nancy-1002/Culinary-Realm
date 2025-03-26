USE [CR]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 25-03-2025 12:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[BuyerEmail] [nvarchar](max) NOT NULL,
	[PaymentSummary_Year] [int] NOT NULL,
	[DeliveryMethodId] [int] NOT NULL,
	[PaymentSummary_Last4] [int] NOT NULL,
	[Subtotal] [int] NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
	[PaymentIntentId] [nvarchar](max) NOT NULL,
	[PaymentSummary_Brand] [nvarchar](max) NULL,
	[PaymentSummary_ExpMonth] [int] NOT NULL,
	[ShippingAddress_City] [nvarchar](max) NOT NULL,
	[ShippingAddress_Country] [nvarchar](max) NOT NULL,
	[ShippingAddress_Line1] [nvarchar](max) NOT NULL,
	[ShippingAddress_Line2] [nvarchar](max) NULL,
	[ShippingAddress_Name] [nvarchar](max) NOT NULL,
	[ShippingAddress_State] [nvarchar](max) NOT NULL,
	[ShippingAddress_ZipCode] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_DeliveryMethodId]    Script Date: 25-03-2025 12:58:06 ******/
CREATE NONCLUSTERED INDEX [IX_Orders_DeliveryMethodId] ON [dbo].[Orders]
(
	[DeliveryMethodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [PaymentSummary_ExpMonth]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (N'') FOR [ShippingAddress_City]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (N'') FOR [ShippingAddress_Country]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (N'') FOR [ShippingAddress_Line1]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (N'') FOR [ShippingAddress_Name]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (N'') FOR [ShippingAddress_State]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (N'') FOR [ShippingAddress_ZipCode]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_DeliveryMethods_DeliveryMethodId] FOREIGN KEY([DeliveryMethodId])
REFERENCES [dbo].[DeliveryMethods] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_DeliveryMethods_DeliveryMethodId]
GO
