USE [master]
GO
/****** Object:  Database [TTTN]    Script Date: 30/07/2022 1:50:05 CH ******/
CREATE DATABASE [TTTN]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TTTN', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TTTN.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TTTN_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TTTN_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TTTN] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TTTN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TTTN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TTTN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TTTN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TTTN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TTTN] SET ARITHABORT OFF 
GO
ALTER DATABASE [TTTN] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TTTN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TTTN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TTTN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TTTN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TTTN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TTTN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TTTN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TTTN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TTTN] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TTTN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TTTN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TTTN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TTTN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TTTN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TTTN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TTTN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TTTN] SET RECOVERY FULL 
GO
ALTER DATABASE [TTTN] SET  MULTI_USER 
GO
ALTER DATABASE [TTTN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TTTN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TTTN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TTTN] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TTTN] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TTTN', N'ON'
GO
USE [TTTN]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 30/07/2022 1:50:05 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 30/07/2022 1:50:05 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](50) NOT NULL,
	[Activated] [bit] NOT NULL,
	[Admin] [bit] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 30/07/2022 1:50:05 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Discount] [float] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 30/07/2022 1:50:05 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [nvarchar](20) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[Address] [nvarchar](60) NOT NULL,
	[Amount] [float] NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[Status] [int] NULL,
	[Phone] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 30/07/2022 1:50:05 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](60) NOT NULL,
	[Image] [nvarchar](50) NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ProductDate] [date] NOT NULL,
	[Available] [bit] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ViewCount] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name]) VALUES (2, N'Phát triển bản thân')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (3, N'Giáo khoa')
SET IDENTITY_INSERT [dbo].[Categories] OFF
INSERT [dbo].[Customers] ([Id], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'admin', N'123456', N'Vũ Tấn Đức', N'vutanduc57200@gmail.com', N'me.jpg', 1, 1)
INSERT [dbo].[Customers] ([Id], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'user1', N'123456', N'Nguyễn Văn A', N'n18dccn050@student.ptithcm.edu.vn', N'sales.jpg', 1, 0)
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (1, 2, 3, 100000, 1, 0)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [CustomerId], [OrderDate], [Address], [Amount], [Description], [Status], [Phone]) VALUES (2, N'user1', CAST(N'2022-07-27 00:00:00.000' AS DateTime), N'97 Man thiện', 100000, N'<br>', 2, NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (3, N'Đắc Nhân Tâm', N'sach-dac-nhan-tam-dale-carnegie.jpg', 100000, 0.2, 10, CAST(N'2022-07-19' AS Date), 1, 2, N'<br>', 1)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (5, N'Giải mã trí tuệ cảm xúc', N'giai-ma-tri-tue-cam-xuc.jpg', 40000, 0, 1, CAST(N'2022-07-22' AS Date), 1, 2, N'<br>', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (6, N'cảm xúc là kẻ thù số một của thành công', N'cảm xúc là kẻ thù số một của thành công.jpg', 100000, 0, 1, CAST(N'2022-07-22' AS Date), 1, 2, N'Tác giả: Lê Thẩm Dương', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (7, N'HarryPorter và Hoàng tử lai', N'HarryPorter và Hoàng tử lai.jpg', 100000, 0.05, 1, CAST(N'2022-07-22' AS Date), 1, 2, N'Nhà xuất bản : NXB Trẻ<div><br></div>', 1)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (8, N'HarryPorter và bảo bối tử thần', N'harrypottervabaoboituthantap7.jpg', 100000, 0, 1, CAST(N'2022-07-22' AS Date), 1, 2, N'<br>', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (9, N'HarryPorter và Hòn đá tử thần', N'HarryPorter và Hòn đá tử thần.jpg', 100000, 0, 1, CAST(N'2022-07-22' AS Date), 1, 2, N'<br>', 3)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (10, N'Sách khoa học 5', N'sach-giao-khoa-khoa-hoc-5.jpg', 14000, 0, 10, CAST(N'2022-07-24' AS Date), 1, 3, N'Sách dành cho học sinh lớp 5<div>Tình trạng : Nguyên vẹn</div>', 0)
SET IDENTITY_INSERT [dbo].[Products] OFF
USE [master]
GO
ALTER DATABASE [TTTN] SET  READ_WRITE 
GO
