USE [CR]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 27-03-2025 18:34:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Price] [int] NOT NULL,
	[Brand] [nvarchar](max) NOT NULL,
	[ImgUrl] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (1, N'Flour', 110, N'Aata Ghar', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1739340822/Culinary%20Realm/Products/flour_vjebge.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (2, N'Milk', 35, N'Amul', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1739340822/Culinary%20Realm/Products/milk_fvf2p5.png')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (3, N'Sugar', 70, N'Nature', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058374/Culinary%20Realm/Products/sugar_zeh3sw.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (4, N'Salt', 60, N'Tata', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058374/Culinary%20Realm/Products/salttata_aihcwd.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (5, N'Lemon', 15, N'', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058361/Culinary%20Realm/Products/lemon_scch7p.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (6, N'Eggs', 300, N'', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1739340821/Culinary%20Realm/Products/eggs_v27y68.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (7, N'Vanilla Essence', 120, N'Bokefrills', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1739340821/Culinary%20Realm/Products/vanillaessence_t2hv3l.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (8, N'Cream Cheese', 200, N'Philadelphia', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1739340822/Culinary%20Realm/Products/creamcheese_snkj7m.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (9, N'Heavy Cream', 220, N'Tuscan', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1739340822/Culinary%20Realm/Products/heavycream_tvjwtn.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (10, N'Strawberry', 150, N'', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1739340822/Culinary%20Realm/Products/strawberry_gmhdlm.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (11, N'Blueberry', 300, N'', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1739340821/Culinary%20Realm/Products/blueberry_wnln4o.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (12, N'Raspberry', 250, N'', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1739340821/Culinary%20Realm/Products/raspberry_ncyvda.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (13, N'Blackberry', 100, N'', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1739340821/Culinary%20Realm/Products/blackberry_z0ccj5.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (14, N'Cornstarch', 85, N'Weikfield', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1739340821/Culinary%20Realm/Products/cornstarch_di202b.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (15, N'Golden Potatos', 60, N'', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058375/Culinary%20Realm/Products/goldenpotato_qqsihs.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (16, N'Chaat Masala', 50, N'Kitchen King', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058374/Culinary%20Realm/Products/chaatmasala_mtozek.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (17, N'Black Salt', 30, N'Kitchen King', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058374/Culinary%20Realm/Products/blacksalt_zvhci8.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (18, N'Cumin Powder', 50, N'Kitchen King', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058374/Culinary%20Realm/Products/blacksalt_zvhci8.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (19, N'Red Chilli', 50, N'Kitchen King', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058372/Culinary%20Realm/Products/redchilli_ishg39.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (20, N'Red Onions', 80, N'', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058372/Culinary%20Realm/Products/redonions_myeqfq.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (21, N'Coriander Chutney', 110, N'Nature', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058371/Culinary%20Realm/Products/corianderchutney_ldqphb.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (22, N'Tamarind Chutney', 110, N'Nature', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058371/Culinary%20Realm/Products/tamarindchutney_gmyej0.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (23, N'Coriander Leaves', 5, N'', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058371/Culinary%20Realm/Products/corianderleaves_dbk7lu.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (24, N'Sev', 10, N'Nature', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058371/Culinary%20Realm/Products/sev_kpkro4.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (25, N'Pomegranate', 30, N'', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058370/Culinary%20Realm/Products/pomegranate_whdhph.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (26, N'Monaco Biscuit', 70, N'Parle', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058368/Culinary%20Realm/Products/monaco_k8dt2w.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (27, N'Cauliflower', 30, N'', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058367/Culinary%20Realm/Products/cauliflower_cuuquv.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (28, N'Olive Oil', 150, N'Nature', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058367/Culinary%20Realm/Products/oliveoil_qfdksh.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (29, N'Bell peppers', 80, N'', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058366/Culinary%20Realm/Products/bellpeppers_vsmtta.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (30, N'Scallions', 60, N'', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058365/Culinary%20Realm/Products/scallions_lupl9u.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (31, N'Parsley', 40, N'', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058364/Culinary%20Realm/Products/parsley_v7lyp0.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (32, N'Basil', 50, N'', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058364/Culinary%20Realm/Products/basil_qti81s.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (33, N'Chilli flakes', 150, N'Chings', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058361/Culinary%20Realm/Products/chilliflakes_fd20c1.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (34, N'Turmeric Powder', 150, N'Chings', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058360/Culinary%20Realm/Products/turmericpowder_xwo2fr.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (35, N'Pepper Powder', 150, N'Chings', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058356/Culinary%20Realm/Products/pepper_eavdaj.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (36, N'Butter', 150, N'Amul', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058356/Culinary%20Realm/Products/butter_jvuh3g.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (37, N'Kalonji', 150, N'Amul', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058356/Culinary%20Realm/Products/kalonji_pq3c8s.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (38, N'Dry Garlic Chutney', 150, N'Amul', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058355/Culinary%20Realm/Products/drygarlicchutney_khbziv.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (39, N'Shredded Slaw', 150, N'', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058355/Culinary%20Realm/Products/shreddedslaw_me0sig.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (40, N'Slider Buns', 150, N'', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058352/Culinary%20Realm/Products/sliderbuns_ojxcte.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (41, N'Batata Vada', 150, N'', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058351/Culinary%20Realm/Products/batatavada_cgdu84.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (42, N'Pepper jack cheese', 150, N'Amul', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058351/Culinary%20Realm/Products/pepperjackcheese_w3zwis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (43, N'Green Chilli', 10, N'', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058349/Culinary%20Realm/Products/greenchilli_c9xpdx.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (44, N'Oil', 110, N'', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058347/Culinary%20Realm/Products/oil_tbkbhn.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (45, N'Red whole chilli', 15, N'', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058347/Culinary%20Realm/Products/redchilliwhole_dlvbo2.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (46, N'Vinegar', 110, N'Chings', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058347/Culinary%20Realm/Products/vinegar_cpylq1.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (47, N'Garlic', 110, N'', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058343/Culinary%20Realm/Products/garlic_ixancd.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (48, N'Honey', 110, N'Dabur', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058343/Culinary%20Realm/Products/honey_tflx5h.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (49, N'Ketchup', 110, N'Dabur', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058342/Culinary%20Realm/Products/ketchup_xadfzd.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (50, N'Peanut Oil', 120, N'', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058342/Culinary%20Realm/Products/peanutoil_qf7uvp.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (51, N'Ginger Paste', 120, N'Dabur', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058342/Culinary%20Realm/Products/gingerpaste_ghassl.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (52, N'Cabbage', 20, N'', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058341/Culinary%20Realm/Products/cabbage_rug7rr.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (53, N'Dark Soy Sauce', 220, N'Chings', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058338/Culinary%20Realm/Products/darksoysauce_aekvr0.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (54, N'Light Soy Sauce', 220, N'Chings', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058338/Culinary%20Realm/Products/lightsoysauce_tdwcw1.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (55, N'Red Garlic Sauce', 220, N'Chings', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058338/Culinary%20Realm/Products/redgarlic_hc6wqr.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (56, N'Green Chilli Sauce', 220, N'Chings', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058337/Culinary%20Realm/Products/greenchillisauce_rhvdap.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (57, N'Ajinomoto', 220, N'Chings', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058337/Culinary%20Realm/Products/ajinomoto_bjg85y.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (58, N'Sriracha', 220, N'Chings', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058337/Culinary%20Realm/Products/sriracha_lxzh8y.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (59, N'White Pepper', 220, N'Nature', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058337/Culinary%20Realm/Products/whitepepper_oyx1ae.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Brand], [ImgUrl]) VALUES (60, N'Wonton Wrapper', 220, N'Nature', N'https://res.cloudinary.com/dbwntzehh/image/upload/v1738058338/Culinary%20Realm/Products/wontonwrapper_xzmtkz.jpg')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
