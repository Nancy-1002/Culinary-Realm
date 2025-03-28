USE [CR]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 27-03-2025 18:34:05 ******/
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
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [OrderDate], [BuyerEmail], [PaymentSummary_Year], [DeliveryMethodId], [PaymentSummary_Last4], [Subtotal], [Status], [PaymentIntentId], [PaymentSummary_Brand], [PaymentSummary_ExpMonth], [ShippingAddress_City], [ShippingAddress_Country], [ShippingAddress_Line1], [ShippingAddress_Line2], [ShippingAddress_Name], [ShippingAddress_State], [ShippingAddress_ZipCode]) VALUES (1, CAST(N'2025-03-20T11:09:49.4016529' AS DateTime2), N'test1@gmail.com', 0, 1, 4444, 140, N'Pending', N'order_Q91OR7uyJUTZwv', N'Mastercard', 12, N'Vadodara', N'India', N'TP-13', NULL, N'Test 1', N'Gujarat', N'390002')
INSERT [dbo].[Orders] ([Id], [OrderDate], [BuyerEmail], [PaymentSummary_Year], [DeliveryMethodId], [PaymentSummary_Last4], [Subtotal], [Status], [PaymentIntentId], [PaymentSummary_Brand], [PaymentSummary_ExpMonth], [ShippingAddress_City], [ShippingAddress_Country], [ShippingAddress_Line1], [ShippingAddress_Line2], [ShippingAddress_Name], [ShippingAddress_State], [ShippingAddress_ZipCode]) VALUES (2, CAST(N'2025-03-20T11:13:03.3962317' AS DateTime2), N'test1@gmail.com', 2025, 1, 4444, 140, N'Pending', N'order_Q91OR7uyJUTZwv', N'Mastercard', 12, N'Vadodara', N'India', N'TP-13', NULL, N'Test 1', N'Gujarat', N'390002')
INSERT [dbo].[Orders] ([Id], [OrderDate], [BuyerEmail], [PaymentSummary_Year], [DeliveryMethodId], [PaymentSummary_Last4], [Subtotal], [Status], [PaymentIntentId], [PaymentSummary_Brand], [PaymentSummary_ExpMonth], [ShippingAddress_City], [ShippingAddress_Country], [ShippingAddress_Line1], [ShippingAddress_Line2], [ShippingAddress_Name], [ShippingAddress_State], [ShippingAddress_ZipCode]) VALUES (1002, CAST(N'2025-03-21T12:24:30.4334612' AS DateTime2), N'test1@gmail.com', 2025, 2, 1111, 420, N'Pending', N'order_Q9RIytojaF2x8U', N'Visa', 12, N'wkeo2w2', N'Canada', N'xyz', N'kowkeoke2', N'Test 1', N'kowkeowk', N'12132')
INSERT [dbo].[Orders] ([Id], [OrderDate], [BuyerEmail], [PaymentSummary_Year], [DeliveryMethodId], [PaymentSummary_Last4], [Subtotal], [Status], [PaymentIntentId], [PaymentSummary_Brand], [PaymentSummary_ExpMonth], [ShippingAddress_City], [ShippingAddress_Country], [ShippingAddress_Line1], [ShippingAddress_Line2], [ShippingAddress_Name], [ShippingAddress_State], [ShippingAddress_ZipCode]) VALUES (1003, CAST(N'2025-03-21T12:41:18.4955919' AS DateTime2), N'test1@gmail.com', 2025, 2, 1111, 150, N'Pending', N'order_Q9RZva9W2TgqJA', N'Visa', 12, N'wkeo2w2', N'Canada', N'xyz', N'kowkeoke2', N'Test 1', N'kowkeowk', N'12132')
INSERT [dbo].[Orders] ([Id], [OrderDate], [BuyerEmail], [PaymentSummary_Year], [DeliveryMethodId], [PaymentSummary_Last4], [Subtotal], [Status], [PaymentIntentId], [PaymentSummary_Brand], [PaymentSummary_ExpMonth], [ShippingAddress_City], [ShippingAddress_Country], [ShippingAddress_Line1], [ShippingAddress_Line2], [ShippingAddress_Name], [ShippingAddress_State], [ShippingAddress_ZipCode]) VALUES (2002, CAST(N'2025-03-24T11:17:22.7679210' AS DateTime2), N'test1@gmail.com', 2025, 2, 1111, 80, N'PaymentRecevied', N'order_QAbkkyZlKfN1rL', N'Visa', 12, N'wkeo2w2', N'Canada', N'xyz', N'kowkeoke2', N'Test 1', N'kowkeowk', N'12132')
INSERT [dbo].[Orders] ([Id], [OrderDate], [BuyerEmail], [PaymentSummary_Year], [DeliveryMethodId], [PaymentSummary_Last4], [Subtotal], [Status], [PaymentIntentId], [PaymentSummary_Brand], [PaymentSummary_ExpMonth], [ShippingAddress_City], [ShippingAddress_Country], [ShippingAddress_Line1], [ShippingAddress_Line2], [ShippingAddress_Name], [ShippingAddress_State], [ShippingAddress_ZipCode]) VALUES (3002, CAST(N'2025-03-25T13:06:35.2497401' AS DateTime2), N'nancy.shah1002@gmail.com', 2025, 2, 1111, 320, N'PaymentRecevied', N'order_QB29CaQCIDRXP7', N'Visa', 12, N'Vadodara', N'India', N'XYZ Apartment', N'Opp National bank', N'Nancy Shah', N'Gujarat', N'390002')
INSERT [dbo].[Orders] ([Id], [OrderDate], [BuyerEmail], [PaymentSummary_Year], [DeliveryMethodId], [PaymentSummary_Last4], [Subtotal], [Status], [PaymentIntentId], [PaymentSummary_Brand], [PaymentSummary_ExpMonth], [ShippingAddress_City], [ShippingAddress_Country], [ShippingAddress_Line1], [ShippingAddress_Line2], [ShippingAddress_Name], [ShippingAddress_State], [ShippingAddress_ZipCode]) VALUES (4002, CAST(N'2025-03-26T12:55:18.6254512' AS DateTime2), N'nancy.shah1002@gmail.com', 2025, 2, 1111, 110, N'PaymentRecevied', N'order_QBQU6rlV3utpnG', N'Visa', 12, N'Vadodara', N'India', N'XYZ Apartment', N'Opp National bank', N'Nancy Shah', N'Gujarat', N'390002')
SET IDENTITY_INSERT [dbo].[Orders] OFF
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
