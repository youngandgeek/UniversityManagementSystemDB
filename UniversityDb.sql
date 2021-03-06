USE [master]
GO
/****** Object:  Database [UniversityDb]    Script Date: 06/12/2021 08:59:22 PM ******/
CREATE DATABASE [UniversityDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UniversityDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\UniversityDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UniversityDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\UniversityDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [UniversityDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UniversityDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UniversityDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UniversityDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UniversityDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UniversityDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UniversityDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [UniversityDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UniversityDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UniversityDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UniversityDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UniversityDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UniversityDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UniversityDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UniversityDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UniversityDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UniversityDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UniversityDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UniversityDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UniversityDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UniversityDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UniversityDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UniversityDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UniversityDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UniversityDb] SET  MULTI_USER 
GO
ALTER DATABASE [UniversityDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UniversityDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UniversityDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UniversityDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UniversityDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UniversityDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [UniversityDb] SET QUERY_STORE = OFF
GO
USE [UniversityDb]
GO
/****** Object:  Table [dbo].[College_tbl]    Script Date: 06/12/2021 08:59:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[College_tbl](
	[CoNum] [int] IDENTITY(1,1) NOT NULL,
	[CoName] [varchar](50) NOT NULL,
	[CoCity] [varchar](50) NOT NULL,
	[CojDate] [date] NOT NULL,
	[CPrincipal] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CoNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course_tbl]    Script Date: 06/12/2021 08:59:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course_tbl](
	[CNum] [int] IDENTITY(1,1) NOT NULL,
	[CName] [varchar](50) NOT NULL,
	[CDuration] [int] NOT NULL,
	[CDepId] [int] NOT NULL,
	[CDepName] [varchar](50) NOT NULL,
	[CProfId] [int] NOT NULL,
	[CPrName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department_tbl]    Script Date: 06/12/2021 08:59:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department_tbl](
	[DepNum] [int] IDENTITY(500,1) NOT NULL,
	[DepName] [varchar](50) NOT NULL,
	[DepIntake] [int] NOT NULL,
	[DepFees] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DepNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fees_tbl]    Script Date: 06/12/2021 08:59:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fees_tbl](
	[FNum] [int] IDENTITY(1,1) NOT NULL,
	[StuNum] [int] NOT NULL,
	[StuName] [varchar](50) NOT NULL,
	[StuDep] [varchar](50) NOT NULL,
	[FPeriod] [varchar](50) NOT NULL,
	[FAmount] [int] NOT NULL,
	[PayDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Professor_tbl]    Script Date: 06/12/2021 08:59:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Professor_tbl](
	[PrNum] [int] IDENTITY(1,1) NOT NULL,
	[PrName] [varchar](50) NOT NULL,
	[PrDob] [date] NOT NULL,
	[PrGen] [varchar](10) NOT NULL,
	[PrAdd] [varchar](100) NOT NULL,
	[PrQual] [varchar](50) NOT NULL,
	[PrExp] [int] NOT NULL,
	[PrDepId] [int] NOT NULL,
	[PrDepName] [varchar](50) NOT NULL,
	[PrSalary] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PrNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salary_tbl]    Script Date: 06/12/2021 08:59:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salary_tbl](
	[SNum] [int] IDENTITY(1,1) NOT NULL,
	[PrNum] [int] NOT NULL,
	[PrName] [varchar](50) NOT NULL,
	[PrSalary] [int] NOT NULL,
	[SPeriod] [varchar](50) NOT NULL,
	[SPDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_tbl]    Script Date: 06/12/2021 08:59:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_tbl](
	[StuNum] [int] IDENTITY(1,1) NOT NULL,
	[StuName] [varchar](50) NOT NULL,
	[StuDob] [date] NOT NULL,
	[StuGen] [varchar](10) NOT NULL,
	[StuAddress] [varchar](100) NOT NULL,
	[StuDepId] [int] NOT NULL,
	[StuDepName] [varchar](50) NOT NULL,
	[StuPhone] [varchar](15) NOT NULL,
	[StSem] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StuNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Course_tbl] ON 

INSERT [dbo].[Course_tbl] ([CNum], [CName], [CDuration], [CDepId], [CDepName], [CProfId], [CPrName]) VALUES (1002, N'WLAN', 6, 501, N'Network', 3, N'Haitham essam')
INSERT [dbo].[Course_tbl] ([CNum], [CName], [CDuration], [CDepId], [CDepName], [CProfId], [CPrName]) VALUES (1003, N'Embedded System', 11, 503, N'Robotics', 2, N'hady')
INSERT [dbo].[Course_tbl] ([CNum], [CName], [CDuration], [CDepId], [CDepName], [CProfId], [CPrName]) VALUES (1005, N'LAN', 10, 501, N'Network', 2, N'hady')
SET IDENTITY_INSERT [dbo].[Course_tbl] OFF
GO
SET IDENTITY_INSERT [dbo].[Department_tbl] ON 

INSERT [dbo].[Department_tbl] ([DepNum], [DepName], [DepIntake], [DepFees]) VALUES (500, N'CS', 1, 30000)
INSERT [dbo].[Department_tbl] ([DepNum], [DepName], [DepIntake], [DepFees]) VALUES (501, N'Network', 10, 35000)
INSERT [dbo].[Department_tbl] ([DepNum], [DepName], [DepIntake], [DepFees]) VALUES (502, N'IS', 12, 25000)
INSERT [dbo].[Department_tbl] ([DepNum], [DepName], [DepIntake], [DepFees]) VALUES (503, N'Robotics', 4, 40000)
SET IDENTITY_INSERT [dbo].[Department_tbl] OFF
GO
SET IDENTITY_INSERT [dbo].[Fees_tbl] ON 

INSERT [dbo].[Fees_tbl] ([FNum], [StuNum], [StuName], [StuDep], [FPeriod], [FAmount], [PayDate]) VALUES (1, 7, N'eman essam', N'Network', N'3', 3000, CAST(N'2021-12-05' AS Date))
INSERT [dbo].[Fees_tbl] ([FNum], [StuNum], [StuName], [StuDep], [FPeriod], [FAmount], [PayDate]) VALUES (2, 9, N'ahmed hesham', N'IS', N'3', 50000, CAST(N'2021-12-05' AS Date))
SET IDENTITY_INSERT [dbo].[Fees_tbl] OFF
GO
SET IDENTITY_INSERT [dbo].[Professor_tbl] ON 

INSERT [dbo].[Professor_tbl] ([PrNum], [PrName], [PrDob], [PrGen], [PrAdd], [PrQual], [PrExp], [PrDepId], [PrDepName], [PrSalary]) VALUES (1, N'roo', CAST(N'2021-12-01' AS Date), N'Female', N'Cairo', N'Master', 3, 501, N'Network', 20005)
INSERT [dbo].[Professor_tbl] ([PrNum], [PrName], [PrDob], [PrGen], [PrAdd], [PrQual], [PrExp], [PrDepId], [PrDepName], [PrSalary]) VALUES (2, N'hady', CAST(N'2021-06-09' AS Date), N'Male', N'ocotber', N'Doctoral', 2, 502, N'IS', 8200)
INSERT [dbo].[Professor_tbl] ([PrNum], [PrName], [PrDob], [PrGen], [PrAdd], [PrQual], [PrExp], [PrDepId], [PrDepName], [PrSalary]) VALUES (3, N'Haitham essam', CAST(N'2021-12-01' AS Date), N'Male', N'october', N'Master', 4, 501, N'Network', 20000)
SET IDENTITY_INSERT [dbo].[Professor_tbl] OFF
GO
SET IDENTITY_INSERT [dbo].[Salary_tbl] ON 

INSERT [dbo].[Salary_tbl] ([SNum], [PrNum], [PrName], [PrSalary], [SPeriod], [SPDate]) VALUES (1, 2, N'hady', 8200, N'12/2021', CAST(N'2021-12-05' AS Date))
INSERT [dbo].[Salary_tbl] ([SNum], [PrNum], [PrName], [PrSalary], [SPeriod], [SPDate]) VALUES (2, 3, N'Haitham essam', 20000, N'10/2018', CAST(N'2021-12-05' AS Date))
SET IDENTITY_INSERT [dbo].[Salary_tbl] OFF
GO
SET IDENTITY_INSERT [dbo].[Student_tbl] ON 

INSERT [dbo].[Student_tbl] ([StuNum], [StuName], [StuDob], [StuGen], [StuAddress], [StuDepId], [StuDepName], [StuPhone], [StSem]) VALUES (7, N'eman essam', CAST(N'1996-10-14' AS Date), N'Female', N'lebanon sq', 501, N'Network', N'01064256323', 3)
INSERT [dbo].[Student_tbl] ([StuNum], [StuName], [StuDob], [StuGen], [StuAddress], [StuDepId], [StuDepName], [StuPhone], [StSem]) VALUES (9, N'ahmed hesham', CAST(N'1994-06-15' AS Date), N'Male', N'october', 502, N'IS', N'015235669', 3)
INSERT [dbo].[Student_tbl] ([StuNum], [StuName], [StuDob], [StuGen], [StuAddress], [StuDepId], [StuDepName], [StuPhone], [StSem]) VALUES (10, N'ibrahim mohamed', CAST(N'1999-11-26' AS Date), N'Male', N'mohandessin', 501, N'Network', N'0152665699', 4)
SET IDENTITY_INSERT [dbo].[Student_tbl] OFF
GO
ALTER TABLE [dbo].[Course_tbl]  WITH CHECK ADD  CONSTRAINT [FK3] FOREIGN KEY([CDepId])
REFERENCES [dbo].[Department_tbl] ([DepNum])
GO
ALTER TABLE [dbo].[Course_tbl] CHECK CONSTRAINT [FK3]
GO
ALTER TABLE [dbo].[Course_tbl]  WITH CHECK ADD  CONSTRAINT [FK4] FOREIGN KEY([CProfId])
REFERENCES [dbo].[Professor_tbl] ([PrNum])
GO
ALTER TABLE [dbo].[Course_tbl] CHECK CONSTRAINT [FK4]
GO
ALTER TABLE [dbo].[Fees_tbl]  WITH CHECK ADD  CONSTRAINT [FK6] FOREIGN KEY([StuNum])
REFERENCES [dbo].[Student_tbl] ([StuNum])
GO
ALTER TABLE [dbo].[Fees_tbl] CHECK CONSTRAINT [FK6]
GO
ALTER TABLE [dbo].[Professor_tbl]  WITH CHECK ADD  CONSTRAINT [FK2] FOREIGN KEY([PrDepId])
REFERENCES [dbo].[Department_tbl] ([DepNum])
GO
ALTER TABLE [dbo].[Professor_tbl] CHECK CONSTRAINT [FK2]
GO
ALTER TABLE [dbo].[Salary_tbl]  WITH CHECK ADD  CONSTRAINT [FK7] FOREIGN KEY([PrNum])
REFERENCES [dbo].[Professor_tbl] ([PrNum])
GO
ALTER TABLE [dbo].[Salary_tbl] CHECK CONSTRAINT [FK7]
GO
ALTER TABLE [dbo].[Student_tbl]  WITH CHECK ADD  CONSTRAINT [FK1] FOREIGN KEY([StuDepId])
REFERENCES [dbo].[Department_tbl] ([DepNum])
GO
ALTER TABLE [dbo].[Student_tbl] CHECK CONSTRAINT [FK1]
GO
USE [master]
GO
ALTER DATABASE [UniversityDb] SET  READ_WRITE 
GO
