USE [master]
GO
/****** Object:  Database [dbproduct]    Script Date: 24/2/2024 20:53:59 ******/
CREATE DATABASE [dbproduct]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbproduct', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\dbproduct.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbproduct_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\dbproduct_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dbproduct] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbproduct].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbproduct] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbproduct] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbproduct] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbproduct] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbproduct] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbproduct] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbproduct] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbproduct] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbproduct] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbproduct] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbproduct] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbproduct] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbproduct] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbproduct] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbproduct] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbproduct] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbproduct] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbproduct] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbproduct] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbproduct] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbproduct] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbproduct] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbproduct] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbproduct] SET  MULTI_USER 
GO
ALTER DATABASE [dbproduct] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbproduct] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbproduct] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbproduct] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbproduct] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbproduct] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [dbproduct] SET QUERY_STORE = OFF
GO
USE [dbproduct]
GO
/****** Object:  Table [dbo].[category]    Script Date: 24/2/2024 20:53:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[categoryId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invoice_detail]    Script Date: 24/2/2024 20:53:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invoice_detail](
	[invoiceDetailId] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NOT NULL,
	[count] [float] NOT NULL,
	[price] [float] NOT NULL,
	[invoiceHeadId] [int] NOT NULL,
 CONSTRAINT [PK_invoice_detail] PRIMARY KEY CLUSTERED 
(
	[invoiceDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invoice_head]    Script Date: 24/2/2024 20:53:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invoice_head](
	[invoiceHeadId] [int] IDENTITY(1,1) NOT NULL,
	[total] [float] NOT NULL,
	[dateTime] [datetime] NOT NULL,
	[userId] [int] NULL,
 CONSTRAINT [PK_invoice_head] PRIMARY KEY CLUSTERED 
(
	[invoiceHeadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 24/2/2024 20:53:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[productId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[price] [float] NOT NULL,
	[count] [int] NOT NULL,
	[categoryId] [int] NOT NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_user]    Script Date: 24/2/2024 20:53:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_user](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[userName] [varchar](25) NOT NULL,
	[password] [varchar](200) NOT NULL,
	[status] [varchar](10) NOT NULL,
 CONSTRAINT [PK_t_user] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[invoice_detail]  WITH CHECK ADD  CONSTRAINT [FK_invoice_detail_invoice_head] FOREIGN KEY([invoiceHeadId])
REFERENCES [dbo].[invoice_head] ([invoiceHeadId])
GO
ALTER TABLE [dbo].[invoice_detail] CHECK CONSTRAINT [FK_invoice_detail_invoice_head]
GO
ALTER TABLE [dbo].[invoice_head]  WITH CHECK ADD  CONSTRAINT [FK_invoice_head_t_user] FOREIGN KEY([userId])
REFERENCES [dbo].[t_user] ([userId])
GO
ALTER TABLE [dbo].[invoice_head] CHECK CONSTRAINT [FK_invoice_head_t_user]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[category] ([categoryId])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_category]
GO
USE [master]
GO
ALTER DATABASE [dbproduct] SET  READ_WRITE 
GO
