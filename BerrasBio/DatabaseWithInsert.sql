USE [master]
GO
/****** Object:  Database [BerrasBio]    Script Date: 2022-05-08 08:32:54 ******/
CREATE DATABASE [BerrasBio]
GO
USE [BerrasBio]
GO
CREATE TABLE [dbo].[Bookings](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Show_ID] [int] NOT NULL,
	[NumberOfSeats] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 2022-05-08 08:32:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CoverUrl] [nvarchar](999) NULL,
	[Description] [nvarchar](3000) NULL,
	[Price] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salons]    Script Date: 2022-05-08 08:32:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salons](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[MaxVisitors] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shows]    Script Date: 2022-05-08 08:32:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shows](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Movie_ID] [int] NOT NULL,
	[Salon_ID] [int] NOT NULL,
	[ShowTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bookings] ON 

INSERT [dbo].[Bookings] ([ID], [Show_ID], [NumberOfSeats]) VALUES (2, 1, 12)
INSERT [dbo].[Bookings] ([ID], [Show_ID], [NumberOfSeats]) VALUES (3, 2, 5)
INSERT [dbo].[Bookings] ([ID], [Show_ID], [NumberOfSeats]) VALUES (4, 3, 20)
INSERT [dbo].[Bookings] ([ID], [Show_ID], [NumberOfSeats]) VALUES (6, 2, 2)
INSERT [dbo].[Bookings] ([ID], [Show_ID], [NumberOfSeats]) VALUES (8, 1, 5)
INSERT [dbo].[Bookings] ([ID], [Show_ID], [NumberOfSeats]) VALUES (10, 1, 4)
INSERT [dbo].[Bookings] ([ID], [Show_ID], [NumberOfSeats]) VALUES (11, 2, 43)
INSERT [dbo].[Bookings] ([ID], [Show_ID], [NumberOfSeats]) VALUES (12, 1, 12)
INSERT [dbo].[Bookings] ([ID], [Show_ID], [NumberOfSeats]) VALUES (13, 1, 1)
INSERT [dbo].[Bookings] ([ID], [Show_ID], [NumberOfSeats]) VALUES (14, 1, 4)
INSERT [dbo].[Bookings] ([ID], [Show_ID], [NumberOfSeats]) VALUES (15, 1, 1)
INSERT [dbo].[Bookings] ([ID], [Show_ID], [NumberOfSeats]) VALUES (16, 3, 9)
INSERT [dbo].[Bookings] ([ID], [Show_ID], [NumberOfSeats]) VALUES (17, 3, 5)
INSERT [dbo].[Bookings] ([ID], [Show_ID], [NumberOfSeats]) VALUES (18, 3, 2)
INSERT [dbo].[Bookings] ([ID], [Show_ID], [NumberOfSeats]) VALUES (19, 3, 2)
INSERT [dbo].[Bookings] ([ID], [Show_ID], [NumberOfSeats]) VALUES (20, 3, 9)
INSERT [dbo].[Bookings] ([ID], [Show_ID], [NumberOfSeats]) VALUES (21, 3, 9)
INSERT [dbo].[Bookings] ([ID], [Show_ID], [NumberOfSeats]) VALUES (22, 3, 9)
INSERT [dbo].[Bookings] ([ID], [Show_ID], [NumberOfSeats]) VALUES (23, 3, 9)
INSERT [dbo].[Bookings] ([ID], [Show_ID], [NumberOfSeats]) VALUES (24, 3, 9)
INSERT [dbo].[Bookings] ([ID], [Show_ID], [NumberOfSeats]) VALUES (25, 3, 9)
INSERT [dbo].[Bookings] ([ID], [Show_ID], [NumberOfSeats]) VALUES (26, 3, 3)
INSERT [dbo].[Bookings] ([ID], [Show_ID], [NumberOfSeats]) VALUES (27, 3, 1)
INSERT [dbo].[Bookings] ([ID], [Show_ID], [NumberOfSeats]) VALUES (28, 3, 1)
INSERT [dbo].[Bookings] ([ID], [Show_ID], [NumberOfSeats]) VALUES (29, 3, 3)
SET IDENTITY_INSERT [dbo].[Bookings] OFF
GO
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([ID], [Name], [CoverUrl], [Description], [Price]) VALUES (1, N'Ainbo: Amazonas väktare', N'https://catalog.cinema-api.com/cf/images/ncg-images/a2bf7d7644c441f39b4617dcaab84932.jpg?width=240&version=E014D09A01258F413C7D9872A3BB2F81&format=webp', N'"Ainbo: Amazonas väktare" är berättelsen om en ung flicka som föddes och växte upp i den djupaste djungeln i Amazonas. En dag upptäcker hon att hennes hemland hotas och inser att det finns andra människor i världen förutom hennes folk. Med hjälp av hennes andliga guider, den magra armadillon "Dillo" och den tunga tapiren "Vaca", ger hon sig ut på en resa för att söka hjälp från Amazonas mest kraftfulla modersjäl, den enorma sköldpaddan “Motelo Mama”. Hon kämpar för att rädda sitt paradis mot girighet, exploatering och olaglig guldbrytning. Ainbo måste stoppa förstörelsen och den hotande ondskan av "Yacaruna", den mörkaste demonen som lever i Amazonas. Guidad av sin mors ande är Ainbo fast besluten att rädda sitt land och sitt folk innan det är för sent.', 100.0000)
INSERT [dbo].[Movies] ([ID], [Name], [CoverUrl], [Description], [Price]) VALUES (2, N'Baby-bossen 2: Familjeföretaget', N'https://catalog.cinema-api.com/cf/images/ncg-images/156e1c728c0e4158b85eaa7236de17cf.jpg?width=240&version=AEF2B771F19E95BF429F626A91D95BEC&format=webp', N'Bröderna Templeton - Tim och hans Babyboss-lillebror har blivit vuxna och glidit isär. Tim är gift och hemma-pappa. Ted är hedgefond-VD. Men en ny babyboss med ett banbrytande tillvägagångssätt och inställningen att ”allt är möjligt” kommer att föra dem samman igen... och inspirera till ett nytt familjeföretag.  Användare av tjänsten syntolkning/uppläst text tar del av ljudspåret med sina mobilhörlurar/headset och övrig publik påverkas därmed inte.', 200.0000)
INSERT [dbo].[Movies] ([ID], [Name], [CoverUrl], [Description], [Price]) VALUES (3, N' Alfons och Hemlige Mållgan', N'https://catalog.cinema-api.com/cf/images/ncg-images/b462f3215a7949f18fc2989a0c3e2212.jpg?width=240&version=0F8A88BD6D89968CF187FA3ADC1D975F&format=webp', N'Böckerna om Alfons Åberg har kommit till liv i ett sprillans nytt filmpaket.  Alfons och hemlige Mållgan Mållgan är Alfons hemlige vän. Så hemlig att bara Alfons kan se honom! Mållgan kommer så fort Alfons vill. Men ibland blir pappa väldigt trött på Mållgan.  Lycklige Alfons Åberg Måste julen alltid ta slut? Alfons och pappa vill inte att det ska bli vanlig vardag igen. Men det vill farmor!  God natt, Alfons Åberg Alfons är fyra år och vill inte sova. Han är både törstig, kissnödig och vill att pappa ska läsa en saga till.  Påhittat, skrivet och ritat av Gunilla Bergström', 300.0000)
INSERT [dbo].[Movies] ([ID], [Name], [CoverUrl], [Description], [Price]) VALUES (4, N'1', N'http://1.com', N'1', 1.0000)
SET IDENTITY_INSERT [dbo].[Movies] OFF
GO
SET IDENTITY_INSERT [dbo].[Salons] ON 

INSERT [dbo].[Salons] ([ID], [Name], [MaxVisitors]) VALUES (1, N'Jupiter', 100)
INSERT [dbo].[Salons] ([ID], [Name], [MaxVisitors]) VALUES (2, N'Mars', 50)
SET IDENTITY_INSERT [dbo].[Salons] OFF
GO
SET IDENTITY_INSERT [dbo].[Shows] ON 

INSERT [dbo].[Shows] ([ID], [Movie_ID], [Salon_ID], [ShowTime]) VALUES (1, 1, 1, CAST(N'2022-03-25T19:30:00.000' AS DateTime))
INSERT [dbo].[Shows] ([ID], [Movie_ID], [Salon_ID], [ShowTime]) VALUES (2, 2, 2, CAST(N'2022-03-18T17:30:00.000' AS DateTime))
INSERT [dbo].[Shows] ([ID], [Movie_ID], [Salon_ID], [ShowTime]) VALUES (3, 1, 1, CAST(N'2022-03-18T15:30:00.000' AS DateTime))
INSERT [dbo].[Shows] ([ID], [Movie_ID], [Salon_ID], [ShowTime]) VALUES (4, 3, 2, CAST(N'2022-03-18T19:00:00.000' AS DateTime))
INSERT [dbo].[Shows] ([ID], [Movie_ID], [Salon_ID], [ShowTime]) VALUES (5, 1, 1, CAST(N'2022-03-31T16:45:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Shows] OFF
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings.Show_ID] FOREIGN KEY([Show_ID])
REFERENCES [dbo].[Shows] ([ID])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings.Show_ID]
GO
ALTER TABLE [dbo].[Shows]  WITH CHECK ADD  CONSTRAINT [FK_Shows.Movie_ID] FOREIGN KEY([Movie_ID])
REFERENCES [dbo].[Movies] ([ID])
GO
ALTER TABLE [dbo].[Shows] CHECK CONSTRAINT [FK_Shows.Movie_ID]
GO
ALTER TABLE [dbo].[Shows]  WITH CHECK ADD  CONSTRAINT [FK_Shows.Salon_ID] FOREIGN KEY([Salon_ID])
REFERENCES [dbo].[Salons] ([ID])
GO
ALTER TABLE [dbo].[Shows] CHECK CONSTRAINT [FK_Shows.Salon_ID]
GO
USE [master]
GO