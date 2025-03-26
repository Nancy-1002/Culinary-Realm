USE [CR]
GO
/****** Object:  Table [dbo].[UserFavoriteRecipes]    Script Date: 25-03-2025 12:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserFavoriteRecipes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AppUserId] [nvarchar](450) NOT NULL,
	[RecipeId] [int] NOT NULL,
 CONSTRAINT [PK_UserFavoriteRecipes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserFavoriteRecipes_AppUserId]    Script Date: 25-03-2025 12:58:06 ******/
CREATE NONCLUSTERED INDEX [IX_UserFavoriteRecipes_AppUserId] ON [dbo].[UserFavoriteRecipes]
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserFavoriteRecipes_RecipeId]    Script Date: 25-03-2025 12:58:06 ******/
CREATE NONCLUSTERED INDEX [IX_UserFavoriteRecipes_RecipeId] ON [dbo].[UserFavoriteRecipes]
(
	[RecipeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserFavoriteRecipes]  WITH CHECK ADD  CONSTRAINT [FK_UserFavoriteRecipes_AspNetUsers_AppUserId] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserFavoriteRecipes] CHECK CONSTRAINT [FK_UserFavoriteRecipes_AspNetUsers_AppUserId]
GO
ALTER TABLE [dbo].[UserFavoriteRecipes]  WITH CHECK ADD  CONSTRAINT [FK_UserFavoriteRecipes_Recipes_RecipeId] FOREIGN KEY([RecipeId])
REFERENCES [dbo].[Recipes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserFavoriteRecipes] CHECK CONSTRAINT [FK_UserFavoriteRecipes_Recipes_RecipeId]
GO
