USE [master]
GO
/****** Object:  Database [VFF]    Script Date: 8/8/2023 2:20:41 AM ******/
CREATE DATABASE [VFF]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VFF', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\VFF.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VFF_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\VFF_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [VFF] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VFF].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VFF] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VFF] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VFF] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VFF] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VFF] SET ARITHABORT OFF 
GO
ALTER DATABASE [VFF] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VFF] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VFF] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VFF] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VFF] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VFF] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VFF] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VFF] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VFF] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VFF] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VFF] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VFF] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VFF] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VFF] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VFF] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VFF] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VFF] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VFF] SET RECOVERY FULL 
GO
ALTER DATABASE [VFF] SET  MULTI_USER 
GO
ALTER DATABASE [VFF] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VFF] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VFF] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VFF] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VFF] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'VFF', N'ON'
GO
ALTER DATABASE [VFF] SET QUERY_STORE = OFF
GO
USE [VFF]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [VFF]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 8/8/2023 2:20:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [varchar](255) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderdetails]    Script Date: 8/8/2023 2:20:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderdetails](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[orderid] [bigint] NULL,
	[productid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 8/8/2023 2:20:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[createdate] [date] NULL,
	[username] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 8/8/2023 2:20:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[available] [bit] NULL,
	[createdate] [date] NULL,
	[image] [varchar](255) NULL,
	[name] [nvarchar](255) NOT NULL,
	[price] [float] NULL,
	[categoryid] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userinfo]    Script Date: 8/8/2023 2:20:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userinfo](
	[username] [varchar](255) NOT NULL,
	[email] [varchar](255) NULL,
	[fullname] [nvarchar](255) NOT NULL,
	[password] [varchar](255) NULL,
	[photo] [varchar](255) NULL,
	[roles] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[categories] ([id], [name]) VALUES (N'1000', N'Phần ăn EVM')
INSERT [dbo].[categories] ([id], [name]) VALUES (N'1001', N'Bánh Burger')
INSERT [dbo].[categories] ([id], [name]) VALUES (N'1002', N'Gà rán')
INSERT [dbo].[categories] ([id], [name]) VALUES (N'1003', N'Nước uống')
INSERT [dbo].[categories] ([id], [name]) VALUES (N'1004', N'Tráng miệng')
INSERT [dbo].[categories] ([id], [name]) VALUES (N'1005', N'Món an nhẹ')
INSERT [dbo].[categories] ([id], [name]) VALUES (N'1006', N'Bánh Muffin')
INSERT [dbo].[categories] ([id], [name]) VALUES (N'1007', N'Nước uống nóng')
INSERT [dbo].[categories] ([id], [name]) VALUES (N'1008', N'Nước uống đá')
INSERT [dbo].[categories] ([id], [name]) VALUES (N'1009', N'Sữa chua trái cây')
INSERT [dbo].[categories] ([id], [name]) VALUES (N'1010', N'Bánh tráng miệng')
INSERT [dbo].[categories] ([id], [name]) VALUES (N'1011', N'Nước uống trà')
INSERT [dbo].[categories] ([id], [name]) VALUES (N'1012', N'Nước uống đá xay')
GO
SET IDENTITY_INSERT [dbo].[orderdetails] ON 

INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid]) VALUES (1, 105000, 1, 1, 6)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid]) VALUES (2, 79000, 1, 1, 4)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid]) VALUES (3, 69000, 1, 1, 3)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid]) VALUES (4, 79000, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[orderdetails] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [address], [createdate], [username]) VALUES (1, N'44', CAST(N'2023-08-08' AS Date), N'admin')
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (1, 1, CAST(N'2023-01-01' AS Date), N'EVM_03_6pcs_chicken_mcnuggets_0_1.png', N'Phần ăn EVM 6 miếng gà Nuggets', 79000, N'1000')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (2, 1, CAST(N'2023-01-01' AS Date), N'cheesedlx_bb_evm-min_2.png', N'Phần ăn EVM Burger Bò Phô-mai Ðặc biệt', 69000, N'1000')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (3, 0, CAST(N'2023-01-01' AS Date), N'fof_bb_evm-min_3.png', N'Phần ăn EVM Burger phi-lê Cá', 69000, N'1000')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (4, 0, CAST(N'2023-01-01' AS Date), N'doublecheese_bb_evm-min_4.png', N'Phần ăn EVM Burger 2 lớp Bò và Phô-mai', 79000, N'1000')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (5, 0, CAST(N'2023-01-01' AS Date), N'mcchicken_bb_evm-min_5.png', N'Phần ăn EVM Burger Gà', 79000, N'1000')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (6, 0, CAST(N'2023-01-01' AS Date), N'mcchickendlx_bb_evm-min_6.png', N'Phần ăn EVM Burger Gà Phô-mai Ðặc biệt', 105000, N'1000')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (7, 0, CAST(N'2023-01-01' AS Date), N'mcroyal_bb_evm-min_7.png', N'Phần ăn EVM Burger Bò miếng lớn Phô-mai', 95000, N'1000')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (8, 0, CAST(N'2023-01-01' AS Date), N'bigmac_bb_evm-min_8.png', N'Phần ăn EVM Burger 2 lớp Bò Big Mac', 99000, N'1000')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (9, 1, CAST(N'2023-01-01' AS Date), N'mcroyaldlx_bb_evm-min_9.png', N'Phần ăn EVM Burger Bò miếng lớn Phô-mai Ðặc biệt', 105000, N'1000')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (10, 1, CAST(N'2023-01-01' AS Date), N'mcspicydlx_bb_evm-min_10.png', N'Phần ăn EVM Burger Phi-lê Gà miếng lớn', 99000, N'1000')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (11, 1, CAST(N'2023-02-02' AS Date), N'cheesedlx_bb_11.png', N'Burger Bò phô mai đặc biệt', 49000, N'1001')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (12, 1, CAST(N'2023-02-02' AS Date), N'doublecheese_bb_12.png', N'Burger 2 lớp bò, phô-mai', 65000, N'1001')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (13, 1, CAST(N'2023-02-02' AS Date), N'mcroyal_bb_13.png', N'Burger Bò miếng lớn, phô-mai', 79000, N'1001')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (14, 1, CAST(N'2023-02-02' AS Date), N'bigmac_bb_14.png', N'Burger Big Mac', 74000, N'1001')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (15, 1, CAST(N'2023-02-02' AS Date), N'mcroyaldlx_bb_15.png', N'Burger Bò Hoàng Gia Ðặc Biệt', 89000, N'1001')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (16, 1, CAST(N'2023-02-02' AS Date), N'mcchickendlx_bb_16.png', N'Burger Gà phô-mai đặc biệt', 69000, N'1001')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (17, 1, CAST(N'2023-02-02' AS Date), N'mcspicydlx_bb_17.png', N'Burger phi-lê gà cay đặc biệt', 89000, N'1001')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (18, 1, CAST(N'2023-02-02' AS Date), N'chickbg_18.png', N'Burger gà', 34000, N'1001')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (19, 1, CAST(N'2023-02-02' AS Date), N'sausagebg_bb_19.png', N'Burger Xúc Xích - 337 Kcal', 35000, N'1001')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (20, 1, CAST(N'2023-02-02' AS Date), N'mcchicken_bb_20.png', N'Burger Gà Mayo', 59000, N'1001')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (21, 1, CAST(N'2023-03-03' AS Date), N'fof_bb_21.png', N'Burger phi-lê Cá phô-mai', 56000, N'1001')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (22, 1, CAST(N'2023-03-03' AS Date), N'20pcs_chicken_mcwings_22.png', N'20 miếng Gà Nuggets', 121000, N'1002')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (23, 1, CAST(N'2023-03-03' AS Date), N'6-wings_23.png', N'6 miếng cánh gà Wings', 125000, N'1002')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (24, 1, CAST(N'2023-03-03' AS Date), N'10-wings_24.png', N'10 miếng cánh gà Wings', 179000, N'1002')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (25, 1, CAST(N'2023-03-03' AS Date), N'6pcs_chicken_mcnuggets_25.png', N'6 miếng gà Nuggets', 69000, N'1002')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (26, 1, CAST(N'2023-03-03' AS Date), N'9pcs-chicken-mcnuggets_26.png', N'9 miếng gà Nuggets', 69000, N'1002')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (27, 1, CAST(N'2023-03-03' AS Date), N'3pcs_chicken_mcwings_27.png', N'3 miếng cánh gà Wings', 69000, N'1002')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (28, 1, CAST(N'2023-03-03' AS Date), N'3-ga-ran_28.png', N'3 miếng gà rán', 101000, N'1002')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (29, 1, CAST(N'2023-03-03' AS Date), N'5-ga-ran_29.png', N'5 miếng gà rán', 176000, N'1002')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (30, 1, CAST(N'2023-03-03' AS Date), N'1-ga-ran_30.png', N'1 miếng gà rán - 183 Kcal', 37000, N'1002')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (31, 1, CAST(N'2023-04-04' AS Date), N'9-ga-ran_31.png', N'9 miếng gà rán', 289000, N'1002')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (32, 1, CAST(N'2023-04-04' AS Date), N'2-ga-ran_32.png', N'Phần ăn 2 miếng gà rán', 92000, N'1002')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (33, 1, CAST(N'2023-04-04' AS Date), N'th-true-milk-copy_33.png', N'Sữa tươi TH True Milk - 108 Kcal', 22000, N'1003')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (34, 1, CAST(N'2023-04-04' AS Date), N'hero-pdt-Fanta-201703_0_34.png', N'Fanta', 22000, N'1003')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (35, 1, CAST(N'2023-04-04' AS Date), N'dasani_water_35.png', N'Nước suối', 22000, N'1003')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (36, 1, CAST(N'2023-04-04' AS Date), N'Product_thumb_Sprite_36.png', N'Sprite', 22000, N'1003')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (37, 1, CAST(N'2023-04-04' AS Date), N'mcd-food-beverages-soft-drinks-coke_37.png', N'Coca-Cola - 150 Kcal', 22000, N'1003')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (38, 1, CAST(N'2023-04-04' AS Date), N'milo_38.png', N'Milo - 110 Kcal', 22000, N'1003')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (39, 1, CAST(N'2023-04-04' AS Date), N'mcdonalds_cone_39.png', N'Kem ốc quế', 10000, N'1004')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (40, 1, CAST(N'2023-04-04' AS Date), N'hotfudge_mcsundae_40.png', N'Kem Sundae sốt Socola', 29000, N'1004')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (41, 1, CAST(N'2023-05-05' AS Date), N'strawberry-mcsundae_41.png', N'Kem Sundae sốt Dâu', 29000, N'1004')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (42, 1, CAST(N'2023-05-05' AS Date), N'oreo_mcflurry_42.png', N'Kem xay bánh Oreo', 39000, N'1004')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (43, 1, CAST(N'2023-05-05' AS Date), N'mcfmc_43.png', N'Kem xay bánh Oreo Trà xanh', 39000, N'1004')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (44, 1, CAST(N'2023-05-05' AS Date), N'regular_world_famous_fries_44.png', N'Khoai tây chiên (size nhỏ) - 206 Kcal', 19000, N'1005')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (45, 1, CAST(N'2023-05-05' AS Date), N'medium_world_famous_fries_45.png', N'Khoai tây chiên (size vừa)', 29000, N'1005')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (46, 1, CAST(N'2023-05-05' AS Date), N'large_world_famous_fries_46.png', N'Khoai tây chiên (size lớn)', 39000, N'1005')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (47, 1, CAST(N'2023-05-05' AS Date), N'salad500_47.png', N'Salad lắc', 35000, N'1005')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (48, 1, CAST(N'2023-05-05' AS Date), N'sausage_mcmuffin_deluxe_0_48.png', N'Muffin xúc xích, phô-mai đặc biệt', 39000, N'1006')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (49, 1, CAST(N'2023-05-05' AS Date), N'muffin-big_49.png', N'Muffin gà', 39000, N'1006')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (50, 1, CAST(N'2023-05-05' AS Date), N'sausage-mcmuffin-with-egg_50.png', N'Muffin ốp la, phô-mai', 49000, N'1006')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (51, 1, CAST(N'2023-06-06' AS Date), N'americano_51.png', N'Americano', 39000, N'1007')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (52, 1, CAST(N'2023-06-06' AS Date), N'cappucino_52.png', N'Cappucino', 49000, N'1007')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (53, 1, CAST(N'2023-06-06' AS Date), N'hotmatcha_53.png', N'Matcha Latte nóng', 60000, N'1007')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (54, 1, CAST(N'2023-06-06' AS Date), N'hotchoco_54.png', N'Socola nóng', 49000, N'1007')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (55, 1, CAST(N'2023-06-06' AS Date), N'hotlatte_55.png', N'Latte nóng', 49000, N'1007')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (56, 1, CAST(N'2023-06-06' AS Date), N'mocha_56.png', N'Cà phê Mocha', 59000, N'1007')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (57, 1, CAST(N'2023-06-06' AS Date), N'iced_milkVNcoffee_57.png', N'Cà phê sữa đá Việt Nam', 35000, N'1008')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (58, 1, CAST(N'2023-06-06' AS Date), N'icedamericano_58.png', N'Cà phê Americano đá', 45000, N'1008')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (59, 1, CAST(N'2023-06-06' AS Date), N'icedlatte_59.png', N'Cà phê Latte đá', 55000, N'1008')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (60, 1, CAST(N'2023-06-06' AS Date), N'iced_VNcoffee_60.png', N'Cà phê đen đá Việt Nam', 35000, N'1008')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (61, 1, CAST(N'2023-07-07' AS Date), N'CSO_MilkCreamTea_S_61.png', N'Trà kem sữa', 49000, N'1008')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (62, 1, CAST(N'2023-07-07' AS Date), N'CSO_PeachTea_S_62.png', N'Trà đào', 49000, N'1008')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (63, 1, CAST(N'2023-07-07' AS Date), N'lychee_63.png', N'Trà vải', 49000, N'1008')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (64, 1, CAST(N'2023-07-07' AS Date), N'tacmuoi_64.png', N'Tắc muối mơ ngâm hạt chia', 39000, N'1008')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (65, 1, CAST(N'2023-07-07' AS Date), N'icedmatcha_65.png', N'Matcha Latte đá', 69000, N'1008')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (66, 1, CAST(N'2023-07-07' AS Date), N'yogurt-dau_66.png', N'Sữa chua dâu', 59000, N'1009')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (67, 1, CAST(N'2023-07-07' AS Date), N'yogurt-kiwi_67.png', N'Sữa chua kiwi', 59000, N'1009')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (68, 1, CAST(N'2023-07-07' AS Date), N'TIRAMISU_68.png', N'Bánh Tiramisu', 55000, N'1010')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (69, 1, CAST(N'2023-07-07' AS Date), N'BAKED-CHEESECAKE_69.png', N'Bánh Phô mai nướng', 35000, N'1010')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (70, 1, CAST(N'2023-07-07' AS Date), N'BANANA-MUFFIN_70.png', N'Bánh nướng vị chuối', 30000, N'1010')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (71, 1, CAST(N'2023-08-08' AS Date), N'CHOCO-BROWNIE_71.png', N'Bánh Brownie Socola', 30000, N'1010')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (72, 1, CAST(N'2023-08-08' AS Date), N'COCONUT-MACAROON_72.png', N'Bánh Macaron Dừa 2 cái', 25000, N'1010')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (73, 1, CAST(N'2023-08-08' AS Date), N'CSO_7425_73.png', N'Bánh Macaron Dừa 1 cái', 15000, N'1010')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (74, 1, CAST(N'2023-08-08' AS Date), N'CHOCOLATE-CHIP-COOKIE_74.png', N'Bánh quy Socola', 25000, N'1010')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (75, 1, CAST(N'2023-08-08' AS Date), N'croissant_75.png', N'Bánh sừng trâu', 30000, N'1010')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (76, 1, CAST(N'2023-08-08' AS Date), N'hotmatcha_76.png', N'Matcha Latte nóng', 60000, N'1011')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (77, 1, CAST(N'2023-08-08' AS Date), N'frappematcha_77.png', N'Trà xanh đá xay', 79000, N'1011')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (78, 1, CAST(N'2023-08-08' AS Date), N'CSO_MilkCreamTea_S_78.png', N'Trà kem sữa', 49000, N'1011')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (79, 1, CAST(N'2023-08-08' AS Date), N'CSO_PeachTea_S_79.png', N'Trà đào', 49000, N'1011')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (80, 1, CAST(N'2023-08-08' AS Date), N'lychee_80.png', N'Trà vải', 49000, N'1011')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (81, 1, CAST(N'2023-02-03' AS Date), N'tacmuoi_81.png', N'Tắc muối mơ ngâm hạt chia', 39000, N'1011')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (82, 1, CAST(N'2023-02-04' AS Date), N'icedmatcha_82.png', N'Matcha Latte đá', 69000, N'1011')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (83, 1, CAST(N'2023-02-05' AS Date), N'frappematcha_83.png', N'Trà xanh đá xay', 79000, N'1012')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (84, 1, CAST(N'2023-02-06' AS Date), N'caramelfrappe_84.png', N'Caramen đá xay', 69000, N'1012')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (85, 1, CAST(N'2023-02-07' AS Date), N'mochafrappe_85.png', N'Mocha đá xay', 69000, N'1012')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (86, 1, CAST(N'2023-02-08' AS Date), N'lattefrappe_86.png', N'Latte đá xay', 69000, N'1012')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (87, 1, CAST(N'2023-08-08' AS Date), N'c7334bbd.png', N'55555', 55555, N'1001')
SET IDENTITY_INSERT [dbo].[products] OFF
GO
INSERT [dbo].[userinfo] ([username], [email], [fullname], [password], [photo], [roles]) VALUES (N'admin', N'duy9803@gmail.com', N'Minh Duy', N'$2a$10$PjIKJe2H9zgV4e3GIv78HOzAgiOxgAr0ssEfPuZbCEeWMGqwdIqVy', NULL, N'ROLE_USER')
INSERT [dbo].[userinfo] ([username], [email], [fullname], [password], [photo], [roles]) VALUES (N'admin1', N'zeus090803@gmail.com', N'Zeus', N'$2a$10$/6sNCkMZr7XMoTXzIkizNeExHQoPdC1xgGCepJ7vy4ZPwU0wdN61G', NULL, N'ROLE_ADMIN')
INSERT [dbo].[userinfo] ([username], [email], [fullname], [password], [photo], [roles]) VALUES (N'duy', N'duy@gmail.com', N'asd', N'$2a$10$FWBaM7FuL3OjlYkMWwvnBetbCGcPmOl9fs8osLhSP71la3Wrird6q', N'123', N'ROLE_USER')
INSERT [dbo].[userinfo] ([username], [email], [fullname], [password], [photo], [roles]) VALUES (N'gdfg', N'hoa01260413773@gmail.com', N'123', N'$2a$10$GnUkUrniiiPyxoWnnR7obOU7/yx6Y296EBmzeLw9qC/Lk0AzMq6Bm', N'NULL', N'ROLE_USER')
GO
ALTER TABLE [dbo].[orderdetails]  WITH CHECK ADD  CONSTRAINT [FKaltatpxipsjtcih4d1h6bn0xr] FOREIGN KEY([productid])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[orderdetails] CHECK CONSTRAINT [FKaltatpxipsjtcih4d1h6bn0xr]
GO
ALTER TABLE [dbo].[orderdetails]  WITH CHECK ADD  CONSTRAINT [FKj4gc2ja2otvwemf4rho2lp3s8] FOREIGN KEY([orderid])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[orderdetails] CHECK CONSTRAINT [FKj4gc2ja2otvwemf4rho2lp3s8]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FKh1v832sllnl56rap949sra2kp] FOREIGN KEY([username])
REFERENCES [dbo].[userinfo] ([username])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FKh1v832sllnl56rap949sra2kp]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK1krrsjgcawsfg8k8u4hm5gi8q] FOREIGN KEY([categoryid])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK1krrsjgcawsfg8k8u4hm5gi8q]
GO
USE [master]
GO
ALTER DATABASE [VFF] SET  READ_WRITE 
GO
