USE [CR]
GO
/****** Object:  Table [dbo].[IngredientProduct]    Script Date: 25-03-2025 12:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IngredientProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IngredientId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_IngredientProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_IngredientProduct_IngredientId]    Script Date: 25-03-2025 12:58:06 ******/
CREATE NONCLUSTERED INDEX [IX_IngredientProduct_IngredientId] ON [dbo].[IngredientProduct]
(
	[IngredientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_IngredientProduct_ProductId]    Script Date: 25-03-2025 12:58:06 ******/
CREATE NONCLUSTERED INDEX [IX_IngredientProduct_ProductId] ON [dbo].[IngredientProduct]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[IngredientProduct]  WITH CHECK ADD  CONSTRAINT [FK_IngredientProduct_Ingredients_IngredientId] FOREIGN KEY([IngredientId])
REFERENCES [dbo].[Ingredients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IngredientProduct] CHECK CONSTRAINT [FK_IngredientProduct_Ingredients_IngredientId]
GO
ALTER TABLE [dbo].[IngredientProduct]  WITH CHECK ADD  CONSTRAINT [FK_IngredientProduct_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IngredientProduct] CHECK CONSTRAINT [FK_IngredientProduct_Products_ProductId]
GO
