USE [master]
GO
/****** Object:  Database [database]    Script Date: 24.01.2025 13:40:15 ******/
CREATE DATABASE [database]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'database', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\database.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'database_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\database_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [database] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [database].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [database] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [database] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [database] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [database] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [database] SET ARITHABORT OFF 
GO
ALTER DATABASE [database] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [database] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [database] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [database] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [database] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [database] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [database] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [database] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [database] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [database] SET  DISABLE_BROKER 
GO
ALTER DATABASE [database] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [database] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [database] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [database] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [database] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [database] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [database] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [database] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [database] SET  MULTI_USER 
GO
ALTER DATABASE [database] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [database] SET DB_CHAINING OFF 
GO
ALTER DATABASE [database] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [database] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [database] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [database] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [database] SET QUERY_STORE = OFF
GO
USE [database]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 24.01.2025 13:40:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 24.01.2025 13:40:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufactorer]    Script Date: 24.01.2025 13:40:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufactorer](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Manufactorer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 24.01.2025 13:40:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] NOT NULL,
	[FirstDate] [datetime] NOT NULL,
	[LastDate] [datetime] NOT NULL,
	[Amount] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[UserId] [int] NULL,
	[PickPointId] [int] NOT NULL,
	[Code] [int] NOT NULL,
	[Status] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickPoint]    Script Date: 24.01.2025 13:40:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickPoint](
	[PickPointId] [int] NOT NULL,
	[Code] [int] NOT NULL,
	[CityId] [int] NOT NULL,
	[Street] [nvarchar](100) NOT NULL,
	[House] [int] NOT NULL,
 CONSTRAINT [PK_PickPoint] PRIMARY KEY CLUSTERED 
(
	[PickPointId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 24.01.2025 13:40:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] NOT NULL,
	[Article] [nvarchar](100) NOT NULL,
	[ProductNameId] [int] NOT NULL,
	[Decription] [nvarchar](300) NOT NULL,
	[TypeProduct] [nvarchar](5) NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[Discount] [int] NOT NULL,
	[ManufactorerId] [int] NOT NULL,
	[SupplierId] [int] NOT NULL,
	[CategoryId] [int] NULL,
	[ActiveDiscount] [int] NULL,
	[AllAmount] [int] NULL,
	[PhotoName] [nvarchar](200) NULL,
	[PhotoProduct] [image] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductName]    Script Date: 24.01.2025 13:40:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductName](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ProductName] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 24.01.2025 13:40:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 24.01.2025 13:40:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 24.01.2025 13:40:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[MiddleName] [nvarchar](100) NOT NULL,
	[Login] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Category] ([Id], [Name]) VALUES (1, N'Для животных')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2, N'Товары для кошек')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (3, N'Товары для собак')
GO
INSERT [dbo].[City] ([Id], [Name]) VALUES (1, N' г. Нефтеюганск')
GO
INSERT [dbo].[Manufactorer] ([Id], [Name]) VALUES (1, N'Cat Chow')
INSERT [dbo].[Manufactorer] ([Id], [Name]) VALUES (2, N'Chappy')
INSERT [dbo].[Manufactorer] ([Id], [Name]) VALUES (3, N'Dog Chow')
INSERT [dbo].[Manufactorer] ([Id], [Name]) VALUES (4, N'Dreames')
INSERT [dbo].[Manufactorer] ([Id], [Name]) VALUES (5, N'Fancy Pets')
INSERT [dbo].[Manufactorer] ([Id], [Name]) VALUES (6, N'LIKER')
INSERT [dbo].[Manufactorer] ([Id], [Name]) VALUES (7, N'Nobby')
INSERT [dbo].[Manufactorer] ([Id], [Name]) VALUES (8, N'Pro Plan')
INSERT [dbo].[Manufactorer] ([Id], [Name]) VALUES (9, N'TitBit')
INSERT [dbo].[Manufactorer] ([Id], [Name]) VALUES (10, N'Triol')
INSERT [dbo].[Manufactorer] ([Id], [Name]) VALUES (11, N'trixie')
INSERT [dbo].[Manufactorer] ([Id], [Name]) VALUES (12, N'True Touch')
INSERT [dbo].[Manufactorer] ([Id], [Name]) VALUES (13, N'ZooM')
GO
INSERT [dbo].[Order] ([OrderId], [FirstDate], [LastDate], [Amount], [ProductId], [UserId], [PickPointId], [Code], [Status]) VALUES (1, CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2022-05-12T00:00:00.000' AS DateTime), 15, 30, NULL, 25, 601, N'Новый ')
INSERT [dbo].[Order] ([OrderId], [FirstDate], [LastDate], [Amount], [ProductId], [UserId], [PickPointId], [Code], [Status]) VALUES (2, CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2022-05-12T00:00:00.000' AS DateTime), 15, 10, NULL, 20, 602, N'Новый ')
INSERT [dbo].[Order] ([OrderId], [FirstDate], [LastDate], [Amount], [ProductId], [UserId], [PickPointId], [Code], [Status]) VALUES (3, CAST(N'2022-05-08T00:00:00.000' AS DateTime), CAST(N'2022-05-14T00:00:00.000' AS DateTime), 10, 9, 10, 22, 603, N'Завершен')
INSERT [dbo].[Order] ([OrderId], [FirstDate], [LastDate], [Amount], [ProductId], [UserId], [PickPointId], [Code], [Status]) VALUES (4, CAST(N'2022-05-08T00:00:00.000' AS DateTime), CAST(N'2022-05-14T00:00:00.000' AS DateTime), 1, 11, NULL, 24, 604, N'Завершен')
INSERT [dbo].[Order] ([OrderId], [FirstDate], [LastDate], [Amount], [ProductId], [UserId], [PickPointId], [Code], [Status]) VALUES (5, CAST(N'2022-05-10T00:00:00.000' AS DateTime), CAST(N'2022-05-16T00:00:00.000' AS DateTime), 1, 23, NULL, 25, 605, N'Завершен')
INSERT [dbo].[Order] ([OrderId], [FirstDate], [LastDate], [Amount], [ProductId], [UserId], [PickPointId], [Code], [Status]) VALUES (6, CAST(N'2022-05-11T00:00:00.000' AS DateTime), CAST(N'2022-05-17T00:00:00.000' AS DateTime), 1, 16, 7, 28, 606, N'Завершен')
INSERT [dbo].[Order] ([OrderId], [FirstDate], [LastDate], [Amount], [ProductId], [UserId], [PickPointId], [Code], [Status]) VALUES (7, CAST(N'2022-05-12T00:00:00.000' AS DateTime), CAST(N'2022-05-18T00:00:00.000' AS DateTime), 2, 14, NULL, 36, 607, N'Новый ')
INSERT [dbo].[Order] ([OrderId], [FirstDate], [LastDate], [Amount], [ProductId], [UserId], [PickPointId], [Code], [Status]) VALUES (8, CAST(N'2022-05-13T00:00:00.000' AS DateTime), CAST(N'2022-05-19T00:00:00.000' AS DateTime), 1, 19, NULL, 32, 608, N'Новый ')
INSERT [dbo].[Order] ([OrderId], [FirstDate], [LastDate], [Amount], [ProductId], [UserId], [PickPointId], [Code], [Status]) VALUES (9, CAST(N'2022-05-15T00:00:00.000' AS DateTime), CAST(N'2022-05-21T00:00:00.000' AS DateTime), 1, 27, NULL, 34, 609, N'Новый ')
INSERT [dbo].[Order] ([OrderId], [FirstDate], [LastDate], [Amount], [ProductId], [UserId], [PickPointId], [Code], [Status]) VALUES (10, CAST(N'2022-05-15T00:00:00.000' AS DateTime), CAST(N'2022-05-21T00:00:00.000' AS DateTime), 1, 21, 7, 36, 610, N'Завершен')
INSERT [dbo].[Order] ([OrderId], [FirstDate], [LastDate], [Amount], [ProductId], [UserId], [PickPointId], [Code], [Status]) VALUES (11, CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2022-05-12T00:00:00.000' AS DateTime), 1, 12, NULL, 25, 601, N'Новый ')
INSERT [dbo].[Order] ([OrderId], [FirstDate], [LastDate], [Amount], [ProductId], [UserId], [PickPointId], [Code], [Status]) VALUES (12, CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2022-05-12T00:00:00.000' AS DateTime), 15, 29, NULL, 20, 602, N'Новый ')
INSERT [dbo].[Order] ([OrderId], [FirstDate], [LastDate], [Amount], [ProductId], [UserId], [PickPointId], [Code], [Status]) VALUES (13, CAST(N'2022-05-08T00:00:00.000' AS DateTime), CAST(N'2022-05-14T00:00:00.000' AS DateTime), 10, 25, 10, 22, 603, N'Завершен')
INSERT [dbo].[Order] ([OrderId], [FirstDate], [LastDate], [Amount], [ProductId], [UserId], [PickPointId], [Code], [Status]) VALUES (14, CAST(N'2022-05-08T00:00:00.000' AS DateTime), CAST(N'2022-05-14T00:00:00.000' AS DateTime), 2, 5, NULL, 24, 604, N'Завершен')
INSERT [dbo].[Order] ([OrderId], [FirstDate], [LastDate], [Amount], [ProductId], [UserId], [PickPointId], [Code], [Status]) VALUES (15, CAST(N'2022-05-10T00:00:00.000' AS DateTime), CAST(N'2022-05-16T00:00:00.000' AS DateTime), 10, 6, NULL, 25, 605, N'Завершен')
INSERT [dbo].[Order] ([OrderId], [FirstDate], [LastDate], [Amount], [ProductId], [UserId], [PickPointId], [Code], [Status]) VALUES (16, CAST(N'2022-05-11T00:00:00.000' AS DateTime), CAST(N'2022-05-17T00:00:00.000' AS DateTime), 1, 4, 7, 28, 606, N'Завершен')
INSERT [dbo].[Order] ([OrderId], [FirstDate], [LastDate], [Amount], [ProductId], [UserId], [PickPointId], [Code], [Status]) VALUES (17, CAST(N'2022-05-12T00:00:00.000' AS DateTime), CAST(N'2022-05-18T00:00:00.000' AS DateTime), 2, 22, NULL, 36, 607, N'Новый ')
INSERT [dbo].[Order] ([OrderId], [FirstDate], [LastDate], [Amount], [ProductId], [UserId], [PickPointId], [Code], [Status]) VALUES (18, CAST(N'2022-05-13T00:00:00.000' AS DateTime), CAST(N'2022-05-19T00:00:00.000' AS DateTime), 1, 27, NULL, 32, 608, N'Новый ')
INSERT [dbo].[Order] ([OrderId], [FirstDate], [LastDate], [Amount], [ProductId], [UserId], [PickPointId], [Code], [Status]) VALUES (19, CAST(N'2022-05-15T00:00:00.000' AS DateTime), CAST(N'2022-05-21T00:00:00.000' AS DateTime), 1, 20, NULL, 34, 609, N'Новый ')
INSERT [dbo].[Order] ([OrderId], [FirstDate], [LastDate], [Amount], [ProductId], [UserId], [PickPointId], [Code], [Status]) VALUES (20, CAST(N'2022-05-15T00:00:00.000' AS DateTime), CAST(N'2022-05-21T00:00:00.000' AS DateTime), 1, 28, 7, 36, 610, N'Завершен')
GO
INSERT [dbo].[PickPoint] ([PickPointId], [Code], [CityId], [Street], [House]) VALUES (1, 344288, 1, N' ул. Чехова', 1)
INSERT [dbo].[PickPoint] ([PickPointId], [Code], [CityId], [Street], [House]) VALUES (2, 614164, 1, N'  ул. Степная', 30)
INSERT [dbo].[PickPoint] ([PickPointId], [Code], [CityId], [Street], [House]) VALUES (3, 394242, 1, N' ул. Коммунистическая', 43)
INSERT [dbo].[PickPoint] ([PickPointId], [Code], [CityId], [Street], [House]) VALUES (4, 660540, 1, N' ул. Солнечная', 25)
INSERT [dbo].[PickPoint] ([PickPointId], [Code], [CityId], [Street], [House]) VALUES (5, 125837, 1, N' ул. Шоссейная', 40)
INSERT [dbo].[PickPoint] ([PickPointId], [Code], [CityId], [Street], [House]) VALUES (6, 125703, 1, N' ул. Партизанская', 49)
INSERT [dbo].[PickPoint] ([PickPointId], [Code], [CityId], [Street], [House]) VALUES (7, 625283, 1, N' ул. Победы', 46)
INSERT [dbo].[PickPoint] ([PickPointId], [Code], [CityId], [Street], [House]) VALUES (8, 614611, 1, N' ул. Молодежная', 50)
INSERT [dbo].[PickPoint] ([PickPointId], [Code], [CityId], [Street], [House]) VALUES (9, 454311, 1, N' ул. Новая', 19)
INSERT [dbo].[PickPoint] ([PickPointId], [Code], [CityId], [Street], [House]) VALUES (10, 660007, 1, N' ул. Октябрьская', 19)
INSERT [dbo].[PickPoint] ([PickPointId], [Code], [CityId], [Street], [House]) VALUES (11, 603036, 1, N' ул. Садовая', 4)
INSERT [dbo].[PickPoint] ([PickPointId], [Code], [CityId], [Street], [House]) VALUES (12, 450983, 1, N' ул. Комсомольская', 26)
INSERT [dbo].[PickPoint] ([PickPointId], [Code], [CityId], [Street], [House]) VALUES (13, 394782, 1, N' ул. Чехова', 3)
INSERT [dbo].[PickPoint] ([PickPointId], [Code], [CityId], [Street], [House]) VALUES (14, 603002, 1, N' ул. Дзержинского', 28)
INSERT [dbo].[PickPoint] ([PickPointId], [Code], [CityId], [Street], [House]) VALUES (15, 450558, 1, N' ул. Набережная', 30)
INSERT [dbo].[PickPoint] ([PickPointId], [Code], [CityId], [Street], [House]) VALUES (16, 394060, 1, N' ул. Фрунзе', 43)
INSERT [dbo].[PickPoint] ([PickPointId], [Code], [CityId], [Street], [House]) VALUES (17, 410661, 1, N' ул. Школьная', 50)
INSERT [dbo].[PickPoint] ([PickPointId], [Code], [CityId], [Street], [House]) VALUES (18, 625590, 1, N' ул. Коммунистическая', 20)
INSERT [dbo].[PickPoint] ([PickPointId], [Code], [CityId], [Street], [House]) VALUES (19, 625683, 1, N' ул. 8 Марта', 47)
INSERT [dbo].[PickPoint] ([PickPointId], [Code], [CityId], [Street], [House]) VALUES (20, 400562, 1, N' ул. Зеленая', 32)
INSERT [dbo].[PickPoint] ([PickPointId], [Code], [CityId], [Street], [House]) VALUES (21, 614510, 1, N' ул. Маяковского', 47)
INSERT [dbo].[PickPoint] ([PickPointId], [Code], [CityId], [Street], [House]) VALUES (22, 410542, 1, N' ул. Светлая', 46)
INSERT [dbo].[PickPoint] ([PickPointId], [Code], [CityId], [Street], [House]) VALUES (23, 620839, 1, N' ул. Цветочная', 8)
INSERT [dbo].[PickPoint] ([PickPointId], [Code], [CityId], [Street], [House]) VALUES (24, 443890, 1, N' ул. Коммунистическая', 1)
INSERT [dbo].[PickPoint] ([PickPointId], [Code], [CityId], [Street], [House]) VALUES (25, 603379, 1, N' ул. Спортивная', 46)
INSERT [dbo].[PickPoint] ([PickPointId], [Code], [CityId], [Street], [House]) VALUES (26, 603721, 1, N' ул. Гоголя', 41)
INSERT [dbo].[PickPoint] ([PickPointId], [Code], [CityId], [Street], [House]) VALUES (27, 410172, 1, N' ул. Северная', 13)
INSERT [dbo].[PickPoint] ([PickPointId], [Code], [CityId], [Street], [House]) VALUES (28, 420151, 1, N' ул. Вишневая', 32)
INSERT [dbo].[PickPoint] ([PickPointId], [Code], [CityId], [Street], [House]) VALUES (29, 125061, 1, N' ул. Подгорная', 8)
INSERT [dbo].[PickPoint] ([PickPointId], [Code], [CityId], [Street], [House]) VALUES (30, 630370, 1, N' ул. Шоссейная', 24)
INSERT [dbo].[PickPoint] ([PickPointId], [Code], [CityId], [Street], [House]) VALUES (31, 614753, 1, N' ул. Полевая', 35)
INSERT [dbo].[PickPoint] ([PickPointId], [Code], [CityId], [Street], [House]) VALUES (32, 426030, 1, N' ул. Маяковского', 44)
INSERT [dbo].[PickPoint] ([PickPointId], [Code], [CityId], [Street], [House]) VALUES (33, 450375, 1, N'ул. Клубная', 44)
INSERT [dbo].[PickPoint] ([PickPointId], [Code], [CityId], [Street], [House]) VALUES (34, 625560, 1, N' ул. Некрасова', 12)
INSERT [dbo].[PickPoint] ([PickPointId], [Code], [CityId], [Street], [House]) VALUES (35, 630201, 1, N' ул. Комсомольская', 17)
INSERT [dbo].[PickPoint] ([PickPointId], [Code], [CityId], [Street], [House]) VALUES (36, 190949, 1, N' ул. Мичурина', 26)
GO
INSERT [dbo].[Product] ([ProductId], [Article], [ProductNameId], [Decription], [TypeProduct], [Price], [Discount], [ManufactorerId], [SupplierId], [CategoryId], [ActiveDiscount], [AllAmount], [PhotoName], [PhotoProduct]) VALUES (1, N'B427R5', 5, N'Миска для животных Triol "Стрекоза", 450 мл', N'шт.', CAST(400 AS Decimal(18, 0)), 15, 10, 2, 1, 4, 5, N'', NULL)
INSERT [dbo].[Product] ([ProductId], [Article], [ProductNameId], [Decription], [TypeProduct], [Price], [Discount], [ManufactorerId], [SupplierId], [CategoryId], [ActiveDiscount], [AllAmount], [PhotoName], [PhotoProduct]) VALUES (2, N'D356R4', 6, N'Мячик для собак TRIXIE DentaFun (32942) зеленый / белый', N'шт.', CAST(600 AS Decimal(18, 0)), 15, 11, 1, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[Product] ([ProductId], [Article], [ProductNameId], [Decription], [TypeProduct], [Price], [Discount], [ManufactorerId], [SupplierId], [CategoryId], [ActiveDiscount], [AllAmount], [PhotoName], [PhotoProduct]) VALUES (3, N'D563F4', 1, N'Игрушка для собак Triol Бобер 41 см 12141053 бежевый', N'шт.', CAST(600 AS Decimal(18, 0)), 10, 10, 1, 3, 5, 5, N'', NULL)
INSERT [dbo].[Product] ([ProductId], [Article], [ProductNameId], [Decription], [TypeProduct], [Price], [Discount], [ManufactorerId], [SupplierId], [CategoryId], [ActiveDiscount], [AllAmount], [PhotoName], [PhotoProduct]) VALUES (4, N'D643B5', 7, N'Сухой корм для котят CAT CHOW с высоким содержанием домашней птицы', N'шт.', CAST(4100 AS Decimal(18, 0)), 30, 1, 1, 2, 4, 9, N'', NULL)
INSERT [dbo].[Product] ([ProductId], [Article], [ProductNameId], [Decription], [TypeProduct], [Price], [Discount], [ManufactorerId], [SupplierId], [CategoryId], [ActiveDiscount], [AllAmount], [PhotoName], [PhotoProduct]) VALUES (5, N'E345R4', 1, N'Игрушка для животных «Котик» с кошачьей мятой FANCY PETS', N'шт.', CAST(199 AS Decimal(18, 0)), 5, 5, 2, 2, 5, 7, N'E345R4.jpg', NULL)
INSERT [dbo].[Product] ([ProductId], [Article], [ProductNameId], [Decription], [TypeProduct], [Price], [Discount], [ManufactorerId], [SupplierId], [CategoryId], [ActiveDiscount], [AllAmount], [PhotoName], [PhotoProduct]) VALUES (6, N'E431R5', 3, N'Лакомство для собак Triol Кость из жил 7.5 см, 4шт. в уп.', N'шт.', CAST(170 AS Decimal(18, 0)), 5, 10, 2, 3, 5, 5, N'E431R5.png', NULL)
INSERT [dbo].[Product] ([ProductId], [Article], [ProductNameId], [Decription], [TypeProduct], [Price], [Discount], [ManufactorerId], [SupplierId], [CategoryId], [ActiveDiscount], [AllAmount], [PhotoName], [PhotoProduct]) VALUES (7, N'E434U6', 3, N'Лакомство для собак Titbit Лакомый кусочек Нарезка из говядины, 80 г', N'шт.', CAST(140 AS Decimal(18, 0)), 20, 9, 2, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[Product] ([ProductId], [Article], [ProductNameId], [Decription], [TypeProduct], [Price], [Discount], [ManufactorerId], [SupplierId], [CategoryId], [ActiveDiscount], [AllAmount], [PhotoName], [PhotoProduct]) VALUES (8, N'E466T6', 2, N'Клетка для собак Triol 30671002 61х45.5х52 см серый/белый', N'шт.', CAST(3500 AS Decimal(18, 0)), 30, 10, 2, 3, 5, 3, N'', NULL)
INSERT [dbo].[Product] ([ProductId], [Article], [ProductNameId], [Decription], [TypeProduct], [Price], [Discount], [ManufactorerId], [SupplierId], [CategoryId], [ActiveDiscount], [AllAmount], [PhotoName], [PhotoProduct]) VALUES (9, N'E532Q5', 3, N'Лакомство для собак Titbit Печенье Био Десерт с лососем стандарт, 350 г', N'шт.', CAST(166 AS Decimal(18, 0)), 15, 9, 1, 3, 5, 18, N'E532Q5.jpg', NULL)
INSERT [dbo].[Product] ([ProductId], [Article], [ProductNameId], [Decription], [TypeProduct], [Price], [Discount], [ManufactorerId], [SupplierId], [CategoryId], [ActiveDiscount], [AllAmount], [PhotoName], [PhotoProduct]) VALUES (10, N'F432F4', 7, N'Сухой корм для кошек Pro Plan с чувствительным пищеварением', N'шт.', CAST(1200 AS Decimal(18, 0)), 10, 8, 2, 2, 3, 15, N'F432F4.jpg', NULL)
INSERT [dbo].[Product] ([ProductId], [Article], [ProductNameId], [Decription], [TypeProduct], [Price], [Discount], [ManufactorerId], [SupplierId], [CategoryId], [ActiveDiscount], [AllAmount], [PhotoName], [PhotoProduct]) VALUES (11, N'G345E4', 6, N'Мячик для собак LIKER Мячик Лайкер (6294) оранжевый', N'шт.', CAST(300 AS Decimal(18, 0)), 5, 6, 2, 3, 3, 19, N'G345E4.jpg', NULL)
INSERT [dbo].[Product] ([ProductId], [Article], [ProductNameId], [Decription], [TypeProduct], [Price], [Discount], [ManufactorerId], [SupplierId], [CategoryId], [ActiveDiscount], [AllAmount], [PhotoName], [PhotoProduct]) VALUES (12, N'G453T5', 8, N'Щетка-варежка True Touch для вычесывания шерсти, синий', N'шт.', CAST(149 AS Decimal(18, 0)), 15, 12, 2, 1, 2, 7, N'G453T5.jpg', NULL)
INSERT [dbo].[Product] ([ProductId], [Article], [ProductNameId], [Decription], [TypeProduct], [Price], [Discount], [ManufactorerId], [SupplierId], [CategoryId], [ActiveDiscount], [AllAmount], [PhotoName], [PhotoProduct]) VALUES (13, N'G542F5', 7, N'Сухой корм для собак Pro Plan при чувствительном пищеварении, ягненок', N'шт.', CAST(2190 AS Decimal(18, 0)), 30, 8, 1, 3, 4, 7, N'', NULL)
INSERT [dbo].[Product] ([ProductId], [Article], [ProductNameId], [Decription], [TypeProduct], [Price], [Discount], [ManufactorerId], [SupplierId], [CategoryId], [ActiveDiscount], [AllAmount], [PhotoName], [PhotoProduct]) VALUES (14, N'H342F5', 1, N'Игрушка для собак Triol Енот 41 см 12141063 серый', N'шт.', CAST(510 AS Decimal(18, 0)), 5, 10, 2, 3, 2, 17, N'', NULL)
INSERT [dbo].[Product] ([ProductId], [Article], [ProductNameId], [Decription], [TypeProduct], [Price], [Discount], [ManufactorerId], [SupplierId], [CategoryId], [ActiveDiscount], [AllAmount], [PhotoName], [PhotoProduct]) VALUES (15, N'H432F4', 5, N'Миска Triol 9002/KIDP3211/30261087 400 мл серебристый', N'шт.', CAST(385 AS Decimal(18, 0)), 10, 10, 2, 1, 2, 17, N'', NULL)
INSERT [dbo].[Product] ([ProductId], [Article], [ProductNameId], [Decription], [TypeProduct], [Price], [Discount], [ManufactorerId], [SupplierId], [CategoryId], [ActiveDiscount], [AllAmount], [PhotoName], [PhotoProduct]) VALUES (16, N'H436R4', 1, N'Игрушка для собак Triol 3D плетение EC-04/12171005 бежевый', N'шт.', CAST(300 AS Decimal(18, 0)), 15, 10, 1, 3, 2, 15, N'', NULL)
INSERT [dbo].[Product] ([ProductId], [Article], [ProductNameId], [Decription], [TypeProduct], [Price], [Discount], [ManufactorerId], [SupplierId], [CategoryId], [ActiveDiscount], [AllAmount], [PhotoName], [PhotoProduct]) VALUES (17, N'H542R6', 3, N'Лакомство для собак Triol Мясные полоски из кролика, 70 г', N'шт.', CAST(177 AS Decimal(18, 0)), 15, 10, 2, 3, 3, 15, N'', NULL)
INSERT [dbo].[Product] ([ProductId], [Article], [ProductNameId], [Decription], [TypeProduct], [Price], [Discount], [ManufactorerId], [SupplierId], [CategoryId], [ActiveDiscount], [AllAmount], [PhotoName], [PhotoProduct]) VALUES (18, N'H643W2', 5, N'Миска Triol CB02/30231002 100 мл бежевый/голубой', N'шт.', CAST(292 AS Decimal(18, 0)), 25, 10, 1, 1, 3, 13, N'', NULL)
INSERT [dbo].[Product] ([ProductId], [Article], [ProductNameId], [Decription], [TypeProduct], [Price], [Discount], [ManufactorerId], [SupplierId], [CategoryId], [ActiveDiscount], [AllAmount], [PhotoName], [PhotoProduct]) VALUES (19, N'K436T5', 6, N'Мячик для собак Triol с косточками 12101096 желтый/зеленый', N'шт.', CAST(100 AS Decimal(18, 0)), 5, 10, 2, 3, 4, 21, N'', NULL)
INSERT [dbo].[Product] ([ProductId], [Article], [ProductNameId], [Decription], [TypeProduct], [Price], [Discount], [ManufactorerId], [SupplierId], [CategoryId], [ActiveDiscount], [AllAmount], [PhotoName], [PhotoProduct]) VALUES (20, N'K452T5', 4, N'Лежак для собак и кошек ZooM Lama 40х30х8 см бежевый', N'шт.', CAST(800 AS Decimal(18, 0)), 25, 13, 2, 3, 2, 17, N'', NULL)
INSERT [dbo].[Product] ([ProductId], [Article], [ProductNameId], [Decription], [TypeProduct], [Price], [Discount], [ManufactorerId], [SupplierId], [CategoryId], [ActiveDiscount], [AllAmount], [PhotoName], [PhotoProduct]) VALUES (21, N'M356R4', 3, N'Лакомство для собак Titbit Гематоген мясной Classic, 35 г', N'шт.', CAST(50 AS Decimal(18, 0)), 5, 9, 2, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[Product] ([ProductId], [Article], [ProductNameId], [Decription], [TypeProduct], [Price], [Discount], [ManufactorerId], [SupplierId], [CategoryId], [ActiveDiscount], [AllAmount], [PhotoName], [PhotoProduct]) VALUES (22, N'Q245F5', 1, N'Игрушка для собак Triol Бобер 41 см 12141063 серый', N'шт.', CAST(510 AS Decimal(18, 0)), 5, 10, 2, 3, 2, 17, N'', NULL)
INSERT [dbo].[Product] ([ProductId], [Article], [ProductNameId], [Decription], [TypeProduct], [Price], [Discount], [ManufactorerId], [SupplierId], [CategoryId], [ActiveDiscount], [AllAmount], [PhotoName], [PhotoProduct]) VALUES (23, N'R356F4', 5, N'Миска Nobby с рисунком Dog для собак 130 мл красный', N'шт.', CAST(234 AS Decimal(18, 0)), 10, 7, 1, 3, 3, 17, N'R356F4.jpg', NULL)
INSERT [dbo].[Product] ([ProductId], [Article], [ProductNameId], [Decription], [TypeProduct], [Price], [Discount], [ManufactorerId], [SupplierId], [CategoryId], [ActiveDiscount], [AllAmount], [PhotoName], [PhotoProduct]) VALUES (24, N'S245R4', 7, N'Сухой корм для кошек CAT CHOW', N'шт.', CAST(280 AS Decimal(18, 0)), 15, 1, 2, 2, 3, 8, N'', NULL)
INSERT [dbo].[Product] ([ProductId], [Article], [ProductNameId], [Decription], [TypeProduct], [Price], [Discount], [ManufactorerId], [SupplierId], [CategoryId], [ActiveDiscount], [AllAmount], [PhotoName], [PhotoProduct]) VALUES (25, N'T432F4', 7, N'Сухой корм для собак Chappi говядина по-домашнему, с овощами', N'шт.', CAST(1700 AS Decimal(18, 0)), 25, 2, 2, 3, 2, 5, N'T432F4.jpg', NULL)
INSERT [dbo].[Product] ([ProductId], [Article], [ProductNameId], [Decription], [TypeProduct], [Price], [Discount], [ManufactorerId], [SupplierId], [CategoryId], [ActiveDiscount], [AllAmount], [PhotoName], [PhotoProduct]) VALUES (26, N'V352R4', 7, N'Сухой корм для собак Chappi Мясное изобилие, мясное ассорти', N'шт.', CAST(1700 AS Decimal(18, 0)), 25, 2, 1, 3, 4, 9, N'', NULL)
INSERT [dbo].[Product] ([ProductId], [Article], [ProductNameId], [Decription], [TypeProduct], [Price], [Discount], [ManufactorerId], [SupplierId], [CategoryId], [ActiveDiscount], [AllAmount], [PhotoName], [PhotoProduct]) VALUES (27, N'V527T5', 1, N'Игрушка для собак Triol Ящерица 39 см коричневый', N'шт.', CAST(640 AS Decimal(18, 0)), 5, 10, 1, 3, 5, 4, N'', NULL)
INSERT [dbo].[Product] ([ProductId], [Article], [ProductNameId], [Decription], [TypeProduct], [Price], [Discount], [ManufactorerId], [SupplierId], [CategoryId], [ActiveDiscount], [AllAmount], [PhotoName], [PhotoProduct]) VALUES (28, N'W548O7', 7, N'Сухой корм для щенков DOG CHOW Puppy, ягненок 2.5 кг', N'шт.', CAST(600 AS Decimal(18, 0)), 15, 3, 1, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[Product] ([ProductId], [Article], [ProductNameId], [Decription], [TypeProduct], [Price], [Discount], [ManufactorerId], [SupplierId], [CategoryId], [ActiveDiscount], [AllAmount], [PhotoName], [PhotoProduct]) VALUES (29, N'Y324F4', 3, N'Лакомство для собак Titbit Косточки мясные с индейкой и ягненком, 145 г', N'шт.', CAST(86 AS Decimal(18, 0)), 5, 9, 1, 3, 4, 17, N'Y324F4.jpg', NULL)
INSERT [dbo].[Product] ([ProductId], [Article], [ProductNameId], [Decription], [TypeProduct], [Price], [Discount], [ManufactorerId], [SupplierId], [CategoryId], [ActiveDiscount], [AllAmount], [PhotoName], [PhotoProduct]) VALUES (30, N'А112Т4', 3, N'Лакомство для кошек Dreamies Подушечки с курицей, 140 г', N'шт.', CAST(123 AS Decimal(18, 0)), 30, 4, 1, 2, 3, 6, N'А112Т4.png', NULL)
GO
INSERT [dbo].[ProductName] ([Id], [Name]) VALUES (1, N'Игрушка')
INSERT [dbo].[ProductName] ([Id], [Name]) VALUES (2, N'Клетка')
INSERT [dbo].[ProductName] ([Id], [Name]) VALUES (3, N'Лакомство')
INSERT [dbo].[ProductName] ([Id], [Name]) VALUES (4, N'Лежак')
INSERT [dbo].[ProductName] ([Id], [Name]) VALUES (5, N'Миска')
INSERT [dbo].[ProductName] ([Id], [Name]) VALUES (6, N'Мячик')
INSERT [dbo].[ProductName] ([Id], [Name]) VALUES (7, N'Сухой корм')
INSERT [dbo].[ProductName] ([Id], [Name]) VALUES (8, N'Щетка-варежка')
GO
INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'Клиент')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (3, N'Менеджер')
GO
INSERT [dbo].[Supplier] ([Id], [Name]) VALUES (1, N'PetShop')
INSERT [dbo].[Supplier] ([Id], [Name]) VALUES (2, N'ZooMir')
GO
INSERT [dbo].[User] ([Id], [LastName], [FirstName], [MiddleName], [Login], [Password], [RoleId]) VALUES (1, N'Суслов', N'Илья', N'Арсентьевич', N'pixil59@gmail.com', N'2L6KZG', 1)
INSERT [dbo].[User] ([Id], [LastName], [FirstName], [MiddleName], [Login], [Password], [RoleId]) VALUES (2, N'Яковлева
', N'Ярослава
', N'Даниэльевна
', N'"deummecillummu-4992@mail.ru
"
', N'uzWC67
', 1)
INSERT [dbo].[User] ([Id], [LastName], [FirstName], [MiddleName], [Login], [Password], [RoleId]) VALUES (3, N'Игнатьева', N'Алина', N'Михайловна', N'vilagajaunne-5170@yandex.ru', N'8ntwUp', 1)
INSERT [dbo].[User] ([Id], [LastName], [FirstName], [MiddleName], [Login], [Password], [RoleId]) VALUES (4, N'Денисов', N'Михаил', N'Романович', N'frusubroppotou656@yandex.ru', N'YOyhfR', 3)
INSERT [dbo].[User] ([Id], [LastName], [FirstName], [MiddleName], [Login], [Password], [RoleId]) VALUES (5, N'Тимофеев', N'Михаил', N'Елисеевич', N'leuttevitrafo1998@mail.ru', N'RSbvHv', 3)
INSERT [dbo].[User] ([Id], [LastName], [FirstName], [MiddleName], [Login], [Password], [RoleId]) VALUES (6, N'Соловьев', N'Ярослав', N'Маркович', N'frapreubrulloba1141@yandex.ru', N'rwVDh9', 3)
INSERT [dbo].[User] ([Id], [LastName], [FirstName], [MiddleName], [Login], [Password], [RoleId]) VALUES (7, N'Филимонов', N'Роберт', N'Васильевич', N'loudittoimmolau1900@gmail.com', N'LdNyos', 2)
INSERT [dbo].[User] ([Id], [LastName], [FirstName], [MiddleName], [Login], [Password], [RoleId]) VALUES (8, N'Шилова', N'Майя', N'Артемьевна', N'hittuprofassa4984@mail.com', N'gynQMT', 2)
INSERT [dbo].[User] ([Id], [LastName], [FirstName], [MiddleName], [Login], [Password], [RoleId]) VALUES (9, N'Чистякова', N'Виктория', N'Степановна', N'freineiciweijau888@yandex.ru', N'AtnDjr', 2)
INSERT [dbo].[User] ([Id], [LastName], [FirstName], [MiddleName], [Login], [Password], [RoleId]) VALUES (10, N'Волкова', N'Эмилия', N'Артёмовна', N'nokupekidda2001@gmail.com', N'JlFRCZ', 2)
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PickPoint] FOREIGN KEY([PickPointId])
REFERENCES [dbo].[PickPoint] ([PickPointId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_PickPoint]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Product]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[PickPoint]  WITH CHECK ADD  CONSTRAINT [FK_PickPoint_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[PickPoint] CHECK CONSTRAINT [FK_PickPoint_City]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufactorer] FOREIGN KEY([ManufactorerId])
REFERENCES [dbo].[Manufactorer] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufactorer]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductName] FOREIGN KEY([ProductNameId])
REFERENCES [dbo].[ProductName] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductName]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Supplier] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Supplier] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Supplier]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [database] SET  READ_WRITE 
GO
