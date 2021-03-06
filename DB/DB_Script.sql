USE [master]
GO
/****** Object:  Database [Hovid_UserManagement]    Script Date: 02/12/2021 04:03:41 PM ******/
CREATE DATABASE [Hovid_UserManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hovid_UserManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Hovid_UserManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Hovid_UserManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Hovid_UserManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Hovid_UserManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hovid_UserManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hovid_UserManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hovid_UserManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hovid_UserManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hovid_UserManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hovid_UserManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hovid_UserManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hovid_UserManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hovid_UserManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hovid_UserManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hovid_UserManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hovid_UserManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hovid_UserManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hovid_UserManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hovid_UserManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hovid_UserManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Hovid_UserManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hovid_UserManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hovid_UserManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hovid_UserManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hovid_UserManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hovid_UserManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hovid_UserManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hovid_UserManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [Hovid_UserManagement] SET  MULTI_USER 
GO
ALTER DATABASE [Hovid_UserManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hovid_UserManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hovid_UserManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hovid_UserManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hovid_UserManagement] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Hovid_UserManagement', N'ON'
GO
ALTER DATABASE [Hovid_UserManagement] SET QUERY_STORE = OFF
GO
USE [Hovid_UserManagement]
GO
/****** Object:  Table [dbo].[User]    Script Date: 02/12/2021 04:03:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [bigint] IDENTITY(0,1) NOT NULL,
	[UserName] [varchar](20) NULL,
	[UserNo] [int] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  StoredProcedure [dbo].[CreateUser]    Script Date: 02/12/2021 04:03:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateUser] @UserName varchar(20), @UserNo int
AS
	Insert into dbo.[User](Username,UserNo) values(@UserName,@UserNo)
GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 02/12/2021 04:03:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteUser] @UserId bigint
AS
	DELETE from dbo.[User] where UserID = @UserId
GO
/****** Object:  StoredProcedure [dbo].[SelectAllUser]    Script Date: 02/12/2021 04:03:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAllUser]
AS
select * from dbo.[User]
GO;
GO
/****** Object:  StoredProcedure [dbo].[SelectUser]    Script Date: 02/12/2021 04:03:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SelectUser] @UserID bigint
AS
	select * from dbo.[User] where UserID = @UseriD
GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 02/12/2021 04:03:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateUser] @UserID bigint, @UserName varchar(20), @UserNo int
AS
	UPDATE dbo.[User] set UserName = @UserName, UserNo = @UserNo where UserID = @UserID
GO
USE [master]
GO
ALTER DATABASE [Hovid_UserManagement] SET  READ_WRITE 
GO
