USE [master]
GO
/****** Object:  Database [Unions]    Script Date: 4/5/2024 12:35:00 PM ******/
CREATE DATABASE [Unions]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Unions', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Unions.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Unions_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Unions_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Unions] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Unions].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Unions] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Unions] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Unions] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Unions] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Unions] SET ARITHABORT OFF 
GO
ALTER DATABASE [Unions] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Unions] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Unions] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Unions] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Unions] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Unions] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Unions] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Unions] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Unions] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Unions] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Unions] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Unions] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Unions] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Unions] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Unions] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Unions] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Unions] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Unions] SET RECOVERY FULL 
GO
ALTER DATABASE [Unions] SET  MULTI_USER 
GO
ALTER DATABASE [Unions] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Unions] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Unions] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Unions] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Unions] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Unions] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Unions', N'ON'
GO
ALTER DATABASE [Unions] SET QUERY_STORE = OFF
GO
USE [Unions]
GO
/****** Object:  Table [dbo].[dotnet]    Script Date: 4/5/2024 12:35:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dotnet](
	[rollnumber] [int] NULL,
	[name] [varchar](50) NULL,
	[city] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[java]    Script Date: 4/5/2024 12:35:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[java](
	[rollnumber] [int] NULL,
	[name] [varchar](50) NULL,
	[Email] [varchar](20) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[dotnet] ([rollnumber], [name], [city]) VALUES (1, N'ganesh', N'solapur')
INSERT [dbo].[dotnet] ([rollnumber], [name], [city]) VALUES (2, N'dhiraj', N'pandharpur')
INSERT [dbo].[dotnet] ([rollnumber], [name], [city]) VALUES (3, N'vasudha', N'nashik')
INSERT [dbo].[dotnet] ([rollnumber], [name], [city]) VALUES (4, N'kishore', N'latur')
INSERT [dbo].[dotnet] ([rollnumber], [name], [city]) VALUES (5, N'ajay', N'burhanpur')
INSERT [dbo].[dotnet] ([rollnumber], [name], [city]) VALUES (6, N'chaitanya', N'yavatmal')
GO
INSERT [dbo].[java] ([rollnumber], [name], [Email]) VALUES (1, N'jyoti', N'j@j.com')
INSERT [dbo].[java] ([rollnumber], [name], [Email]) VALUES (1, N'ganesh', N'g@g.com')
INSERT [dbo].[java] ([rollnumber], [name], [Email]) VALUES (3, N'manasi', N'm@m.com')
INSERT [dbo].[java] ([rollnumber], [name], [Email]) VALUES (4, N'sana', N's@s.com')
GO
USE [master]
GO
ALTER DATABASE [Unions] SET  READ_WRITE 
GO
