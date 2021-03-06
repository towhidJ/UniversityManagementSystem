USE [master]
GO
/****** Object:  Database [Login]    Script Date: 5/29/2019 4:22:37 AM ******/
CREATE DATABASE [Login]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Login', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Login.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Login_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Login_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Login] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Login].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Login] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Login] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Login] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Login] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Login] SET ARITHABORT OFF 
GO
ALTER DATABASE [Login] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Login] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Login] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Login] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Login] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Login] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Login] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Login] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Login] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Login] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Login] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Login] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Login] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Login] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Login] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Login] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Login] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Login] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Login] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Login] SET  MULTI_USER 
GO
ALTER DATABASE [Login] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Login] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Login] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Login] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Login]
GO
/****** Object:  Table [dbo].[User]    Script Date: 5/29/2019 4:22:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 5/29/2019 4:22:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Role] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [UserName], [Password]) VALUES (1, N'Admin', N'Admin')
INSERT [dbo].[User] ([Id], [UserName], [Password]) VALUES (2, N'towhid', N'towhid')
INSERT [dbo].[User] ([Id], [UserName], [Password]) VALUES (3, N'yousuf', N'yousuf')
INSERT [dbo].[User] ([Id], [UserName], [Password]) VALUES (4, N'wahab', N'wahab')
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[UserRole] ON 

INSERT [dbo].[UserRole] ([Id], [UserId], [Role]) VALUES (1, 1, N'Admin')
INSERT [dbo].[UserRole] ([Id], [UserId], [Role]) VALUES (2, 2, N'Admin')
INSERT [dbo].[UserRole] ([Id], [UserId], [Role]) VALUES (3, 3, N'Student')
INSERT [dbo].[UserRole] ([Id], [UserId], [Role]) VALUES (1002, 4, N'Teacher')
SET IDENTITY_INSERT [dbo].[UserRole] OFF
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_User]
GO
USE [master]
GO
ALTER DATABASE [Login] SET  READ_WRITE 
GO
