USE [master]
GO
/****** Object:  Database [UniversityMS]    Script Date: 5/29/2019 5:53:03 PM ******/
CREATE DATABASE [UniversityMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UniversityMS', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\UniversityMS.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UniversityMS_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\UniversityMS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UniversityMS] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UniversityMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UniversityMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UniversityMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UniversityMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UniversityMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UniversityMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [UniversityMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UniversityMS] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UniversityMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UniversityMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UniversityMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UniversityMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UniversityMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UniversityMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UniversityMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UniversityMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UniversityMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UniversityMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UniversityMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UniversityMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UniversityMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UniversityMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UniversityMS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UniversityMS] SET  MULTI_USER 
GO
ALTER DATABASE [UniversityMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UniversityMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UniversityMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UniversityMS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [UniversityMS]
GO
/****** Object:  Table [dbo].[ClassAllocateTB]    Script Date: 5/29/2019 5:53:03 PM ******/
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
/****** Object:  Table [dbo].[CourseAssignTB]    Script Date: 5/29/2019 5:53:03 PM ******/
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
/****** Object:  Table [dbo].[CourseTB]    Script Date: 5/29/2019 5:53:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DayTB]    Script Date: 5/29/2019 5:53:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DepartmentTB]    Script Date: 5/29/2019 5:53:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DesignationTB]    Script Date: 5/29/2019 5:53:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EnrollCourseTB]    Script Date: 5/29/2019 5:53:03 PM ******/
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
/****** Object:  Table [dbo].[GradeLetterTB]    Script Date: 5/29/2019 5:53:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RoomNoTB]    Script Date: 5/29/2019 5:53:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SemesterTB]    Script Date: 5/29/2019 5:53:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentResultTB]    Script Date: 5/29/2019 5:53:03 PM ******/
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
/****** Object:  Table [dbo].[StudentTB]    Script Date: 5/29/2019 5:53:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentTB](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[StudentName] [varchar](50) NOT NULL,
	[Email] [varchar](150) NOT NULL,
	[ContactNo] [varchar](14) NOT NULL,
	[RegisterDate] [date] NOT NULL,
	[Address] [varchar](150) NOT NULL,
	[RegistrationNo] [varchar](50) NULL,
 CONSTRAINT [PK_StudentTB] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TeacherTB]    Script Date: 5/29/2019 5:53:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TeacherTB](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DesignationId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[TeacherName] [varchar](50) NOT NULL,
	[Address] [varchar](250) NOT NULL,
	[Email] [varchar](80) NOT NULL,
	[ContactNo] [varchar](20) NOT NULL,
	[CreditToBeTaken] [float] NOT NULL,
	[ReminingCredit] [float] NOT NULL,
 CONSTRAINT [PK_TeacherTB] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[ClassAllocatedView]    Script Date: 5/29/2019 5:53:03 PM ******/
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
/****** Object:  View [dbo].[CourseAssignView]    Script Date: 5/29/2019 5:53:03 PM ******/
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
/****** Object:  View [dbo].[ShowAssignView]    Script Date: 5/29/2019 5:53:03 PM ******/
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
/****** Object:  View [dbo].[StudentCourseView]    Script Date: 5/29/2019 5:53:03 PM ******/
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
SET IDENTITY_INSERT [dbo].[ClassAllocateTB] ON 

INSERT [dbo].[ClassAllocateTB] ([Id], [DepartmentId], [RoomId], [CourseId], [DayId], [FromTime], [ToTime], [Action]) VALUES (2, 2, 1, 1002, 1, CAST(0x0000AA3A010DB6E0 AS DateTime), CAST(0x0000AA3A011E77F0 AS DateTime), 1)
INSERT [dbo].[ClassAllocateTB] ([Id], [DepartmentId], [RoomId], [CourseId], [DayId], [FromTime], [ToTime], [Action]) VALUES (6, 2, 1, 1, 1, CAST(0x0000AA3A00FD3C20 AS DateTime), CAST(0x0000AA3A010DFD30 AS DateTime), 1)
INSERT [dbo].[ClassAllocateTB] ([Id], [DepartmentId], [RoomId], [CourseId], [DayId], [FromTime], [ToTime], [Action]) VALUES (7, 2, 1, 1, 2, CAST(0x0000AA3A0173E320 AS DateTime), CAST(0x0000AA3A01845DE0 AS DateTime), 1)
INSERT [dbo].[ClassAllocateTB] ([Id], [DepartmentId], [RoomId], [CourseId], [DayId], [FromTime], [ToTime], [Action]) VALUES (1003, 2, 4, 1002, 2, CAST(0x0000AA3C00D63BC0 AS DateTime), CAST(0x0000AA3C00E6B680 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[ClassAllocateTB] OFF
SET IDENTITY_INSERT [dbo].[CourseAssignTB] ON 

INSERT [dbo].[CourseAssignTB] ([Id], [DepartmentId], [TeacherId], [CourseId]) VALUES (2, 2, 1, 1)
INSERT [dbo].[CourseAssignTB] ([Id], [DepartmentId], [TeacherId], [CourseId]) VALUES (3, 2, 3, 2006)
INSERT [dbo].[CourseAssignTB] ([Id], [DepartmentId], [TeacherId], [CourseId]) VALUES (4, 2, 3, 2005)
INSERT [dbo].[CourseAssignTB] ([Id], [DepartmentId], [TeacherId], [CourseId]) VALUES (5, 2, 3, 1002)
INSERT [dbo].[CourseAssignTB] ([Id], [DepartmentId], [TeacherId], [CourseId]) VALUES (6, 2, 1, 2007)
INSERT [dbo].[CourseAssignTB] ([Id], [DepartmentId], [TeacherId], [CourseId]) VALUES (7, 2, 1, 2008)
INSERT [dbo].[CourseAssignTB] ([Id], [DepartmentId], [TeacherId], [CourseId]) VALUES (1007, 1005, 4, 3008)
INSERT [dbo].[CourseAssignTB] ([Id], [DepartmentId], [TeacherId], [CourseId]) VALUES (1008, 2, 3, 3009)
INSERT [dbo].[CourseAssignTB] ([Id], [DepartmentId], [TeacherId], [CourseId]) VALUES (1009, 2, 3, 3010)
SET IDENTITY_INSERT [dbo].[CourseAssignTB] OFF
SET IDENTITY_INSERT [dbo].[CourseTB] ON 

INSERT [dbo].[CourseTB] ([Id], [DepartmentId], [SemesterId], [CourseName], [CourseCode], [Credit], [Description], [Action]) VALUES (1, 2, 3, N'PYTHON', N'CSE-2101', N'3', N'', 1)
INSERT [dbo].[CourseTB] ([Id], [DepartmentId], [SemesterId], [CourseName], [CourseCode], [Credit], [Description], [Action]) VALUES (1002, 2, 3, N'Java Programing', N'CSE-2102', N'3', N'Programming Language', 1)
INSERT [dbo].[CourseTB] ([Id], [DepartmentId], [SemesterId], [CourseName], [CourseCode], [Credit], [Description], [Action]) VALUES (2004, 2, 1, N'C', N'CSE-1101', N'5', N'Programming', 1)
INSERT [dbo].[CourseTB] ([Id], [DepartmentId], [SemesterId], [CourseName], [CourseCode], [Credit], [Description], [Action]) VALUES (2005, 2, 1, N'CF', N'CSE-1102', N'5', N'CF', 1)
INSERT [dbo].[CourseTB] ([Id], [DepartmentId], [SemesterId], [CourseName], [CourseCode], [Credit], [Description], [Action]) VALUES (2006, 2, 1, N'Physis-1', N'CSE-1103', N'5', N'P', 1)
INSERT [dbo].[CourseTB] ([Id], [DepartmentId], [SemesterId], [CourseName], [CourseCode], [Credit], [Description], [Action]) VALUES (2007, 2, 1, N'Bangla', N'CSE-1111', N'3', N'Bangla ', 1)
INSERT [dbo].[CourseTB] ([Id], [DepartmentId], [SemesterId], [CourseName], [CourseCode], [Credit], [Description], [Action]) VALUES (2008, 2, 8, N'English', N'CSE-4101', N'2', N'A', 1)
INSERT [dbo].[CourseTB] ([Id], [DepartmentId], [SemesterId], [CourseName], [CourseCode], [Credit], [Description], [Action]) VALUES (3008, 1005, 1, N'Electical', N'EEE-1011', N'3', N'Masur', 1)
INSERT [dbo].[CourseTB] ([Id], [DepartmentId], [SemesterId], [CourseName], [CourseCode], [Credit], [Description], [Action]) VALUES (3009, 2, 5, N'DBMS', N'CSE-3101', N'5', N'DBMS', 1)
INSERT [dbo].[CourseTB] ([Id], [DepartmentId], [SemesterId], [CourseName], [CourseCode], [Credit], [Description], [Action]) VALUES (3010, 2, 5, N'OS', N'CSE-3102', N'5', N'OS', 1)
INSERT [dbo].[CourseTB] ([Id], [DepartmentId], [SemesterId], [CourseName], [CourseCode], [Credit], [Description], [Action]) VALUES (3011, 2, 5, N'SAD', N'CSE-3103', N'5', N'SAD', 1)
SET IDENTITY_INSERT [dbo].[CourseTB] OFF
SET IDENTITY_INSERT [dbo].[DayTB] ON 

INSERT [dbo].[DayTB] ([Id], [DayName]) VALUES (1, N'Saturday')
INSERT [dbo].[DayTB] ([Id], [DayName]) VALUES (2, N'Sunday')
INSERT [dbo].[DayTB] ([Id], [DayName]) VALUES (3, N'Monday')
INSERT [dbo].[DayTB] ([Id], [DayName]) VALUES (4, N'Tuesday')
INSERT [dbo].[DayTB] ([Id], [DayName]) VALUES (5, N'Wednesday')
INSERT [dbo].[DayTB] ([Id], [DayName]) VALUES (6, N'Thursday')
INSERT [dbo].[DayTB] ([Id], [DayName]) VALUES (7, N'Frideay')
SET IDENTITY_INSERT [dbo].[DayTB] OFF
SET IDENTITY_INSERT [dbo].[DepartmentTB] ON 

INSERT [dbo].[DepartmentTB] ([Id], [DepartmentCode], [DepartmentName]) VALUES (2, N'CSE', N'Compute Science & Engineering')
INSERT [dbo].[DepartmentTB] ([Id], [DepartmentCode], [DepartmentName]) VALUES (1005, N'EEE', N'Electronics and Electrical Engineering')
SET IDENTITY_INSERT [dbo].[DepartmentTB] OFF
SET IDENTITY_INSERT [dbo].[DesignationTB] ON 

INSERT [dbo].[DesignationTB] ([Id], [DesignationName]) VALUES (1, N'Professor')
INSERT [dbo].[DesignationTB] ([Id], [DesignationName]) VALUES (2, N'Associate Professor')
INSERT [dbo].[DesignationTB] ([Id], [DesignationName]) VALUES (3, N'Senior Lecturer')
INSERT [dbo].[DesignationTB] ([Id], [DesignationName]) VALUES (4, N'Lecturer')
SET IDENTITY_INSERT [dbo].[DesignationTB] OFF
SET IDENTITY_INSERT [dbo].[EnrollCourseTB] ON 

INSERT [dbo].[EnrollCourseTB] ([Id], [StudentId], [CourseId], [Date]) VALUES (1016, 2, 1002, CAST(0x7E3F0B00 AS Date))
INSERT [dbo].[EnrollCourseTB] ([Id], [StudentId], [CourseId], [Date]) VALUES (1017, 3, 2004, CAST(0x7E3F0B00 AS Date))
INSERT [dbo].[EnrollCourseTB] ([Id], [StudentId], [CourseId], [Date]) VALUES (1018, 2, 2006, CAST(0x7E3F0B00 AS Date))
INSERT [dbo].[EnrollCourseTB] ([Id], [StudentId], [CourseId], [Date]) VALUES (1019, 3, 2007, CAST(0x803F0B00 AS Date))
INSERT [dbo].[EnrollCourseTB] ([Id], [StudentId], [CourseId], [Date]) VALUES (1020, 6, 2006, CAST(0x7F3F0B00 AS Date))
INSERT [dbo].[EnrollCourseTB] ([Id], [StudentId], [CourseId], [Date]) VALUES (1021, 2003, 3008, CAST(0x803F0B00 AS Date))
INSERT [dbo].[EnrollCourseTB] ([Id], [StudentId], [CourseId], [Date]) VALUES (1022, 2, 1, CAST(0xA13F0B00 AS Date))
SET IDENTITY_INSERT [dbo].[EnrollCourseTB] OFF
SET IDENTITY_INSERT [dbo].[GradeLetterTB] ON 

INSERT [dbo].[GradeLetterTB] ([Id], [GradeLetterMarkes], [GradePoint]) VALUES (1, N'A+', N'4.00')
INSERT [dbo].[GradeLetterTB] ([Id], [GradeLetterMarkes], [GradePoint]) VALUES (2, N'A', N'3.70')
INSERT [dbo].[GradeLetterTB] ([Id], [GradeLetterMarkes], [GradePoint]) VALUES (3, N'A-', N'3.30')
INSERT [dbo].[GradeLetterTB] ([Id], [GradeLetterMarkes], [GradePoint]) VALUES (4, N'B+', N'3.00')
INSERT [dbo].[GradeLetterTB] ([Id], [GradeLetterMarkes], [GradePoint]) VALUES (5, N'B', N'2.70')
INSERT [dbo].[GradeLetterTB] ([Id], [GradeLetterMarkes], [GradePoint]) VALUES (7, N'C+', N'2.30')
INSERT [dbo].[GradeLetterTB] ([Id], [GradeLetterMarkes], [GradePoint]) VALUES (8, N'C', N'2.00')
INSERT [dbo].[GradeLetterTB] ([Id], [GradeLetterMarkes], [GradePoint]) VALUES (10, N'D+', N'1.30')
INSERT [dbo].[GradeLetterTB] ([Id], [GradeLetterMarkes], [GradePoint]) VALUES (11, N'D', N'1.00')
INSERT [dbo].[GradeLetterTB] ([Id], [GradeLetterMarkes], [GradePoint]) VALUES (13, N'F', N'0.00')
SET IDENTITY_INSERT [dbo].[GradeLetterTB] OFF
SET IDENTITY_INSERT [dbo].[RoomNoTB] ON 

INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (1, N'A-101')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (2, N'A-102')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (3, N'A-103')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (4, N'B-101')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (5, N'B-102')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (6, N'B-103')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (7, N'A-201')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (8, N'A-202')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (9, N'A-203')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (10, N'B-201')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (11, N'B-202')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (12, N'B-203')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (13, N'C-101')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (14, N'C-102')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (15, N'C-103')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (16, N'C-201')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (17, N'C-202')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (18, N'C-203')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (19, N'L-301')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (20, N'L-302')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (21, N'L-303')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (22, N'L-304')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (23, N'L-305')
INSERT [dbo].[RoomNoTB] ([Id], [RoomNo]) VALUES (24, N'H-501')
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
SET IDENTITY_INSERT [dbo].[StudentResultTB] ON 

INSERT [dbo].[StudentResultTB] ([Id], [StudentId], [CourseId], [GradeLetterId]) VALUES (10, 2, 1002, 2)
INSERT [dbo].[StudentResultTB] ([Id], [StudentId], [CourseId], [GradeLetterId]) VALUES (11, 3, 2007, 4)
INSERT [dbo].[StudentResultTB] ([Id], [StudentId], [CourseId], [GradeLetterId]) VALUES (12, 6, 2006, 4)
SET IDENTITY_INSERT [dbo].[StudentResultTB] OFF
SET IDENTITY_INSERT [dbo].[StudentTB] ON 

INSERT [dbo].[StudentTB] ([Id], [DepartmentId], [StudentName], [Email], [ContactNo], [RegisterDate], [Address], [RegistrationNo]) VALUES (2, 2, N'Towhidul Islam', N'towhidulislamcse@gmail.com', N'01521401825', CAST(0x8E3F0B00 AS Date), N'Kharnafully', N'CSE-2019-001')
INSERT [dbo].[StudentTB] ([Id], [DepartmentId], [StudentName], [Email], [ContactNo], [RegisterDate], [Address], [RegistrationNo]) VALUES (3, 2, N'Ag Suman', N'suman@gmail.com', N'01521401825', CAST(0x8E3F0B00 AS Date), N'Ramu', N'CSE-2019-002')
INSERT [dbo].[StudentTB] ([Id], [DepartmentId], [StudentName], [Email], [ContactNo], [RegisterDate], [Address], [RegistrationNo]) VALUES (5, 2, N'Tayef', N'Tayef@gmail.com', N'01821212121', CAST(0x8E3F0B00 AS Date), N'Nowkhali', N'CSE-2019-004')
INSERT [dbo].[StudentTB] ([Id], [DepartmentId], [StudentName], [Email], [ContactNo], [RegisterDate], [Address], [RegistrationNo]) VALUES (6, 2, N'Mamun', N'mamun@mamun.com', N'01821212121', CAST(0x213E0B00 AS Date), N'borishal', N'CSE-2018-005')
INSERT [dbo].[StudentTB] ([Id], [DepartmentId], [StudentName], [Email], [ContactNo], [RegisterDate], [Address], [RegistrationNo]) VALUES (1002, 2, N'Mohammed Ismail', N'mohammedismail@bgc.com', N'01861053922', CAST(0x903F0B00 AS Date), N'Shantirhat,Patiya', N'CSE-2019-005')
INSERT [dbo].[StudentTB] ([Id], [DepartmentId], [StudentName], [Email], [ContactNo], [RegisterDate], [Address], [RegistrationNo]) VALUES (1003, 2, N'Fahad Alom', N'fahad@bgc.com', N'01234018252', CAST(0x8F3F0B00 AS Date), N'Comilla', N'CSE-2019-006')
INSERT [dbo].[StudentTB] ([Id], [DepartmentId], [StudentName], [Email], [ContactNo], [RegisterDate], [Address], [RegistrationNo]) VALUES (2002, 2, N'Towhidul Islam', N'towhidulislamts@gmail.com', N'01521401825', CAST(0x5E3C0B00 AS Date), N'Chittagong', N'CSE-2017-007')
INSERT [dbo].[StudentTB] ([Id], [DepartmentId], [StudentName], [Email], [ContactNo], [RegisterDate], [Address], [RegistrationNo]) VALUES (2003, 1005, N'Asif Khan', N'asif@khan.com', N'01814004000', CAST(0x7E3F0B00 AS Date), N'Uganda', N'EEE-2019-001')
SET IDENTITY_INSERT [dbo].[StudentTB] OFF
SET IDENTITY_INSERT [dbo].[TeacherTB] ON 

INSERT [dbo].[TeacherTB] ([Id], [DesignationId], [DepartmentId], [TeacherName], [Address], [Email], [ContactNo], [CreditToBeTaken], [ReminingCredit]) VALUES (1, 4, 2, N'Mr Suvasis', N'chittagong', N'Suvasis@gmail.com', N'01821212121', 30, 30)
INSERT [dbo].[TeacherTB] ([Id], [DesignationId], [DepartmentId], [TeacherName], [Address], [Email], [ContactNo], [CreditToBeTaken], [ReminingCredit]) VALUES (2, 4, 2, N'Mr Abdul Wahab', N'Chittagong, patiya', N'MrAbdulWahab@gmail.com', N'01522121211', 20, 20)
INSERT [dbo].[TeacherTB] ([Id], [DesignationId], [DepartmentId], [TeacherName], [Address], [Email], [ContactNo], [CreditToBeTaken], [ReminingCredit]) VALUES (3, 3, 2, N'Sukkor', N'Dhaka', N'sukkor@gmail.com', N'01521212121', 10, 0)
INSERT [dbo].[TeacherTB] ([Id], [DesignationId], [DepartmentId], [TeacherName], [Address], [Email], [ContactNo], [CreditToBeTaken], [ReminingCredit]) VALUES (4, 3, 1005, N'Monjur', N'Uganda', N'monjur@uganda.com', N'01814004000', 30, 27)
SET IDENTITY_INSERT [dbo].[TeacherTB] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UniqKey_CourseCode]    Script Date: 5/29/2019 5:53:03 PM ******/
ALTER TABLE [dbo].[CourseTB] ADD  CONSTRAINT [UniqKey_CourseCode] UNIQUE NONCLUSTERED 
(
	[CourseCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UniqKey_CourseName]    Script Date: 5/29/2019 5:53:03 PM ******/
ALTER TABLE [dbo].[CourseTB] ADD  CONSTRAINT [UniqKey_CourseName] UNIQUE NONCLUSTERED 
(
	[CourseName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ_Code_d]    Script Date: 5/29/2019 5:53:03 PM ******/
ALTER TABLE [dbo].[DepartmentTB] ADD  CONSTRAINT [UQ_Code_d] UNIQUE NONCLUSTERED 
(
	[DepartmentCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ_Name_D]    Script Date: 5/29/2019 5:53:03 PM ******/
ALTER TABLE [dbo].[DepartmentTB] ADD  CONSTRAINT [UQ_Name_D] UNIQUE NONCLUSTERED 
(
	[DepartmentName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Unique_Email]    Script Date: 5/29/2019 5:53:03 PM ******/
ALTER TABLE [dbo].[StudentTB] ADD  CONSTRAINT [Unique_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UniqueKey_Email]    Script Date: 5/29/2019 5:53:03 PM ******/
ALTER TABLE [dbo].[TeacherTB] ADD  CONSTRAINT [UniqueKey_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ClassAllocateTB] ADD  CONSTRAINT [DF_ClassAllocateTB_Action]  DEFAULT ((1)) FOR [Action]
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
ALTER DATABASE [UniversityMS] SET  READ_WRITE 
GO
