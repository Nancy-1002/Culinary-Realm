USE [CR]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 27-03-2025 18:34:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Line1] [nvarchar](max) NOT NULL,
	[Line2] [nvarchar](max) NULL,
	[City] [nvarchar](max) NOT NULL,
	[State] [nvarchar](max) NOT NULL,
	[ZipCode] [nvarchar](max) NOT NULL,
	[Country] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Addresses] ON 

INSERT [dbo].[Addresses] ([Id], [Line1], [Line2], [City], [State], [ZipCode], [Country]) VALUES (1, N'xyz', N'kowkeoke2', N'wkeo2w2', N'kowkeowk', N'12132', N'Canada')
INSERT [dbo].[Addresses] ([Id], [Line1], [Line2], [City], [State], [ZipCode], [Country]) VALUES (2, N'XYZ Apartment', N'Opp National bank', N'Vadodara', N'Gujarat', N'390002', N'India')
SET IDENTITY_INSERT [dbo].[Addresses] OFF
GO
