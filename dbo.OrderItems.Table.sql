USE [CR]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 27-03-2025 18:34:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemOrdered_ProductId] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[OrderId] [int] NULL,
	[ItemOrdered_Name] [nvarchar](max) NOT NULL,
	[ItemOrdered_PictureUrl] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[OrderItems] ON 

INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductId], [Price], [Quantity], [OrderId], [ItemOrdered_Name], [ItemOrdered_PictureUrl]) VALUES (1, 3, 70, 2, 1, N'Sugar', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058374/Culinary%20Realm/Products/sugar_zeh3sw.jpg')
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductId], [Price], [Quantity], [OrderId], [ItemOrdered_Name], [ItemOrdered_PictureUrl]) VALUES (2, 3, 70, 2, 2, N'Sugar', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058374/Culinary%20Realm/Products/sugar_zeh3sw.jpg')
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductId], [Price], [Quantity], [OrderId], [ItemOrdered_Name], [ItemOrdered_PictureUrl]) VALUES (1002, 41, 150, 2, 1002, N'Batata Vada', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058351/Culinary%20Realm/Products/batatavada_cgdu84.jpg')
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductId], [Price], [Quantity], [OrderId], [ItemOrdered_Name], [ItemOrdered_PictureUrl]) VALUES (1003, 4, 60, 2, 1002, N'Salt', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058374/Culinary%20Realm/Products/salttata_aihcwd.jpg')
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductId], [Price], [Quantity], [OrderId], [ItemOrdered_Name], [ItemOrdered_PictureUrl]) VALUES (1004, 41, 150, 1, 1003, N'Batata Vada', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058351/Culinary%20Realm/Products/batatavada_cgdu84.jpg')
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductId], [Price], [Quantity], [OrderId], [ItemOrdered_Name], [ItemOrdered_PictureUrl]) VALUES (2002, 29, 80, 1, 2002, N'Bell peppers', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058366/Culinary%20Realm/Products/bellpeppers_vsmtta.jpg')
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductId], [Price], [Quantity], [OrderId], [ItemOrdered_Name], [ItemOrdered_PictureUrl]) VALUES (3002, 28, 150, 1, 3002, N'Olive Oil', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058367/Culinary%20Realm/Products/oliveoil_qfdksh.jpg')
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductId], [Price], [Quantity], [OrderId], [ItemOrdered_Name], [ItemOrdered_PictureUrl]) VALUES (3003, 15, 60, 1, 3002, N'Golden Potatos', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058375/Culinary%20Realm/Products/goldenpotato_qqsihs.jpg')
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductId], [Price], [Quantity], [OrderId], [ItemOrdered_Name], [ItemOrdered_PictureUrl]) VALUES (3004, 47, 110, 1, 3002, N'Garlic', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058343/Culinary%20Realm/Products/garlic_ixancd.jpg')
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductId], [Price], [Quantity], [OrderId], [ItemOrdered_Name], [ItemOrdered_PictureUrl]) VALUES (4002, 15, 60, 1, 4002, N'Golden Potatos', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058375/Culinary%20Realm/Products/goldenpotato_qqsihs.jpg')
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductId], [Price], [Quantity], [OrderId], [ItemOrdered_Name], [ItemOrdered_PictureUrl]) VALUES (4003, 16, 50, 1, 4002, N'Chaat Masala', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058374/Culinary%20Realm/Products/chaatmasala_mtozek.jpg')
SET IDENTITY_INSERT [dbo].[OrderItems] OFF
GO
ALTER TABLE [dbo].[OrderItems] ADD  DEFAULT (N'') FOR [ItemOrdered_Name]
GO
ALTER TABLE [dbo].[OrderItems] ADD  DEFAULT (N'') FOR [ItemOrdered_PictureUrl]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Orders_OrderId]
GO
