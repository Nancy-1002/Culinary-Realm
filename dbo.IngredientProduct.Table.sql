USE [CR]
GO
/****** Object:  Table [dbo].[IngredientProduct]    Script Date: 27-03-2025 18:34:05 ******/
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
SET IDENTITY_INSERT [dbo].[IngredientProduct] ON 

INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (1, 1, 1)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (2, 2, 3)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (3, 3, 4)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (4, 4, 2)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (5, 6, 6)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (6, 7, 36)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (7, 8, 7)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (8, 9, 5)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (9, 10, 8)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (10, 11, 9)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (11, 12, 10)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (12, 12, 11)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (13, 12, 12)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (14, 12, 13)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (15, 13, 14)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (16, 1002, 15)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (17, 1003, 4)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (18, 1004, 16)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (19, 1005, 3)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (20, 1006, 17)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (21, 1007, 18)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (22, 1008, 19)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (23, 1009, 20)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (24, 1010, 21)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (25, 1011, 22)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (26, 1012, 23)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (27, 1013, 24)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (28, 1014, 25)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (29, 1015, 26)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (30, 1016, 15)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (31, 1017, 28)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (32, 1018, 27)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (33, 1019, 47)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (34, 1020, 29)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (35, 1021, 29)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (36, 1022, 20)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (37, 1023, 30)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (38, 1024, 31)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (39, 1025, 23)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (40, 1026, 32)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (41, 1027, 5)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (42, 1028, 18)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (43, 1029, 19)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (44, 1030, 33)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (45, 1031, 34)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (46, 1032, 35)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (47, 1033, 4)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (48, 1034, 3)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (49, 1035, 36)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (50, 1036, 22)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (51, 1037, 37)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (52, 1038, 16)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (53, 1039, 38)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (54, 1040, 21)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (55, 1041, 39)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (56, 1042, 40)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (57, 1043, 41)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (58, 1044, 42)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (59, 1047, 43)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (60, 1048, 44)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (61, 1049, 45)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (62, 1050, 46)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (63, 1052, 44)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (64, 1053, 47)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (65, 1054, 20)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (66, 1055, 35)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (67, 1056, 3)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (68, 1057, 4)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (69, 1058, 18)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (70, 1059, 48)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (71, 1060, 49)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (72, 1061, 50)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (73, 1062, 20)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (74, 1063, 29)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (75, 1064, 30)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (76, 1065, 47)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (77, 1066, 51)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (78, 1067, 52)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (79, 1068, 53)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (80, 1069, 54)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (81, 1070, 55)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (82, 1071, 56)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (83, 1072, 58)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (84, 1073, 46)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (85, 1074, 4)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (86, 1075, 59)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (87, 1076, 57)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (88, 1077, 3)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (89, 1078, 60)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (1002, 1045, 20)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (1003, 1046, 38)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (1004, 1079, 30)
INSERT [dbo].[IngredientProduct] ([Id], [IngredientId], [ProductId]) VALUES (1005, 1080, 44)
SET IDENTITY_INSERT [dbo].[IngredientProduct] OFF
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
