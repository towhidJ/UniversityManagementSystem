USE [master]
GO
/****** Object:  Database [StudentManagementSystem]    Script Date: 11/29/2019 11:51:57 PM ******/
CREATE DATABASE [StudentManagementSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudentManagementSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.JOYA\MSSQL\DATA\StudentManagementSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StudentManagementSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.JOYA\MSSQL\DATA\StudentManagementSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [StudentManagementSystem] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudentManagementSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudentManagementSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudentManagementSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudentManagementSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudentManagementSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudentManagementSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudentManagementSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StudentManagementSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudentManagementSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudentManagementSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudentManagementSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudentManagementSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudentManagementSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudentManagementSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudentManagementSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudentManagementSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StudentManagementSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudentManagementSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudentManagementSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudentManagementSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudentManagementSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudentManagementSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudentManagementSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudentManagementSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [StudentManagementSystem] SET  MULTI_USER 
GO
ALTER DATABASE [StudentManagementSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudentManagementSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudentManagementSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudentManagementSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StudentManagementSystem] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'StudentManagementSystem', N'ON'
GO
ALTER DATABASE [StudentManagementSystem] SET QUERY_STORE = OFF
GO
USE [StudentManagementSystem]
GO
/****** Object:  Table [dbo].[ClassAllocateTB]    Script Date: 11/29/2019 11:51:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassAllocateTB](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[DayId] [int] NOT NULL,
	[FromTime] [datetime] NOT NULL,
	[ToTime] [datetime] NOT NULL,
	[Action] [int] NOT NULL,
 CONSTRAINT [PK_ClassAllocateTB] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseTB]    Script Date: 11/29/2019 11:51:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseTB](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[SemesterId] [int] NOT NULL,
	[CourseName] [varchar](50) NOT NULL,
	[CourseCode] [varchar](50) NOT NULL,
	[Credit] [varchar](50) NOT NULL,
	[Description] [varchar](50) NULL,
	[Action] [int] NULL,
 CONSTRAINT [PK_CourseTB] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DayTB]    Script Date: 11/29/2019 11:51:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DayTB](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DayName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DayTB] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomNoTB]    Script Date: 11/29/2019 11:51:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomNoTB](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomNo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_RoomNoTB] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ClassAllocatedView]    Script Date: 11/29/2019 11:51:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ClassAllocatedView]
AS
SELECT        dbo.ClassAllocateTB.DepartmentId, dbo.ClassAllocateTB.CourseId, dbo.CourseTB.CourseCode, dbo.CourseTB.CourseName, dbo.DayTB.DayName, dbo.RoomNoTB.RoomNo, dbo.ClassAllocateTB.FromTime, 
                         dbo.ClassAllocateTB.ToTime, dbo.ClassAllocateTB.Action, dbo.CourseTB.Action AS CourseAction
FROM            dbo.ClassAllocateTB INNER JOIN
                         dbo.CourseTB ON dbo.ClassAllocateTB.CourseId = dbo.CourseTB.Id INNER JOIN
                         dbo.DayTB ON dbo.ClassAllocateTB.DayId = dbo.DayTB.Id INNER JOIN
                         dbo.RoomNoTB ON dbo.ClassAllocateTB.RoomId = dbo.RoomNoTB.Id


GO
/****** Object:  Table [dbo].[DepartmentTB]    Script Date: 11/29/2019 11:51:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DepartmentTB](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentCode] [varchar](50) NOT NULL,
	[DepartmentName] [varchar](150) NOT NULL,
 CONSTRAINT [PK_DepartmentTB] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeacherTB]    Script Date: 11/29/2019 11:51:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeacherTB](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DesignationId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[RoleId] [int] NULL,
	[TeacherName] [varchar](50) NOT NULL,
	[Address] [varchar](250) NOT NULL,
	[Email] [varchar](80) NOT NULL,
	[ContactNo] [varchar](20) NOT NULL,
	[CreditToBeTaken] [float] NOT NULL,
	[ReminingCredit] [float] NOT NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK_TeacherTB] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[CourseAssignView]    Script Date: 11/29/2019 11:51:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CourseAssignView]
AS
SELECT        dbo.TeacherTB.DepartmentId, dbo.TeacherTB.CreditToBeTaken, dbo.TeacherTB.ReminingCredit, dbo.CourseTB.Id AS CourseId, dbo.CourseTB.CourseName, dbo.CourseTB.CourseCode, dbo.CourseTB.Credit, 
                         dbo.TeacherTB.Id AS TeacherId, dbo.TeacherTB.TeacherName
FROM            dbo.CourseTB INNER JOIN
                         dbo.DepartmentTB ON dbo.CourseTB.DepartmentId = dbo.DepartmentTB.Id INNER JOIN
                         dbo.TeacherTB ON dbo.DepartmentTB.Id = dbo.TeacherTB.DepartmentId


GO
/****** Object:  Table [dbo].[CourseAssignTB]    Script Date: 11/29/2019 11:51:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseAssignTB](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[TeacherId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
 CONSTRAINT [PK_CourseAssignTB] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SemesterTB]    Script Date: 11/29/2019 11:51:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SemesterTB](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SemesterName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SemesterTB] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ShowAssignView]    Script Date: 11/29/2019 11:51:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ShowAssignView]
AS
SELECT        dbo.CourseAssignTB.DepartmentId, dbo.CourseAssignTB.TeacherId, dbo.CourseAssignTB.CourseId, dbo.CourseAssignTB.Id, dbo.CourseTB.SemesterId, dbo.CourseTB.CourseName, dbo.CourseTB.CourseCode, 
                         dbo.CourseTB.Credit, dbo.DepartmentTB.DepartmentName, dbo.SemesterTB.SemesterName, dbo.TeacherTB.TeacherName, dbo.TeacherTB.CreditToBeTaken, dbo.TeacherTB.ReminingCredit, dbo.CourseTB.Action
FROM            dbo.CourseAssignTB INNER JOIN
                         dbo.CourseTB ON dbo.CourseAssignTB.CourseId = dbo.CourseTB.Id INNER JOIN
                         dbo.DepartmentTB ON dbo.CourseAssignTB.DepartmentId = dbo.DepartmentTB.Id AND dbo.CourseTB.DepartmentId = dbo.DepartmentTB.Id INNER JOIN
                         dbo.SemesterTB ON dbo.CourseTB.SemesterId = dbo.SemesterTB.Id INNER JOIN
                         dbo.TeacherTB ON dbo.CourseAssignTB.TeacherId = dbo.TeacherTB.Id AND dbo.DepartmentTB.Id = dbo.TeacherTB.DepartmentId


GO
/****** Object:  Table [dbo].[EnrollCourseTB]    Script Date: 11/29/2019 11:51:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnrollCourseTB](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_EnrollCourseTB] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentTB]    Script Date: 11/29/2019 11:51:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentTB](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[RoleId] [int] NULL,
	[StudentName] [varchar](50) NOT NULL,
	[Email] [varchar](150) NOT NULL,
	[ContactNo] [varchar](14) NOT NULL,
	[RegisterDate] [date] NOT NULL,
	[Address] [varchar](150) NOT NULL,
	[RegistrationNo] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK_StudentTB] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[StudentCourseView]    Script Date: 11/29/2019 11:51:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[StudentCourseView]
AS
SELECT        dbo.CourseTB.CourseName, dbo.StudentTB.StudentName, dbo.EnrollCourseTB.StudentId
FROM            dbo.CourseTB INNER JOIN
                         dbo.EnrollCourseTB ON dbo.CourseTB.Id = dbo.EnrollCourseTB.CourseId INNER JOIN
                         dbo.StudentTB ON dbo.EnrollCourseTB.StudentId = dbo.StudentTB.Id

GO
/****** Object:  Table [dbo].[AdminTB]    Script Date: 11/29/2019 11:51:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminTB](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK_AdminTB] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CodeingClubTB]    Script Date: 11/29/2019 11:51:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CodeingClubTB](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ExpDate] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](50) NULL,
	[StudentId] [int] NOT NULL,
 CONSTRAINT [PK_CodeingClubTB] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CodingClubAdvTB]    Script Date: 11/29/2019 11:51:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CodingClubAdvTB](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [int] NOT NULL,
	[JoinDate] [date] NULL,
 CONSTRAINT [PK_CodingClubAdvTB] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DesignationTB]    Script Date: 11/29/2019 11:51:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DesignationTB](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DesignationName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DesignationTB] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GradeLetterTB]    Script Date: 11/29/2019 11:51:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GradeLetterTB](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GradeLetterMarkes] [varchar](30) NOT NULL,
	[GradePoint] [varchar](50) NOT NULL,
 CONSTRAINT [PK_GradeLetterTB] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NetClubAdvTB]    Script Date: 11/29/2019 11:51:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NetClubAdvTB](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [int] NOT NULL,
	[JoinDate] [date] NULL,
 CONSTRAINT [PK_NetClubAdvTB] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NetworkingClubTB]    Script Date: 11/29/2019 11:51:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NetworkingClubTB](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[ExpDate] [nvarchar](max) NOT NULL,
	[Type] [nvarchar](50) NULL,
 CONSTRAINT [PK_NetworkingClubTB] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleTB]    Script Date: 11/29/2019 11:51:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleTB](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Role] [varchar](50) NOT NULL,
 CONSTRAINT [PK_RoleTB] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentResultTB]    Script Date: 11/29/2019 11:51:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentResultTB](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[GradeLetterId] [int] NOT NULL,
 CONSTRAINT [PK_StudentResultTB] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AdminTB] ON 

INSERT [dbo].[AdminTB] ([Id], [RoleId], [Name], [Email], [Password]) VALUES (1, 2, N'Keya', N'keya@gmail.com', N'123456')
SET IDENTITY_INSERT [dbo].[AdminTB] OFF
SET IDENTITY_INSERT [dbo].[CodeingClubTB] ON 

INSERT [dbo].[CodeingClubTB] ([Id], [ExpDate], [Type], [StudentId]) VALUES (1, N'2020-12-31', N'Member', 1)
SET IDENTITY_INSERT [dbo].[CodeingClubTB] OFF
SET IDENTITY_INSERT [dbo].[CodingClubAdvTB] ON 

INSERT [dbo].[CodingClubAdvTB] ([Id], [TeacherId], [JoinDate]) VALUES (1, 2, CAST(N'2019-11-08' AS Date))
SET IDENTITY_INSERT [dbo].[CodingClubAdvTB] OFF
SET IDENTITY_INSERT [dbo].[CourseAssignTB] ON 

INSERT [dbo].[CourseAssignTB] ([Id], [DepartmentId], [TeacherId], [CourseId]) VALUES (1, 1, 1, 1)
INSERT [dbo].[CourseAssignTB] ([Id], [DepartmentId], [TeacherId], [CourseId]) VALUES (2, 1, 2, 2)
INSERT [dbo].[CourseAssignTB] ([Id], [DepartmentId], [TeacherId], [CourseId]) VALUES (3, 1, 4, 3)
SET IDENTITY_INSERT [dbo].[CourseAssignTB] OFF
SET IDENTITY_INSERT [dbo].[CourseTB] ON 

INSERT [dbo].[CourseTB] ([Id], [DepartmentId], [SemesterId], [CourseName], [CourseCode], [Credit], [Description], [Action]) VALUES (1, 1, 1, N'C programming', N'CSE-1101', N'3', N'Programming Language', 1)
INSERT [dbo].[CourseTB] ([Id], [DepartmentId], [SemesterId], [CourseName], [CourseCode], [Credit], [Description], [Action]) VALUES (2, 1, 3, N'Computer Architechure', N'CSE-2101', N'3', N'CA', 1)
INSERT [dbo].[CourseTB] ([Id], [DepartmentId], [SemesterId], [CourseName], [CourseCode], [Credit], [Description], [Action]) VALUES (3, 1, 4, N'Database Managment System', N'CSE-2201', N'2', N'DBMS', 1)
SET IDENTITY_INSERT [dbo].[CourseTB] OFF
SET IDENTITY_INSERT [dbo].[DepartmentTB] ON 

INSERT [dbo].[DepartmentTB] ([Id], [DepartmentCode], [DepartmentName]) VALUES (1, N'CSE', N'Computer Science & Engineering')
SET IDENTITY_INSERT [dbo].[DepartmentTB] OFF
SET IDENTITY_INSERT [dbo].[DesignationTB] ON 

INSERT [dbo].[DesignationTB] ([Id], [DesignationName]) VALUES (1, N'Professor')
INSERT [dbo].[DesignationTB] ([Id], [DesignationName]) VALUES (2, N'Associate Professor')
INSERT [dbo].[DesignationTB] ([Id], [DesignationName]) VALUES (3, N'Senior Lecturer')
INSERT [dbo].[DesignationTB] ([Id], [DesignationName]) VALUES (4, N'Lecturer')
SET IDENTITY_INSERT [dbo].[DesignationTB] OFF
SET IDENTITY_INSERT [dbo].[EnrollCourseTB] ON 

INSERT [dbo].[EnrollCourseTB] ([Id], [StudentId], [CourseId], [Date]) VALUES (1, 1, 1, CAST(N'2019-11-01' AS Date))
INSERT [dbo].[EnrollCourseTB] ([Id], [StudentId], [CourseId], [Date]) VALUES (2, 1, 2, CAST(N'2019-11-01' AS Date))
INSERT [dbo].[EnrollCourseTB] ([Id], [StudentId], [CourseId], [Date]) VALUES (3, 2, 2, CAST(N'2019-11-01' AS Date))
INSERT [dbo].[EnrollCourseTB] ([Id], [StudentId], [CourseId], [Date]) VALUES (4, 4, 1, CAST(N'2019-11-08' AS Date))
INSERT [dbo].[EnrollCourseTB] ([Id], [StudentId], [CourseId], [Date]) VALUES (5, 4, 3, CAST(N'2019-11-08' AS Date))
INSERT [dbo].[EnrollCourseTB] ([Id], [StudentId], [CourseId], [Date]) VALUES (6, 3, 3, CAST(N'2019-11-08' AS Date))
SET IDENTITY_INSERT [dbo].[EnrollCourseTB] OFF
SET IDENTITY_INSERT [dbo].[GradeLetterTB] ON 

INSERT [dbo].[GradeLetterTB] ([Id], [GradeLetterMarkes], [GradePoint]) VALUES (1, N'A+', N'4.00')
INSERT [dbo].[GradeLetterTB] ([Id], [GradeLetterMarkes], [GradePoint]) VALUES (3, N'A', N'3.70')
INSERT [dbo].[GradeLetterTB] ([Id], [GradeLetterMarkes], [GradePoint]) VALUES (4, N'A-', N'3.30')
INSERT [dbo].[GradeLetterTB] ([Id], [GradeLetterMarkes], [GradePoint]) VALUES (5, N'B+', N'3.00')
INSERT [dbo].[GradeLetterTB] ([Id], [GradeLetterMarkes], [GradePoint]) VALUES (6, N'B-', N'2.70')
INSERT [dbo].[GradeLetterTB] ([Id], [GradeLetterMarkes], [GradePoint]) VALUES (7, N'C+', N'2.30')
INSERT [dbo].[GradeLetterTB] ([Id], [GradeLetterMarkes], [GradePoint]) VALUES (8, N'C-', N'2.00')
INSERT [dbo].[GradeLetterTB] ([Id], [GradeLetterMarkes], [GradePoint]) VALUES (9, N'D+', N'1.30')
INSERT [dbo].[GradeLetterTB] ([Id], [GradeLetterMarkes], [GradePoint]) VALUES (10, N'D-', N'1.00')
INSERT [dbo].[GradeLetterTB] ([Id], [GradeLetterMarkes], [GradePoint]) VALUES (11, N'F', N'0.00')
SET IDENTITY_INSERT [dbo].[GradeLetterTB] OFF
SET IDENTITY_INSERT [dbo].[NetClubAdvTB] ON 

INSERT [dbo].[NetClubAdvTB] ([Id], [TeacherId], [JoinDate]) VALUES (1, 2, CAST(N'2019-11-01' AS Date))
SET IDENTITY_INSERT [dbo].[NetClubAdvTB] OFF
SET IDENTITY_INSERT [dbo].[RoleTB] ON 

INSERT [dbo].[RoleTB] ([Id], [Role]) VALUES (1, N'Student')
INSERT [dbo].[RoleTB] ([Id], [Role]) VALUES (2, N'Admin')
INSERT [dbo].[RoleTB] ([Id], [Role]) VALUES (3, N'Teacher')
SET IDENTITY_INSERT [dbo].[RoleTB] OFF
SET IDENTITY_INSERT [dbo].[RoomNoTB] ON 

INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (1, N'101')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (2, N'102')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (3, N'103')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (4, N'104')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (5, N'105')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (6, N'106')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (7, N'107')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (8, N'108')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (9, N'109')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (10, N'110')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (11, N'111(MP LAB)')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (12, N'112')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (13, N'113')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (14, N'114')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (15, N'121(SE LAB)')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (16, N'118(Programming LAB)')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (17, N'210')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (18, N'211')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (19, N'212')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (20, N'213')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (21, N'214')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (22, N'215')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (23, N'216')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (24, N'217')
SET IDENTITY_INSERT [dbo].[RoomNoTB] OFF
SET IDENTITY_INSERT [dbo].[SemesterTB] ON 

INSERT [dbo].[SemesterTB] ([Id], [SemesterName]) VALUES (1, N'1st')
INSERT [dbo].[SemesterTB] ([Id], [SemesterName]) VALUES (2, N'2nd')
INSERT [dbo].[SemesterTB] ([Id], [SemesterName]) VALUES (3, N'3rd')
INSERT [dbo].[SemesterTB] ([Id], [SemesterName]) VALUES (4, N'4th')
INSERT [dbo].[SemesterTB] ([Id], [SemesterName]) VALUES (5, N'5th')
INSERT [dbo].[SemesterTB] ([Id], [SemesterName]) VALUES (6, N'6th')
INSERT [dbo].[SemesterTB] ([Id], [SemesterName]) VALUES (7, N'7th')
INSERT [dbo].[SemesterTB] ([Id], [SemesterName]) VALUES (8, N'8th')
SET IDENTITY_INSERT [dbo].[SemesterTB] OFF
SET IDENTITY_INSERT [dbo].[StudentTB] ON 

INSERT [dbo].[StudentTB] ([Id], [DepartmentId], [RoleId], [StudentName], [Email], [ContactNo], [RegisterDate], [Address], [RegistrationNo], [Password]) VALUES (1, 1, 1, N'Prima Kanungo', N'prima@gmail.com', N'018000000000', CAST(N'2019-11-19' AS Date), N'patiya', N'CSE-2019-001', N'123456')
INSERT [dbo].[StudentTB] ([Id], [DepartmentId], [RoleId], [StudentName], [Email], [ContactNo], [RegisterDate], [Address], [RegistrationNo], [Password]) VALUES (2, 1, 1, N'Abdul', N'abdul@gmail.com', N'01801801801', CAST(N'2019-11-22' AS Date), N'Patiya', N'CSE-2019-002', N'123456')
INSERT [dbo].[StudentTB] ([Id], [DepartmentId], [RoleId], [StudentName], [Email], [ContactNo], [RegisterDate], [Address], [RegistrationNo], [Password]) VALUES (3, 1, 1, N'Mojid', N'mojid@gmail.com', N'01801801212', CAST(N'2019-11-22' AS Date), N'Patiya', N'CSE-2019-003', N'123456')
INSERT [dbo].[StudentTB] ([Id], [DepartmentId], [RoleId], [StudentName], [Email], [ContactNo], [RegisterDate], [Address], [RegistrationNo], [Password]) VALUES (4, 1, 1, N'Chamak Karmokar', N'chamak@gmail.com', N'01801801801', CAST(N'2019-11-27' AS Date), N'Kotwali,Chittagong', N'CSE-2019-004', N'123456')
SET IDENTITY_INSERT [dbo].[StudentTB] OFF
SET IDENTITY_INSERT [dbo].[TeacherTB] ON 

INSERT [dbo].[TeacherTB] ([Id], [DesignationId], [DepartmentId], [RoleId], [TeacherName], [Address], [Email], [ContactNo], [CreditToBeTaken], [ReminingCredit], [Password]) VALUES (1, 3, 1, 3, N'Md Abdul wahab', N'Ptiya,Bangladesh', N'mdwahab@gmail.com', N'01801801801', 30, 27, N'123456')
INSERT [dbo].[TeacherTB] ([Id], [DesignationId], [DepartmentId], [RoleId], [TeacherName], [Address], [Email], [ContactNo], [CreditToBeTaken], [ReminingCredit], [Password]) VALUES (2, 3, 1, 3, N'Bristy Roy Chowdhury', N'Chittagong,Bangladesh', N'bristyroy@gmail.com', N'01801801212', 30, 27, N'123456')
INSERT [dbo].[TeacherTB] ([Id], [DesignationId], [DepartmentId], [RoleId], [TeacherName], [Address], [Email], [ContactNo], [CreditToBeTaken], [ReminingCredit], [Password]) VALUES (4, 3, 1, 3, N'Munmun Biswas', N'Patiya', N'munmun@gmail.com', N'01801801212', 20, 18, N'')
SET IDENTITY_INSERT [dbo].[TeacherTB] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UniqKey_CourseCode]    Script Date: 11/29/2019 11:51:58 PM ******/
ALTER TABLE [dbo].[CourseTB] ADD  CONSTRAINT [UniqKey_CourseCode] UNIQUE NONCLUSTERED 
(
	[CourseCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UniqKey_CourseName]    Script Date: 11/29/2019 11:51:58 PM ******/
ALTER TABLE [dbo].[CourseTB] ADD  CONSTRAINT [UniqKey_CourseName] UNIQUE NONCLUSTERED 
(
	[CourseName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Code_d]    Script Date: 11/29/2019 11:51:58 PM ******/
ALTER TABLE [dbo].[DepartmentTB] ADD  CONSTRAINT [UQ_Code_d] UNIQUE NONCLUSTERED 
(
	[DepartmentCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Name_D]    Script Date: 11/29/2019 11:51:58 PM ******/
ALTER TABLE [dbo].[DepartmentTB] ADD  CONSTRAINT [UQ_Name_D] UNIQUE NONCLUSTERED 
(
	[DepartmentName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Unique_Email]    Script Date: 11/29/2019 11:51:58 PM ******/
ALTER TABLE [dbo].[StudentTB] ADD  CONSTRAINT [Unique_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UniqueKey_Email]    Script Date: 11/29/2019 11:51:58 PM ******/
ALTER TABLE [dbo].[TeacherTB] ADD  CONSTRAINT [UniqueKey_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ClassAllocateTB] ADD  CONSTRAINT [DF_ClassAllocateTB_Action]  DEFAULT ((1)) FOR [Action]
GO
ALTER TABLE [dbo].[NetworkingClubTB] ADD  CONSTRAINT [DF_NetworkingClubTB_Type]  DEFAULT (N'Member') FOR [Type]
GO
ALTER TABLE [dbo].[StudentTB] ADD  CONSTRAINT [DF_StudentTB_RoleId]  DEFAULT ((1)) FOR [RoleId]
GO
ALTER TABLE [dbo].[StudentTB] ADD  CONSTRAINT [DF_StudentTB_Password]  DEFAULT ((123456)) FOR [Password]
GO
ALTER TABLE [dbo].[TeacherTB] ADD  CONSTRAINT [DF_TeacherTB_RoleId]  DEFAULT ((3)) FOR [RoleId]
GO
ALTER TABLE [dbo].[TeacherTB] ADD  CONSTRAINT [DF_TeacherTB_Password]  DEFAULT ((123456)) FOR [Password]
GO
ALTER TABLE [dbo].[AdminTB]  WITH CHECK ADD  CONSTRAINT [FK_AdminTB_RoleTB] FOREIGN KEY([RoleId])
REFERENCES [dbo].[RoleTB] ([Id])
GO
ALTER TABLE [dbo].[AdminTB] CHECK CONSTRAINT [FK_AdminTB_RoleTB]
GO
ALTER TABLE [dbo].[ClassAllocateTB]  WITH CHECK ADD  CONSTRAINT [FK_ClassAllocateTB_CourseTB] FOREIGN KEY([CourseId])
REFERENCES [dbo].[CourseTB] ([Id])
GO
ALTER TABLE [dbo].[ClassAllocateTB] CHECK CONSTRAINT [FK_ClassAllocateTB_CourseTB]
GO
ALTER TABLE [dbo].[ClassAllocateTB]  WITH CHECK ADD  CONSTRAINT [FK_ClassAllocateTB_DayTB] FOREIGN KEY([DayId])
REFERENCES [dbo].[DayTB] ([Id])
GO
ALTER TABLE [dbo].[ClassAllocateTB] CHECK CONSTRAINT [FK_ClassAllocateTB_DayTB]
GO
ALTER TABLE [dbo].[ClassAllocateTB]  WITH CHECK ADD  CONSTRAINT [FK_ClassAllocateTB_DepartmentTB] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[DepartmentTB] ([Id])
GO
ALTER TABLE [dbo].[ClassAllocateTB] CHECK CONSTRAINT [FK_ClassAllocateTB_DepartmentTB]
GO
ALTER TABLE [dbo].[ClassAllocateTB]  WITH CHECK ADD  CONSTRAINT [FK_ClassAllocateTB_RoomNoTB] FOREIGN KEY([RoomId])
REFERENCES [dbo].[RoomNoTB] ([Id])
GO
ALTER TABLE [dbo].[ClassAllocateTB] CHECK CONSTRAINT [FK_ClassAllocateTB_RoomNoTB]
GO
ALTER TABLE [dbo].[CodeingClubTB]  WITH CHECK ADD  CONSTRAINT [FK_CodeingClubTB_StudentTB] FOREIGN KEY([StudentId])
REFERENCES [dbo].[StudentTB] ([Id])
GO
ALTER TABLE [dbo].[CodeingClubTB] CHECK CONSTRAINT [FK_CodeingClubTB_StudentTB]
GO
ALTER TABLE [dbo].[CodingClubAdvTB]  WITH CHECK ADD  CONSTRAINT [FK_CodingClubAdvTB_TeacherTB] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[TeacherTB] ([Id])
GO
ALTER TABLE [dbo].[CodingClubAdvTB] CHECK CONSTRAINT [FK_CodingClubAdvTB_TeacherTB]
GO
ALTER TABLE [dbo].[CourseAssignTB]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssignTB_CourseTB] FOREIGN KEY([CourseId])
REFERENCES [dbo].[CourseTB] ([Id])
GO
ALTER TABLE [dbo].[CourseAssignTB] CHECK CONSTRAINT [FK_CourseAssignTB_CourseTB]
GO
ALTER TABLE [dbo].[CourseAssignTB]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssignTB_DepartmentTB] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[DepartmentTB] ([Id])
GO
ALTER TABLE [dbo].[CourseAssignTB] CHECK CONSTRAINT [FK_CourseAssignTB_DepartmentTB]
GO
ALTER TABLE [dbo].[CourseAssignTB]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssignTB_TeacherTB] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[TeacherTB] ([Id])
GO
ALTER TABLE [dbo].[CourseAssignTB] CHECK CONSTRAINT [FK_CourseAssignTB_TeacherTB]
GO
ALTER TABLE [dbo].[CourseTB]  WITH CHECK ADD  CONSTRAINT [FK_CourseTB_DepartmentTB] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[DepartmentTB] ([Id])
GO
ALTER TABLE [dbo].[CourseTB] CHECK CONSTRAINT [FK_CourseTB_DepartmentTB]
GO
ALTER TABLE [dbo].[CourseTB]  WITH CHECK ADD  CONSTRAINT [FK_CourseTB_SemesterTB] FOREIGN KEY([SemesterId])
REFERENCES [dbo].[SemesterTB] ([Id])
GO
ALTER TABLE [dbo].[CourseTB] CHECK CONSTRAINT [FK_CourseTB_SemesterTB]
GO
ALTER TABLE [dbo].[EnrollCourseTB]  WITH CHECK ADD  CONSTRAINT [FK_EnrollCourseTB_CourseTB] FOREIGN KEY([CourseId])
REFERENCES [dbo].[CourseTB] ([Id])
GO
ALTER TABLE [dbo].[EnrollCourseTB] CHECK CONSTRAINT [FK_EnrollCourseTB_CourseTB]
GO
ALTER TABLE [dbo].[EnrollCourseTB]  WITH CHECK ADD  CONSTRAINT [FK_EnrollCourseTB_StudentTB] FOREIGN KEY([StudentId])
REFERENCES [dbo].[StudentTB] ([Id])
GO
ALTER TABLE [dbo].[EnrollCourseTB] CHECK CONSTRAINT [FK_EnrollCourseTB_StudentTB]
GO
ALTER TABLE [dbo].[NetClubAdvTB]  WITH CHECK ADD  CONSTRAINT [FK_NetClubAdvTB_TeacherTB] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[TeacherTB] ([Id])
GO
ALTER TABLE [dbo].[NetClubAdvTB] CHECK CONSTRAINT [FK_NetClubAdvTB_TeacherTB]
GO
ALTER TABLE [dbo].[NetworkingClubTB]  WITH CHECK ADD  CONSTRAINT [FK_NetworkingClubTB_StudentTB] FOREIGN KEY([StudentId])
REFERENCES [dbo].[StudentTB] ([Id])
GO
ALTER TABLE [dbo].[NetworkingClubTB] CHECK CONSTRAINT [FK_NetworkingClubTB_StudentTB]
GO
ALTER TABLE [dbo].[StudentResultTB]  WITH CHECK ADD  CONSTRAINT [FK_StudentResultTB_CourseTB] FOREIGN KEY([CourseId])
REFERENCES [dbo].[CourseTB] ([Id])
GO
ALTER TABLE [dbo].[StudentResultTB] CHECK CONSTRAINT [FK_StudentResultTB_CourseTB]
GO
ALTER TABLE [dbo].[StudentResultTB]  WITH CHECK ADD  CONSTRAINT [FK_StudentResultTB_GradeLetterTB] FOREIGN KEY([GradeLetterId])
REFERENCES [dbo].[GradeLetterTB] ([Id])
GO
ALTER TABLE [dbo].[StudentResultTB] CHECK CONSTRAINT [FK_StudentResultTB_GradeLetterTB]
GO
ALTER TABLE [dbo].[StudentTB]  WITH CHECK ADD  CONSTRAINT [FK_StudentTB_RoleTB] FOREIGN KEY([RoleId])
REFERENCES [dbo].[RoleTB] ([Id])
GO
ALTER TABLE [dbo].[StudentTB] CHECK CONSTRAINT [FK_StudentTB_RoleTB]
GO
ALTER TABLE [dbo].[StudentTB]  WITH CHECK ADD  CONSTRAINT [FK_StudentTB_StudentTB] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[DepartmentTB] ([Id])
GO
ALTER TABLE [dbo].[StudentTB] CHECK CONSTRAINT [FK_StudentTB_StudentTB]
GO
ALTER TABLE [dbo].[TeacherTB]  WITH CHECK ADD  CONSTRAINT [FK_TeacherTB_DepartmentTB] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[DepartmentTB] ([Id])
GO
ALTER TABLE [dbo].[TeacherTB] CHECK CONSTRAINT [FK_TeacherTB_DepartmentTB]
GO
ALTER TABLE [dbo].[TeacherTB]  WITH CHECK ADD  CONSTRAINT [FK_TeacherTB_DesignationTB] FOREIGN KEY([DesignationId])
REFERENCES [dbo].[DesignationTB] ([Id])
GO
ALTER TABLE [dbo].[TeacherTB] CHECK CONSTRAINT [FK_TeacherTB_DesignationTB]
GO
ALTER TABLE [dbo].[TeacherTB]  WITH CHECK ADD  CONSTRAINT [FK_TeacherTB_RoleTB] FOREIGN KEY([RoleId])
REFERENCES [dbo].[RoleTB] ([Id])
GO
ALTER TABLE [dbo].[TeacherTB] CHECK CONSTRAINT [FK_TeacherTB_RoleTB]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ClassAllocateTB"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "CourseTB"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "DayTB"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 102
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RoomNoTB"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 102
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ClassAllocatedView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ClassAllocatedView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CourseTB"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "DepartmentTB"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 430
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TeacherTB"
            Begin Extent = 
               Top = 6
               Left = 468
               Bottom = 136
               Right = 648
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CourseAssignView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CourseAssignView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CourseAssignTB"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CourseTB"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "DepartmentTB"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 119
               Right = 638
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SemesterTB"
            Begin Extent = 
               Top = 6
               Left = 676
               Bottom = 102
               Right = 846
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TeacherTB"
            Begin Extent = 
               Top = 6
               Left = 884
               Bottom = 136
               Right = 1064
            End
            DisplayFlags = 280
            TopColumn = 5
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
   ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ShowAssignView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'      Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ShowAssignView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ShowAssignView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CourseTB"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "EnrollCourseTB"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "StudentTB"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'StudentCourseView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'StudentCourseView'
GO
USE [master]
GO
ALTER DATABASE [StudentManagementSystem] SET  READ_WRITE 
GO
