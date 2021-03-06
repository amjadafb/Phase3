USE [master]
GO
/****** Object:  Database [LaptopPortal]    Script Date: 11/19/2021 10:22:28 PM ******/
CREATE DATABASE [LaptopPortal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LaptopPortal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\LaptopPortal.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LaptopPortal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\LaptopPortal_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [LaptopPortal] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LaptopPortal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LaptopPortal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LaptopPortal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LaptopPortal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LaptopPortal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LaptopPortal] SET ARITHABORT OFF 
GO
ALTER DATABASE [LaptopPortal] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LaptopPortal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LaptopPortal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LaptopPortal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LaptopPortal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LaptopPortal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LaptopPortal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LaptopPortal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LaptopPortal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LaptopPortal] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LaptopPortal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LaptopPortal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LaptopPortal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LaptopPortal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LaptopPortal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LaptopPortal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LaptopPortal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LaptopPortal] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LaptopPortal] SET  MULTI_USER 
GO
ALTER DATABASE [LaptopPortal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LaptopPortal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LaptopPortal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LaptopPortal] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LaptopPortal] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LaptopPortal] SET QUERY_STORE = OFF
GO
USE [LaptopPortal]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/19/2021 10:22:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 11/19/2021 10:22:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(101,1) NOT NULL,
	[Fname] [nvarchar](50) NULL,
	[Lname] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerOrder]    Script Date: 11/19/2021 10:22:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerOrder](
	[CustomerOrderId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[OrderId] [int] NULL,
 CONSTRAINT [PK_CustomerOrder] PRIMARY KEY CLUSTERED 
(
	[CustomerOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/19/2021 10:22:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderNumber] [nvarchar](50) NULL,
	[OrderedDate] [date] NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/19/2021 10:22:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NULL,
	[IsAvaliable] [bit] NULL,
	[BrandName] [nvarchar](50) NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_OrderedDate]  DEFAULT (getdate()) FOR [OrderedDate]
GO
ALTER TABLE [dbo].[CustomerOrder]  WITH CHECK ADD  CONSTRAINT [FK_CustomerOrder_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[CustomerOrder] CHECK CONSTRAINT [FK_CustomerOrder_Customer]
GO
ALTER TABLE [dbo].[CustomerOrder]  WITH CHECK ADD  CONSTRAINT [FK_CustomerOrder_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[CustomerOrder] CHECK CONSTRAINT [FK_CustomerOrder_Order]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
/****** Object:  StoredProcedure [dbo].[sp_add_relation]    Script Date: 11/19/2021 10:22:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_add_relation] 
@Oid int,
@CustomerId int
As 
Insert into [dbo].[CustomerOrder] (OrderId, CustomerId)
						  Values(@Oid, @CustomerId)
select SCOPE_IDENTITY();
GO
/****** Object:  StoredProcedure [dbo].[sp_get_product_byId]    Script Date: 11/19/2021 10:22:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[sp_get_product_byId]
@pid int
As 
Select p.ProductId, p.ProductName, p.IsAvaliable, p.BrandName, c.CategoryName from [dbo].[Product] p 
Inner join [dbo].[Category] c On p.CategoryId = c.CategoryId And p.ProductId = @pid;
GO
/****** Object:  StoredProcedure [dbo].[sp_get_products]    Script Date: 11/19/2021 10:22:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_get_products]
As
Select p.ProductId, p.ProductName, p.IsAvaliable, p.BrandName, c.CategoryName from [dbo].[Product] p Inner join [dbo].[Category] c On p.CategoryId = c.CategoryId
GO
/****** Object:  StoredProcedure [dbo].[sp_login_info]    Script Date: 11/19/2021 10:22:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_login_info]
@email nvarchar(50),
@pass nvarchar(50)
As
Select CustomerId from [dbo].[Customer] where @email = Email And @pass = Password
GO
/****** Object:  StoredProcedure [dbo].[sp_submit_order]    Script Date: 11/19/2021 10:22:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_submit_order] 
@pid int,
@OrderNumber nvarchar(50)
As 
Insert into [dbo].[Order] (OrderNumber, ProductId)
						  Values(@OrderNumber, @pid)
select SCOPE_IDENTITY();
GO
USE [master]
GO
ALTER DATABASE [LaptopPortal] SET  READ_WRITE 
GO
