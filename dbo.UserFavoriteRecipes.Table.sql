USE [CR]
GO
/****** Object:  Table [dbo].[UserFavoriteRecipes]    Script Date: 27-03-2025 18:34:05 ******/
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
SET IDENTITY_INSERT [dbo].[UserFavoriteRecipes] ON 

INSERT [dbo].[UserFavoriteRecipes] ([Id], [AppUserId], [RecipeId]) VALUES (1013, N'7bb052c4-ef8b-431f-ab28-7cf3530963d8', 3)
SET IDENTITY_INSERT [dbo].[UserFavoriteRecipes] OFF
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
