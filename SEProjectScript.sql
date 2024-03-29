USE [master]
GO
/****** Object:  Database [SEProject]    Script Date: 12/20/2019 4:47:09 PM ******/
CREATE DATABASE [SEProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SEProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SEProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SEProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SEProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SEProject] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SEProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SEProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SEProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SEProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SEProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SEProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [SEProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SEProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SEProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SEProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SEProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SEProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SEProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SEProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SEProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SEProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SEProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SEProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SEProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SEProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SEProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SEProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SEProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SEProject] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SEProject] SET  MULTI_USER 
GO
ALTER DATABASE [SEProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SEProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SEProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SEProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SEProject] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SEProject] SET QUERY_STORE = OFF
GO
USE [SEProject]
GO
/****** Object:  Table [dbo].[AddProject]    Script Date: 12/20/2019 4:47:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AddProject](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [nchar](20) NOT NULL,
	[ProjectDiscription] [nchar](700) NOT NULL,
 CONSTRAINT [PK_AddProject] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Advisor]    Script Date: 12/20/2019 4:47:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Advisor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nchar](20) NOT NULL,
	[LastName] [nchar](20) NOT NULL,
	[Rank] [nchar](20) NOT NULL,
	[Email] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Advisor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssginedProjects]    Script Date: 12/20/2019 4:47:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssginedProjects](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nchar](50) NOT NULL,
	[AdvisorName] [nchar](50) NOT NULL,
	[ProjectName] [nchar](50) NOT NULL,
 CONSTRAINT [PK_AssginedProjects] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupFromation]    Script Date: 12/20/2019 4:47:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupFromation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nchar](20) NOT NULL,
	[GroupMembers] [nchar](100) NOT NULL,
 CONSTRAINT [PK_GroupFromation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 12/20/2019 4:47:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nchar](20) NOT NULL,
	[LastName] [nchar](20) NOT NULL,
	[RegNo] [nchar](20) NOT NULL,
	[Email] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Evaluation]    Script Date: 12/20/2019 4:47:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Evaluation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nchar](50) NOT NULL,
	[ObtainedMarks] [nchar](50) NOT NULL,
	[TotalMarks] [nchar](50) NOT NULL,
	[Date] [nchar](100) NOT NULL,
 CONSTRAINT [PK_tb_Evaluation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AddProject] ON 

INSERT [dbo].[AddProject] ([ID], [ProjectName], [ProjectDiscription]) VALUES (1, N'File Compression    ', N'This Project will help the user to compress the files and submit it on the google class room                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ')
INSERT [dbo].[AddProject] ([ID], [ProjectName], [ProjectDiscription]) VALUES (2, N'Book System         ', N'This Project will help the user                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ')
SET IDENTITY_INSERT [dbo].[AddProject] OFF
SET IDENTITY_INSERT [dbo].[Advisor] ON 

INSERT [dbo].[Advisor] ([ID], [FirstName], [LastName], [Rank], [Email]) VALUES (1, N'Junaid              ', N'Zafar               ', N'Graduate Assistant  ', N'junaidzafar@gmail.com                             ')
INSERT [dbo].[Advisor] ([ID], [FirstName], [LastName], [Rank], [Email]) VALUES (2, N' Amjad              ', N'Farooq              ', N'Professor           ', N'amjadfarooq@gmail.com                             ')
SET IDENTITY_INSERT [dbo].[Advisor] OFF
SET IDENTITY_INSERT [dbo].[AssginedProjects] ON 

INSERT [dbo].[AssginedProjects] ([ID], [GroupName], [AdvisorName], [ProjectName]) VALUES (1, N' Group1                                           ', N' Junaid                                           ', N' File Compression                                 ')
INSERT [dbo].[AssginedProjects] ([ID], [GroupName], [AdvisorName], [ProjectName]) VALUES (2, N' Group2                                           ', N' Junaid                                           ', N' Book System                                      ')
SET IDENTITY_INSERT [dbo].[AssginedProjects] OFF
SET IDENTITY_INSERT [dbo].[GroupFromation] ON 

INSERT [dbo].[GroupFromation] ([ID], [GroupName], [GroupMembers]) VALUES (1, N'Group1              ', N' Amir                 Abdul                                                                         ')
INSERT [dbo].[GroupFromation] ([ID], [GroupName], [GroupMembers]) VALUES (2, N'Group2              ', N' Ibrar                 zeeshan                                                                      ')
SET IDENTITY_INSERT [dbo].[GroupFromation] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([ID], [FirstName], [LastName], [RegNo], [Email]) VALUES (1, N'Abdul               ', N'Wahab               ', N'2017-CS-227         ', N'awanabdulwahab7@gmail.com                         ')
INSERT [dbo].[Student] ([ID], [FirstName], [LastName], [RegNo], [Email]) VALUES (2, N'Amir                ', N'Javed               ', N'2017-CS-208         ', N' amirjaved@gmail.com                              ')
INSERT [dbo].[Student] ([ID], [FirstName], [LastName], [RegNo], [Email]) VALUES (3, N'Ibrar               ', N'Rasheed             ', N'2017-CS-204         ', N'ibrarjutt6263@gmail.com                           ')
INSERT [dbo].[Student] ([ID], [FirstName], [LastName], [RegNo], [Email]) VALUES (4, N' zeeshan            ', N'Mehboob             ', N'2017-CS-223         ', N'zeeshan@gmail.com                                 ')
SET IDENTITY_INSERT [dbo].[Student] OFF
SET IDENTITY_INSERT [dbo].[tb_Evaluation] ON 

INSERT [dbo].[tb_Evaluation] ([ID], [GroupName], [ObtainedMarks], [TotalMarks], [Date]) VALUES (1, N'Group2                                            ', N'50                                                ', N'100                                               ', N'Dec 10 2019 12:00AM                                                                                 ')
INSERT [dbo].[tb_Evaluation] ([ID], [GroupName], [ObtainedMarks], [TotalMarks], [Date]) VALUES (2, N'Group1                                            ', N'70                                                ', N'100                                               ', N'Dec 12 2019 12:00AM                                                                                 ')
SET IDENTITY_INSERT [dbo].[tb_Evaluation] OFF
USE [master]
GO
ALTER DATABASE [SEProject] SET  READ_WRITE 
GO
