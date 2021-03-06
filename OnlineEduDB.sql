USE [master]
GO
/****** Object:  Database [OnlineEducation]    Script Date: 7/24/2021 5:57:33 PM ******/
CREATE DATABASE [OnlineEducation]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineEducation', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\OnlineEducation.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'OnlineEducation_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\OnlineEducation_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [OnlineEducation] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineEducation].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineEducation] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineEducation] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineEducation] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineEducation] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineEducation] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineEducation] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineEducation] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineEducation] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineEducation] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineEducation] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineEducation] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineEducation] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineEducation] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineEducation] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineEducation] SET  ENABLE_BROKER 
GO
ALTER DATABASE [OnlineEducation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineEducation] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineEducation] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineEducation] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineEducation] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineEducation] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineEducation] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineEducation] SET RECOVERY FULL 
GO
ALTER DATABASE [OnlineEducation] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineEducation] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineEducation] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineEducation] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineEducation] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [OnlineEducation] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'OnlineEducation', N'ON'
GO
USE [OnlineEducation]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/24/2021 5:57:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](255) NULL,
 CONSTRAINT [PK__Category__19093A2BAF0417B2] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Chapter]    Script Date: 7/24/2021 5:57:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Chapter](
	[ChapterID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[Course_ID] [varchar](255) NOT NULL,
 CONSTRAINT [PK__Chapter__0893A34A1F31FCE0] PRIMARY KEY CLUSTERED 
(
	[ChapterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Course]    Script Date: 7/24/2021 5:57:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Course](
	[CourseID] [varchar](255) NOT NULL,
	[CourseName] [nvarchar](255) NOT NULL,
	[CategoryCourse] [int] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[Teacher_ID] [int] NULL,
	[Active_ID] [varchar](255) NULL,
	[Price] [nvarchar](100) NULL,
	[Image_url] [nvarchar](100) NULL,
 CONSTRAINT [PK__Course__C92D7187ADF2490B] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Description]    Script Date: 7/24/2021 5:57:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Description](
	[DescID] [int] IDENTITY(1,1) NOT NULL,
	[DescriptonTitle] [varchar](255) NULL,
	[Description] [ntext] NULL,
	[Course_ID] [varchar](255) NOT NULL,
 CONSTRAINT [PK__Descript__EB54354949CF0B54] PRIMARY KEY CLUSTERED 
(
	[DescID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MyCourse]    Script Date: 7/24/2021 5:57:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MyCourse](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [int] NOT NULL,
	[Course_ID] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/24/2021 5:57:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [int] NOT NULL,
	[Course_ID] [varchar](255) NOT NULL,
	[toEmail] [varchar](255) NOT NULL,
	[toPhone] [varchar](255) NOT NULL,
	[Status] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 7/24/2021 5:57:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rating](
	[RatingID] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [int] NULL,
	[Course_ID] [varchar](255) NULL,
	[Score] [int] NULL,
 CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED 
(
	[RatingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/24/2021 5:57:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 7/24/2021 5:57:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teacher](
	[TeacherID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NULL,
	[Age] [varchar](255) NULL,
	[Url_Image] [varchar](255) NULL,
	[Description] [ntext] NULL,
 CONSTRAINT [PK__Teacher__EDF2594470E63594] PRIMARY KEY CLUSTERED 
(
	[TeacherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/24/2021 5:57:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](255) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[FullName] [nvarchar](255) NULL,
	[Email] [varchar](255) NULL,
	[PhoneNumber] [varchar](255) NULL,
	[Role_ID] [int] NOT NULL,
	[Image_url] [varchar](255) NULL,
 CONSTRAINT [PK__User__1788CCACA190895C] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Video]    Script Date: 7/24/2021 5:57:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Video](
	[VideoID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Video_url] [varchar](255) NULL,
	[Chapter_ID] [int] NOT NULL,
 CONSTRAINT [PK__Video__BAE5124AACB304F4] PRIMARY KEY CLUSTERED 
(
	[VideoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (1, N'Lập Trình ')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2, N'Ngoại Ngữ')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (3, N'Nhiếp ảnh, Dựng Phim')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (4, N'Kỹ năng mềm')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (5, N'Nấu ăn')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (6, N'Kinh doanh')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Chapter] ON 

INSERT [dbo].[Chapter] ([ChapterID], [Name], [Title], [Course_ID]) VALUES (2, N'Chương 1', N'Giới thiệu về ngôn ngữ lập trình C', N'LTC01')
INSERT [dbo].[Chapter] ([ChapterID], [Name], [Title], [Course_ID]) VALUES (6, N'Chương 2', N'Cấu trúc điều khiển & rẽ nhánh', N'LTC01')
INSERT [dbo].[Chapter] ([ChapterID], [Name], [Title], [Course_ID]) VALUES (8, N'Chương 3', N'Hàm trong C', N'LTC01')
INSERT [dbo].[Chapter] ([ChapterID], [Name], [Title], [Course_ID]) VALUES (9, N'Chương 4', N'Mảng trong C', N'LTC01')
INSERT [dbo].[Chapter] ([ChapterID], [Name], [Title], [Course_ID]) VALUES (10, N'Chương 5', N'Chuỗi trong C', N'LTC01')
INSERT [dbo].[Chapter] ([ChapterID], [Name], [Title], [Course_ID]) VALUES (11, N'Chương 6', N'Con trỏ trong C', N'LTC01')
INSERT [dbo].[Chapter] ([ChapterID], [Name], [Title], [Course_ID]) VALUES (12, N'Chương 1', N'Giới thiệu về C#', N'LTCS')
INSERT [dbo].[Chapter] ([ChapterID], [Name], [Title], [Course_ID]) VALUES (13, N'Chương 2', N'Kiểu dữ liệu,Biến và biểu thức', N'LTCS')
INSERT [dbo].[Chapter] ([ChapterID], [Name], [Title], [Course_ID]) VALUES (14, N'Chương 3', N'Các phép toán trong C#', N'LTCS')
INSERT [dbo].[Chapter] ([ChapterID], [Name], [Title], [Course_ID]) VALUES (15, N'Chương 1', N'Giới thiệu ngôn ngữ lập trình Java', N'LTJ01')
INSERT [dbo].[Chapter] ([ChapterID], [Name], [Title], [Course_ID]) VALUES (16, N'Chương 2', N'Nền tảng ngôn ngữ lập trình Java', N'LTJ01')
INSERT [dbo].[Chapter] ([ChapterID], [Name], [Title], [Course_ID]) VALUES (17, N'Chương 3', N'Xử lý lỗi trong Java', N'LTJ01')
INSERT [dbo].[Chapter] ([ChapterID], [Name], [Title], [Course_ID]) VALUES (18, N'Chương 1', N'Các thư viện quan trọng thường dùng trong Java/Android', N'LTJ02')
INSERT [dbo].[Chapter] ([ChapterID], [Name], [Title], [Course_ID]) VALUES (19, N'Chương 2', N'Xử lý chuỗi trong Java', N'LTJ02')
INSERT [dbo].[Chapter] ([ChapterID], [Name], [Title], [Course_ID]) VALUES (20, N'Chương 3', N'Xử lý mảng trong Java', N'LTJ02')
INSERT [dbo].[Chapter] ([ChapterID], [Name], [Title], [Course_ID]) VALUES (21, N'Chương 1', N'Các khái niệm cơ bản trong lập trình Python', N'LTPT01')
INSERT [dbo].[Chapter] ([ChapterID], [Name], [Title], [Course_ID]) VALUES (22, N'Chương 2', N'Biểu thức trong lập trình Python', N'LTPT01')
INSERT [dbo].[Chapter] ([ChapterID], [Name], [Title], [Course_ID]) VALUES (23, N'Chương 3', N'Đối tượng String trong lập trình Python', N'LTPT01')
INSERT [dbo].[Chapter] ([ChapterID], [Name], [Title], [Course_ID]) VALUES (24, N'Chương 1', N'Đối tượng List, Tuples, Sets và Dictionary', N'LTPT02')
INSERT [dbo].[Chapter] ([ChapterID], [Name], [Title], [Course_ID]) VALUES (25, N'Chương 2', N'Thao tác với hàm tự định nghĩa trong lập trình Python', N'LTPT02')
INSERT [dbo].[Chapter] ([ChapterID], [Name], [Title], [Course_ID]) VALUES (26, N'Chương 3', N'Hướng đối tượng và thao tác với File trong Python', N'LTPT02')
INSERT [dbo].[Chapter] ([ChapterID], [Name], [Title], [Course_ID]) VALUES (27, N'Chương 1', N'Cấu hình Environment về Spring Boot', N'LTWeb')
INSERT [dbo].[Chapter] ([ChapterID], [Name], [Title], [Course_ID]) VALUES (28, N'Chương 2', N'Tạo project hello đầu tiên với Spring Boot', N'LTWeb')
INSERT [dbo].[Chapter] ([ChapterID], [Name], [Title], [Course_ID]) VALUES (29, N'Chương 3', N'Tích hợp Thymeleaf template vào Spring Boot', N'LTWeb')
SET IDENTITY_INSERT [dbo].[Chapter] OFF
INSERT [dbo].[Course] ([CourseID], [CourseName], [CategoryCourse], [CreateDate], [Teacher_ID], [Active_ID], [Price], [Image_url]) VALUES (N'DP01', N'Dựng Phim Chuyên Nghiệp', 3, CAST(N'2021-07-24' AS Date), 6, N'PR9BC-DHFKQ-PY34H', N'700.000', N'kh9.jpg')
INSERT [dbo].[Course] ([CourseID], [CourseName], [CategoryCourse], [CreateDate], [Teacher_ID], [Active_ID], [Price], [Image_url]) VALUES (N'DP02', N'Dựng phim bằng Adobe Premiere', 3, CAST(N'2021-07-24' AS Date), 5, N'GGQQX-RVCFW-G4G8J', N'500.000', N'dp3.jpg')
INSERT [dbo].[Course] ([CourseID], [CourseName], [CategoryCourse], [CreateDate], [Teacher_ID], [Active_ID], [Price], [Image_url]) VALUES (N'KD40', N'Khởi Nghiệp Thời 4.0', 6, CAST(N'2021-07-24' AS Date), 3, N'8TXBJ-PHVF6-KTMDQ', N'800.000', N'kh11.jpg')
INSERT [dbo].[Course] ([CourseID], [CourseName], [CategoryCourse], [CreateDate], [Teacher_ID], [Active_ID], [Price], [Image_url]) VALUES (N'KNM01', N'Kỹ năng thuyết trình ', 4, CAST(N'2021-07-24' AS Date), 2, N'TWJXF-F483X-4YTV7', N'600.000', N'kn5.jpg')
INSERT [dbo].[Course] ([CourseID], [CourseName], [CategoryCourse], [CreateDate], [Teacher_ID], [Active_ID], [Price], [Image_url]) VALUES (N'KNM02', N'Kỹ năng làm việc nhóm', 4, CAST(N'2021-07-23' AS Date), 3, N'XWRGM-YVCD3-BMB3D', N'200.000', N'kn6.jpg')
INSERT [dbo].[Course] ([CourseID], [CourseName], [CategoryCourse], [CreateDate], [Teacher_ID], [Active_ID], [Price], [Image_url]) VALUES (N'KNM03', N'Kỹ năng viết', 4, CAST(N'2021-07-22' AS Date), 6, N'4YFGT-DC34X-K9RD6', N'100.000', N'kn2.jpg')
INSERT [dbo].[Course] ([CourseID], [CourseName], [CategoryCourse], [CreateDate], [Teacher_ID], [Active_ID], [Price], [Image_url]) VALUES (N'KNM04', N'Kỹ năng lắng nghe', 4, CAST(N'2021-07-21' AS Date), 1, N'KKTK7-X3YG7-CYRX3', N'300.000', N'kn3.jpg')
INSERT [dbo].[Course] ([CourseID], [CourseName], [CategoryCourse], [CreateDate], [Teacher_ID], [Active_ID], [Price], [Image_url]) VALUES (N'KNM05', N'Kỹ năng quản lý ', 4, CAST(N'2021-07-20' AS Date), 2, N'CBMFC-4DYFJ-RX7QQ', N'700.000', N'kn1.jpg')
INSERT [dbo].[Course] ([CourseID], [CourseName], [CategoryCourse], [CreateDate], [Teacher_ID], [Active_ID], [Price], [Image_url]) VALUES (N'KNM06', N'Kỹ năng làm chủ cảm xúc', 4, CAST(N'2021-07-15' AS Date), 3, N'9K22F-93DFV-G6MDQ', N'900.000', N'kn4.jpg')
INSERT [dbo].[Course] ([CourseID], [CourseName], [CategoryCourse], [CreateDate], [Teacher_ID], [Active_ID], [Price], [Image_url]) VALUES (N'LTC01', N'Lập trình C/C++', 1, CAST(N'2021-07-09' AS Date), 1, N'GBW6Y-CBDHP-R2KDV', N'200.000', N'kh1.jpg')
INSERT [dbo].[Course] ([CourseID], [CourseName], [CategoryCourse], [CreateDate], [Teacher_ID], [Active_ID], [Price], [Image_url]) VALUES (N'LTCS', N'Lập trình C#', 1, CAST(N'2021-07-02' AS Date), 3, N'2T496-BG7GC-G3RJD', N'500.000', N'kh2.jpg')
INSERT [dbo].[Course] ([CourseID], [CourseName], [CategoryCourse], [CreateDate], [Teacher_ID], [Active_ID], [Price], [Image_url]) VALUES (N'LTCS01', N'Lập trình web với C#', 1, CAST(N'2021-07-07' AS Date), 6, N'JNKRX-38XTQ-47MWF', N'299.000', N'kh3.jpg')
INSERT [dbo].[Course] ([CourseID], [CourseName], [CategoryCourse], [CreateDate], [Teacher_ID], [Active_ID], [Price], [Image_url]) VALUES (N'LTJ01', N'Lập trình Java', 1, CAST(N'2021-07-02' AS Date), 5, N'YYNVD-VYKRP-37RFW', N'500.000', N'kh4.jpg')
INSERT [dbo].[Course] ([CourseID], [CourseName], [CategoryCourse], [CreateDate], [Teacher_ID], [Active_ID], [Price], [Image_url]) VALUES (N'LTJ02', N'Lập trình web với Java', 1, CAST(N'2021-07-02' AS Date), 2, N'2TYNC-DRPHV-BMBVY', N'500.000', N'kh5.jpg')
INSERT [dbo].[Course] ([CourseID], [CourseName], [CategoryCourse], [CreateDate], [Teacher_ID], [Active_ID], [Price], [Image_url]) VALUES (N'LTPT01', N'Lập trình Python', 1, CAST(N'2021-07-06' AS Date), 4, N'BJ84H-M4M4R-2VYC4', N'399.000', N'kh6.jpg')
INSERT [dbo].[Course] ([CourseID], [CourseName], [CategoryCourse], [CreateDate], [Teacher_ID], [Active_ID], [Price], [Image_url]) VALUES (N'LTPT02', N'Lập trình Back-end với Python', 1, CAST(N'2021-07-02' AS Date), 1, N'V942D-C7NFG-773PY', N'399.000', N'kh7.jpg')
INSERT [dbo].[Course] ([CourseID], [CourseName], [CategoryCourse], [CreateDate], [Teacher_ID], [Active_ID], [Price], [Image_url]) VALUES (N'LTWeb', N'Lập trình Web', 1, CAST(N'2021-07-10' AS Date), 3, N'2YXF4-RXB7J-MT2HF', N'500.000', N'kh8.jpg')
INSERT [dbo].[Course] ([CourseID], [CourseName], [CategoryCourse], [CreateDate], [Teacher_ID], [Active_ID], [Price], [Image_url]) VALUES (N'MS01', N'Học nấu món việt', 5, CAST(N'2021-07-02' AS Date), 6, N'FBNC3-JXRR6-RYWVX', N'1000.000', N'food1.jpg')
INSERT [dbo].[Course] ([CourseID], [CourseName], [CategoryCourse], [CreateDate], [Teacher_ID], [Active_ID], [Price], [Image_url]) VALUES (N'MS02', N'Học nấu món Pháp', 5, CAST(N'2021-07-01' AS Date), 5, N'FN29M-6M73B-PHRRG', N'199.000', N'food9.jpg')
INSERT [dbo].[Course] ([CourseID], [CourseName], [CategoryCourse], [CreateDate], [Teacher_ID], [Active_ID], [Price], [Image_url]) VALUES (N'MS03', N'Học nấu món Âu', 5, CAST(N'2021-07-02' AS Date), 2, N'RVF7N-6C7KH-YR4BK', N'299.000', N'food3.jpg')
INSERT [dbo].[Course] ([CourseID], [CourseName], [CategoryCourse], [CreateDate], [Teacher_ID], [Active_ID], [Price], [Image_url]) VALUES (N'MS04', N'Học nẩu món Nhật', 5, CAST(N'2021-07-05' AS Date), 4, N'22QK9–3N6FK-VDGRD', N'100.000', N'food5.jpg')
INSERT [dbo].[Course] ([CourseID], [CourseName], [CategoryCourse], [CreateDate], [Teacher_ID], [Active_ID], [Price], [Image_url]) VALUES (N'MS05', N'Học nấu món Hàn ', 5, CAST(N'2021-07-02' AS Date), 6, N'8QF3D-6XFH6-R894W', N'500.000', N'food7.jpg')
INSERT [dbo].[Course] ([CourseID], [CourseName], [CategoryCourse], [CreateDate], [Teacher_ID], [Active_ID], [Price], [Image_url]) VALUES (N'MS06', N'Chuẩn cơm mẹ nấu', 5, CAST(N'2021-07-02' AS Date), 2, N'QD2B2-HGGXX-7FPJB', N'100.000', N'food10.jpg')
INSERT [dbo].[Course] ([CourseID], [CourseName], [CategoryCourse], [CreateDate], [Teacher_ID], [Active_ID], [Price], [Image_url]) VALUES (N'NN01', N'Học ngôn ngữ nhật', 2, CAST(N'2021-07-24' AS Date), 1, N'BM7Y6-J67KH-9BRX3', N'300.000', N'nn2.jpg')
INSERT [dbo].[Course] ([CourseID], [CourseName], [CategoryCourse], [CreateDate], [Teacher_ID], [Active_ID], [Price], [Image_url]) VALUES (N'NN02', N'Học IELTS cho từ số 0', 2, CAST(N'2021-07-23' AS Date), 2, N'2WHKY-3FYVH-HXKHD', N'200.000', N'nn3.jpg')
INSERT [dbo].[Course] ([CourseID], [CourseName], [CategoryCourse], [CreateDate], [Teacher_ID], [Active_ID], [Price], [Image_url]) VALUES (N'NN03', N'Luyện thi IELTS ', 2, CAST(N'2021-07-20' AS Date), 5, N'4TVFJ-Y432J-QC9HD', N'600.000', N'kn6.jpg')
INSERT [dbo].[Course] ([CourseID], [CourseName], [CategoryCourse], [CreateDate], [Teacher_ID], [Active_ID], [Price], [Image_url]) VALUES (N'NN04', N'Học ngôn ngữ hàn ', 2, CAST(N'2021-07-24' AS Date), 6, N'F2XTW-PTWYR-K4R9M', N'500.000', N'nn5.jpg')
INSERT [dbo].[Course] ([CourseID], [CourseName], [CategoryCourse], [CreateDate], [Teacher_ID], [Active_ID], [Price], [Image_url]) VALUES (N'QP01', N'Khóa học quay phim cơ bản', 3, CAST(N'2021-07-24' AS Date), 5, N'M37CH-3BR2B-MB2HM', N'200.000', N'dp4.jpg')
INSERT [dbo].[Course] ([CourseID], [CourseName], [CategoryCourse], [CreateDate], [Teacher_ID], [Active_ID], [Price], [Image_url]) VALUES (N'QP02', N'Khóa học quay phim nâng cao', 3, CAST(N'2021-07-24' AS Date), 5, N'GXRDD-VPM73-K3YVJ', N'300.000', N'dp1.jpg')
SET IDENTITY_INSERT [dbo].[Description] ON 

INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (1, N'Learn', N'Có kiến thức nền tảng vững chắc về ngôn ngữ C/C++ thông qua những kiến thức lý thuyết', N'LTC01')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (3, N'Learn', N'Kiến thức lập trình đủ để xây dựng phần mềm từ ý tưởng đến thành phẩm hoàn thiện', N'LTC01')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (4, N'Learn', N'Biết sử dụng kỹ thuật đệ quy để giải quyết bài toán phức tạp.', N'LTC01')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (5, N'Learn', N'Có đủ kiến thức nền tảng cơ bản về C/C++ để bạn tiếp tục tự học thêm ngôn ngữ', N'LTC01')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (6, N'Learn', N'Thiết kế, xây dựng, thử nghiệm và gỡ lỗi', N'LTC01')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (7, N'Intro', N'Ngôn ngữ lập trình C++ được xây dựng và phát triển từ ngôn ngữ C. Ngôn ngữ C++ không phải là ngôn ngữ hướng đối tượng hoàn toàn mà là ngôn ngữ “đa hướng”. Vì C++ hỗ trợ cả lập trình hướng hành động và lập trình hướng đối tượng. Nó là một trong những ngôn ngữ phổ biến để viết các ứng dụng máy tính – và ngôn ngữ thông dụng nhất để lập trình games. ', N'LTC01')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (8, N'Intro', N'Khóa học sẽ trang bị cho học viên các kỹ năng lập trình được minh hoạ cụ thể bằng ngôn ngữ lập trình C/C++ từ cơ bản đến nâng cao. Khóa học bao gồm các kỹ thuật lập trình trên các kiểu dữ liệu cơ bản, các phát biểu lựa chọn, câu lệnh điều khiển, vòng lặp, mảng, con trỏ, kiểu cấu trúc. Bên cạnh đó khóa học cũng trang bị cho học viên kiến thức xử lý tập tin, cách viết chương trình theo kiểu lập trình hàm...

Qua khóa học Học lập trình C/C++ TỪ A - Z tại Unica.vn, học viên có thể tự nâng cao kỹ năng lập trình của mình, dễ dàng tiếp cận các ngôn ngữ cấp cao và công nghệ mới. Đây là khóa học tạo tiền đề tốt cho việc tiếp cận phương pháp lập trình hướng đối tượng, một phương pháp lập trình cần phải có của một lập trình viên.', N'LTC01')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (9, N'Title', N'Trang bị cho bạn kỹ năng lập trình ngôn ngữ C/C++ từ cơ bản đến nâng cao, được minh họa thông qua các bài tập thực hành thực tế nhất về C/C++', N'LTC01')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (19, N'Learn', N'Có được toàn bộ kiến thức về ngôn ngữ lập trình C# từ cơ bản đến chuyên sâu nhất để có', N'LTCS')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (20, N'Learn', N'Có được kiến thức toàn diện đầy đủ về ngôn ngữ lập trình C#', N'LTCS')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (21, N'Learn', N'Xây dựng được kiến trúc đa tầng trong C#, lập trình win form cơ bản trong C#', N'LTCS')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (22, N'Learn ', N'Có khả năng phát triển phần mềm tương tác cơ sở dữ liệu bằng C#', N'LTCS')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (24, N'Intro', N'Có thể tạo ra một ứng dụng C# hoàn chỉnh sau khi hoàn thành khóa học', N'LTCS')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (25, N'Intro', N'Cung cấp những cơ hội thực hành tạo ứng dụng C# ngay trong quá trình học', N'LTCS')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (26, N'Title', N' Khóa học à cẩm nang đầy đủ về C# cung cấp trọn bộ kiến thức cơ bản - có thể tạo ra một ứng dụng C# hoàn chỉnh', N'LTCS')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (27, N'Learn', N'Cung cấp kiến thức toàn diện nhất về ngôn ngữ lập trình Java', N'LTJ01')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (28, N'Learn', N'Nền tảng lập trình Java để ứng dụng tính toán và xử lý dữ liệu trong Java', N'LTJ01')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (29, N'Learn', N'Có thể lập trình cơ sở dữ liệu ', N'LTJ01')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (30, N'Intro', N'Viết phần mềm quản lí cho khách hàng bằng ngôn ngữ của Java', N'LTJ01')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (31, N'Intro', N'Học và rèn luyện hiệu quả thông qua rất nhiều bài tập rèn luyện để nâng cao kiến thức và kỹ năng lập trình Java hiệu quả', N'LTJ01')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (32, N'Title', N' Tìm hiểu cơ bản về ngôn ngữ lập trình Java ', N'LTJ01')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (33, N'Learn', N'Nhanh chóng nắm vững kiến thức và kỹ năng cơ bản nhất về ASP.Net MVC để tạo lập một', N'LTCS01')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (34, N'Learn', N'Tự tin xây dựng website thương mại điện tử trên nền tảng ASP.NET MVC', N'LTCS01')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (35, N'Learn', N'Xây dựng ứng dụng quản lý trên nền tảng Internet', N'LTCS01')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (38, N'Intro', N'Làm nền tảng cho việc nghiên cứu các kỹ thuật và công nghệ mới của Microsoft', N'LTCS01')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (39, N'Intro', N'Tăng khả năng thăng tiến trong công việc', N'LTCS01')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (41, N'Title', N'ASP.NET MVC - Một trong những framework làm việc tuyệt vời của dân lập trình web', N'LTCS01')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (42, N'Learn', N'Hiểu được cơ bản về Spring Boot, về cấu hình Environment và hệ sinh thái Spring', N'LTJ02')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (43, N'Learn', N'Nắm được cách tích hợp Thymeleaf template vào Spring Boot', N'LTJ02')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (44, N'Learn', N'Biết cách tích hợp ứng dụng Spring Boot với các thành phần như Mysql, Spring Data, JPA,', N'LTJ02')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (46, N'Learn', N'Nắm được kiến trúc Application Layers của một ứng dụng Spring Boot', N'LTJ02')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (47, N'Intro', N'Biết cách tạo, build và run project với Spring Boot nhanh nhất.', N'LTJ02')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (48, N'Intro', N'Nắm được cách tạo login và tạo ứng dụng CRUD MyContact với Spring Boot, Mysql,', N'LTJ02')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (49, N'Title', N'Spring Boot và tầm  quan trọng của Spring Boot', N'LTJ02')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (50, N'Learn', N'Kiến thức nền tảng nhất về ngôn ngữ lập trình Python cho đến ứng dụng Python nâng cao vào các tình huống thực tế', N'LTPT01')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (51, N'Learn', N'Nắm được các kiến thức có trong lập trình Python: biểu thức trong Python, đối tượng String, List, Tuples, Sets và Dictionary,', N'LTPT01')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (52, N'Learn', N'Tự ôn tập và nâng cao kỹ năng lập trình Python với các bài tập và tình huống thực có trong quá', N'LTPT01')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (53, N'Intro', N'Tiếp cận và làm việc và thực hành với Python từ con số 0', N'LTPT01')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (56, N'Intro', N'Xây dựng Website, Game, Application hoặc Automation bằng ngôn ngữ Python', N'LTPT01')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (57, N'Title', N'Nhanh chóng thành thạo các thao tác làm việc và áp dụng vào công việc lập trình', N'LTPT01')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (58, N'Learn', N'Có được kiến thức đầy đủ và toàn diệnnhất về ngôn ngữ lập trình Python', N'LTPT02')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (59, N'Learn', N'Thực hành giải các bài tập rèn luyện cơ bản - nâng cao khi dùng Python qua mỗi phần học.', N'LTPT02')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (60, N'Learn', N'Sớm làm chủ được Python, giúp học viên dễ dàng tiếp thu các ngôn ngữ mới', N'LTPT02')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (61, N'Intro', N'Cơ sở để học tiếp các khóa: Cấu trúc dữ liệu, lập trình Kotlin, C#, lập trình java, lập trình Android,', N'LTPT02')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (62, N'Intro', N'Khóa học cung cấp trọn bộ kiến thức từ cơ bản của lập trình Python,học viên có thể tạo ra một ứng dụng Python hoàn chỉnh', N'LTPT02')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (63, N'Title', N'Có nền tảng vững chắc để tham gia các dự án liên quan tới lập trình Python', N'LTPT02')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (64, N'Learn', N'Nắm được toàn bộ kiến thức từ cơ bản đến chuyên sâu về ngôn ngữ lập trình PHP, MySQL,', N'LTWeb')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (65, N'Learn', N'Ứng dụng PHP/Mysql theo mô hình MVC', N'LTWeb')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (66, N'Learn', N'Tự làm một số phần mềm quản lý cho riêng mình, quản lý contact, quản lý công việc, quản lý', N'LTWeb')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (67, N'Intro', N'Ứng dụng thành thạo lập trình Backend cho website', N'LTWeb')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (68, N'Intro', N'Là cách tư duy lập trình theo hướng Model - View - Controller', N'LTWeb')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (69, N'Title', N'Tự tin ứng tuyển vào các vị trí lập trình viên Backend tại các doanh nghiệp hoặc học cao', N'LTWeb')
SET IDENTITY_INSERT [dbo].[Description] OFF
SET IDENTITY_INSERT [dbo].[MyCourse] ON 

INSERT [dbo].[MyCourse] ([ID], [User_ID], [Course_ID]) VALUES (2, 2, N'LTC01')
INSERT [dbo].[MyCourse] ([ID], [User_ID], [Course_ID]) VALUES (3, 2, N'LTCS')
INSERT [dbo].[MyCourse] ([ID], [User_ID], [Course_ID]) VALUES (4, 2, N'LTWeb')
INSERT [dbo].[MyCourse] ([ID], [User_ID], [Course_ID]) VALUES (5, 2, N'LTJ02')
INSERT [dbo].[MyCourse] ([ID], [User_ID], [Course_ID]) VALUES (6, 5, N'LTCS')
INSERT [dbo].[MyCourse] ([ID], [User_ID], [Course_ID]) VALUES (7, 5, N'LTPT02')
INSERT [dbo].[MyCourse] ([ID], [User_ID], [Course_ID]) VALUES (8, 6, N'LTC01')
INSERT [dbo].[MyCourse] ([ID], [User_ID], [Course_ID]) VALUES (9, 6, N'LTCS')
INSERT [dbo].[MyCourse] ([ID], [User_ID], [Course_ID]) VALUES (10, 6, N'LTWeb')
INSERT [dbo].[MyCourse] ([ID], [User_ID], [Course_ID]) VALUES (14, 4, N'LTC01')
INSERT [dbo].[MyCourse] ([ID], [User_ID], [Course_ID]) VALUES (15, 4, N'LTCS')
INSERT [dbo].[MyCourse] ([ID], [User_ID], [Course_ID]) VALUES (16, 4, N'LTWeb')
INSERT [dbo].[MyCourse] ([ID], [User_ID], [Course_ID]) VALUES (21, 5, N'LTPT01')
INSERT [dbo].[MyCourse] ([ID], [User_ID], [Course_ID]) VALUES (22, 11, N'MS04')
INSERT [dbo].[MyCourse] ([ID], [User_ID], [Course_ID]) VALUES (23, 8, N'LTJ02')
INSERT [dbo].[MyCourse] ([ID], [User_ID], [Course_ID]) VALUES (24, 12, N'LTC01')
SET IDENTITY_INSERT [dbo].[MyCourse] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [User_ID], [Course_ID], [toEmail], [toPhone], [Status]) VALUES (1, 2, N'LTCS01', N'cuongnguyenmanh3008@gmail.com', N'123456789', N'paymented')
INSERT [dbo].[Order] ([OrderID], [User_ID], [Course_ID], [toEmail], [toPhone], [Status]) VALUES (2, 5, N'LTPT01', N'cuongnvhe130809@fpt.edu.vn', N'123456789', N'verify')
INSERT [dbo].[Order] ([OrderID], [User_ID], [Course_ID], [toEmail], [toPhone], [Status]) VALUES (3, 9, N'LTJ01', N'nguyenaliasbn@gmail.com', N'0981284020', N'verify')
INSERT [dbo].[Order] ([OrderID], [User_ID], [Course_ID], [toEmail], [toPhone], [Status]) VALUES (4, 5, N'LTPT01', N'cuongnguyenmanh3008@gmail.com', N'123456789', N'paymented')
INSERT [dbo].[Order] ([OrderID], [User_ID], [Course_ID], [toEmail], [toPhone], [Status]) VALUES (5, 5, N'LTJ02', N'cuongnguyenmanh3008@gmail.com', N'123456789', N'paymented')
INSERT [dbo].[Order] ([OrderID], [User_ID], [Course_ID], [toEmail], [toPhone], [Status]) VALUES (6, 4, N'LTJ02', N'cuongnguyenmanh3008@gmail.com', N'0123456789', N'verify')
INSERT [dbo].[Order] ([OrderID], [User_ID], [Course_ID], [toEmail], [toPhone], [Status]) VALUES (7, 5, N'MS02', N'cuongnguyenmanh3008@gmail.com', N'123456789', N'verify')
INSERT [dbo].[Order] ([OrderID], [User_ID], [Course_ID], [toEmail], [toPhone], [Status]) VALUES (8, 11, N'MS04', N'ngocanhdtt2004@gmail.com', N'036521038', N'paymented')
INSERT [dbo].[Order] ([OrderID], [User_ID], [Course_ID], [toEmail], [toPhone], [Status]) VALUES (9, 2, N'MS02', N'cuongnguyenmanh3008@gmail.com', N'123456789', N'paymented')
INSERT [dbo].[Order] ([OrderID], [User_ID], [Course_ID], [toEmail], [toPhone], [Status]) VALUES (10, 8, N'MS03', N'cuongnguyenmanh3008@gmail.com', N'0393556120', N'paymented')
INSERT [dbo].[Order] ([OrderID], [User_ID], [Course_ID], [toEmail], [toPhone], [Status]) VALUES (11, 8, N'LTJ02', N'cuongnguyenmanh3008@gmail.com', N'0393556120', N'paymented')
INSERT [dbo].[Order] ([OrderID], [User_ID], [Course_ID], [toEmail], [toPhone], [Status]) VALUES (12, 12, N'LTC01', N'cuongnguyenmanh3008@gmail.com', N'012355685474', N'paymented')
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[Rating] ON 

INSERT [dbo].[Rating] ([RatingID], [User_ID], [Course_ID], [Score]) VALUES (1, 2, N'LTC01', 2)
INSERT [dbo].[Rating] ([RatingID], [User_ID], [Course_ID], [Score]) VALUES (2, 4, N'LTC01', 3)
INSERT [dbo].[Rating] ([RatingID], [User_ID], [Course_ID], [Score]) VALUES (3, 5, N'LTC01', 4)
INSERT [dbo].[Rating] ([RatingID], [User_ID], [Course_ID], [Score]) VALUES (4, 6, N'LTC01', 1)
INSERT [dbo].[Rating] ([RatingID], [User_ID], [Course_ID], [Score]) VALUES (5, 8, N'LTC01', 4)
INSERT [dbo].[Rating] ([RatingID], [User_ID], [Course_ID], [Score]) VALUES (6, 2, N'LTCS', 3)
INSERT [dbo].[Rating] ([RatingID], [User_ID], [Course_ID], [Score]) VALUES (7, 2, N'LTCS01', 3)
INSERT [dbo].[Rating] ([RatingID], [User_ID], [Course_ID], [Score]) VALUES (8, 2, N'LTJ02', 3)
INSERT [dbo].[Rating] ([RatingID], [User_ID], [Course_ID], [Score]) VALUES (9, 2, N'LTJ01', 2)
INSERT [dbo].[Rating] ([RatingID], [User_ID], [Course_ID], [Score]) VALUES (10, 2, N'LTPT02', 3)
INSERT [dbo].[Rating] ([RatingID], [User_ID], [Course_ID], [Score]) VALUES (11, 2, N'MS04', 3)
INSERT [dbo].[Rating] ([RatingID], [User_ID], [Course_ID], [Score]) VALUES (12, 2, N'MS01', 3)
INSERT [dbo].[Rating] ([RatingID], [User_ID], [Course_ID], [Score]) VALUES (13, 2, N'MS03', 3)
INSERT [dbo].[Rating] ([RatingID], [User_ID], [Course_ID], [Score]) VALUES (14, 5, N'MS04', 3)
INSERT [dbo].[Rating] ([RatingID], [User_ID], [Course_ID], [Score]) VALUES (15, 4, N'LTCS01', 3)
INSERT [dbo].[Rating] ([RatingID], [User_ID], [Course_ID], [Score]) VALUES (16, 5, N'LTPT02', 4)
INSERT [dbo].[Rating] ([RatingID], [User_ID], [Course_ID], [Score]) VALUES (17, 5, N'LTCS01', 3)
INSERT [dbo].[Rating] ([RatingID], [User_ID], [Course_ID], [Score]) VALUES (18, 5, N'LTWeb', 3)
INSERT [dbo].[Rating] ([RatingID], [User_ID], [Course_ID], [Score]) VALUES (19, 9, N'LTJ01', 3)
INSERT [dbo].[Rating] ([RatingID], [User_ID], [Course_ID], [Score]) VALUES (20, 2, N'LTPT01', 3)
SET IDENTITY_INSERT [dbo].[Rating] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Customer')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([TeacherID], [Name], [Age], [Url_Image], [Description]) VALUES (1, N'Sir Alex  Ferguson', NULL, N'sir_alex.jpg', N'Sir Alexander Chapman "Alex" Ferguson CBE là một cựu cầu thủ và huấn luyện viên bóng đá người Scotland. Trong vòng 31 năm, ông đã giúp Manchester United trở thành câu lạc bộ bóng đá vĩ đại nhất lịch sử nước Anh với 20 lần vô địch giải quốc nội. ')
INSERT [dbo].[Teacher] ([TeacherID], [Name], [Age], [Url_Image], [Description]) VALUES (2, N'Elon Musk', NULL, N'Elon_Musk.jpg', N'Elon Reeve Musk FRS, là một kỹ sư, nhà tài phiệt, nhà phát minh, doanh nhân công nghệ và nhà từ thiện Người Mỹ gốc Nam Phi. Ông cũng là công dân mang hai quốc tịch Nam Phi và Canada. ')
INSERT [dbo].[Teacher] ([TeacherID], [Name], [Age], [Url_Image], [Description]) VALUES (3, N'Jeff Bezos', NULL, N'Jeff_Bezos.jpg', N'Jeffrey Preston Bezos là doanh nhân, nhà tư bản công nghiệp, chủ sở hữu truyền thông và nhà đầu tư người Mỹ. Bezos được biết đến như là người sáng lập, CEO và chủ tịch của công ty công nghệ đa quốc gia Amazon.')
INSERT [dbo].[Teacher] ([TeacherID], [Name], [Age], [Url_Image], [Description]) VALUES (4, N'Bill Gates', NULL, N'BillGates.jpg', N'William Henry "Bill" Gates III là một doanh nhân người Mỹ, nhà từ thiện, tác giả và chủ tịch tập đoàn Microsoft, hãng phần mềm khổng lồ mà ông cùng với Paul Allen đã sáng lập ra. Ông luôn có mặt trong danh sách những người giàu nhất trên thế giới.')
INSERT [dbo].[Teacher] ([TeacherID], [Name], [Age], [Url_Image], [Description]) VALUES (5, N'Mark Zuckerberg', NULL, N'zuckerberg.jpg', N'Mark Elliot Zuckerberg là một nhà lập trình máy tính người Mỹ kiêm doanh nhân mảng công nghệ Internet. Anh là nhà đồng sáng lập của Facebook, và hiện đang điều hành công ty này với chức danh chủ tịch kiêm giám đốc điều hành. ')
INSERT [dbo].[Teacher] ([TeacherID], [Name], [Age], [Url_Image], [Description]) VALUES (6, N'Warren Buffett', NULL, N'WarrenBuffett.png', N'Warren Edward Buffett sinh ngày 30 tháng 8 năm 1930 tại Omaha, tiểu bang Nebraska, Hoa Kỳ, là một nhà đầu tư, doanh nhân và nhà từ thiện người Hoa Kỳ.')
SET IDENTITY_INSERT [dbo].[Teacher] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [Username], [Password], [FullName], [Email], [PhoneNumber], [Role_ID], [Image_url]) VALUES (2, N'cuongnm', N'manhcuong1', N'Nguyễn Mạnh Cường', N'cuongnguyenmanh3008@gmail.com', N'123456789', 2, NULL)
INSERT [dbo].[User] ([UserID], [Username], [Password], [FullName], [Email], [PhoneNumber], [Role_ID], [Image_url]) VALUES (4, N'chienpd', N'chienphan', N'Nguyễn Đức Chiến', N'cuongnguyenmanh3008@gmail.com', N'0123456789', 2, NULL)
INSERT [dbo].[User] ([UserID], [Username], [Password], [FullName], [Email], [PhoneNumber], [Role_ID], [Image_url]) VALUES (5, N'haiphuong', N'haiphuong', N'Nguyễn Hải Phương', N'cuongnguyenmanh3008@gmail.com', N'123456789', 2, NULL)
INSERT [dbo].[User] ([UserID], [Username], [Password], [FullName], [Email], [PhoneNumber], [Role_ID], [Image_url]) VALUES (6, N'manhcuong', N'manhcuong1', N'Nguyễn Mạnh Cường', N'cuongnguyenmanh3008@gmail.com', N'123456789', 2, NULL)
INSERT [dbo].[User] ([UserID], [Username], [Password], [FullName], [Email], [PhoneNumber], [Role_ID], [Image_url]) VALUES (7, N'pewpew', N'manhcuong1', N'Pew Pew ', N'cuongnguyenmanh3008@gmail.com', N'123456789', 2, NULL)
INSERT [dbo].[User] ([UserID], [Username], [Password], [FullName], [Email], [PhoneNumber], [Role_ID], [Image_url]) VALUES (8, N'manhcuongbn', N'manhcuong1', N'Nguyễn Mạnh Cường', N'cuongnguyenmanh3008@gmail.com', N'123456789', 2, NULL)
INSERT [dbo].[User] ([UserID], [Username], [Password], [FullName], [Email], [PhoneNumber], [Role_ID], [Image_url]) VALUES (9, N'theanh', N'the123', N'Nguyễn Đình Thế', N'cuongnguyenmanh3008@gmail.com', N'0981284020', 2, NULL)
INSERT [dbo].[User] ([UserID], [Username], [Password], [FullName], [Email], [PhoneNumber], [Role_ID], [Image_url]) VALUES (10, N'admin', N'manhcuong1', N'Nguyễn Mạnh Cường', N'cuongnguyenmanh3008@gmail.com', N'123456789', 1, NULL)
INSERT [dbo].[User] ([UserID], [Username], [Password], [FullName], [Email], [PhoneNumber], [Role_ID], [Image_url]) VALUES (11, N'hungnd', N'duchung', N'Nguyễn Đức Hùng', N'cuongnguyenmanh3008@gmail.com', N'123456789', 2, NULL)
INSERT [dbo].[User] ([UserID], [Username], [Password], [FullName], [Email], [PhoneNumber], [Role_ID], [Image_url]) VALUES (12, N'thopn', N'123', N'Phạm Ngọc Thọ', N'cuongnguyenmanh3008@gmail.com', N'123456789', 2, NULL)
INSERT [dbo].[User] ([UserID], [Username], [Password], [FullName], [Email], [PhoneNumber], [Role_ID], [Image_url]) VALUES (13, N'cuongnm2', N'manhcuong1', N'Nguyễn Mạnh Cường', N'cuongnguyenmanh3008@gmail.com', N'123456789', 2, NULL)
INSERT [dbo].[User] ([UserID], [Username], [Password], [FullName], [Email], [PhoneNumber], [Role_ID], [Image_url]) VALUES (14, N'cuongnm3', N'manhcuong1', N'Nguyễn Mạnh Cường', N'cuongnguyenmanh3008@gmail.com', N'123456789', 2, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[Video] ON 

INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (1, N'Giới thiệu khóa học', N'https://www.youtube.com/embed/ILr_rU-lISk', 2)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (2, N'Biến và hằng trong C', N'https://www.youtube.com/embed/q8UGqw6Cbnk', 2)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (3, N'Các kiểu dữ liệu trong C', N'https://www.youtube.com/embed/jtS7g65zrWU', 2)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (4, N'Hiện tượng tràn số trong C', N'https://www.youtube.com/embed/nQ93_TpS14M', 2)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (5, N'Nhập xuất trong C', N'https://www.youtube.com/embed/AlxkkNlVQd8', 2)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (6, N'Toán tử trong C', N'https://www.youtube.com/embed/3BOza8aCxNs', 2)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (7, N'Cấu trúc điều khiển if else', N'https://www.youtube.com/embed/i3nJyEt42Y8', 6)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (8, N'Vòng lặp for trong C', N'https://www.youtube.com/embed/aL59MpOFMe0', 6)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (9, N'Vòng lặp while và do … while', N'https://www.youtube.com/embed/i3nJyEt42Y8', 6)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (10, N'Sự linh hoạt trong sử dụng vòng lặp', N'https://www.youtube.com/embed/i3nJyEt42Y8', 6)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (11, N'Một số hàm trong thư viện toán học math.h', N'https://www.youtube.com/embed/xt5rScAb9lI', 8)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (12, N'Hàm người dùng định nghĩa', N'https://www.youtube.com/embed/4i--rEoaMn8', 8)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (13, N'Hàm không trả về giá trị', N'https://www.youtube.com/embed/4i--rEoaMn8', 8)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (14, N'Hàm đệ quy', N'https://www.youtube.com/embed/4i--rEoaMn8', 8)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (15, N'Nhập xuất mảng 1 chiều trong C', N'https://www.youtube.com/embed/cgKiUF98fLo', 9)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (16, N'Thêm, xóa phần tử trong mảng 1 chiều', N'https://www.youtube.com/embed/cgKiUF98fLo', 9)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (17, N'Nhập xuất chuỗi trong C', N'https://www.youtube.com/embed/gPzzRrQ5SfY', 10)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (18, N'Các hàm trong thư viện string.h', N'https://www.youtube.com/embed/gXhS1LI2Y1k', 10)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (19, N'Đảo ngược chuỗi trong C', N'https://www.youtube.com/embed/gXhS1LI2Y1k', 10)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (20, N'Con trỏ trong C', N'https://www.youtube.com/embed/4u0RdM7xub8', 11)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (21, N'Mối liên hệ giữa con trỏ và mảng trong C', N'https://www.youtube.com/embed/4u0RdM7xub8', 11)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (22, N' C# là gì ', N'https://www.youtube.com/embed/9kohr6pMwag', 12)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (23, N'Cấu trúc lệnh cơ bản', N'https://www.youtube.com/embed/FhAIc0tlyaQ', 12)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (24, N'Nhập xuất cơ bản', N'https://www.youtube.com/embed/BAscPWPtCD8', 12)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (25, N'Biến trong C#', N'https://www.youtube.com/embed/IEz7uMSHitM', 13)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (26, N'Kiểu dữ liệu trong C#', N'https://www.youtube.com/embed/yrH7Qe8FXqE', 13)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (27, N'Toán tử trong C#', N'https://www.youtube.com/embed/niz7Gg8uB-k', 14)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (28, N'Hằng', N'https://www.youtube.com/embed/13NRSYgKh0o', 14)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (29, N'Giới thiệu Java', N'https://www.youtube.com/embed/3gtOAlcovoQ', 15)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (30, N'Cài đặt môi trường Java ', N'https://www.youtube.com/embed/KjMRn1YQcLc', 15)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (31, N'Chương trình Java đầu tiên', N'https://www.youtube.com/embed/KjMRn1YQcLc', 16)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (32, N'Biến trong Java ', N'https://www.youtube.com/embed/G2mCSTtBojM', 16)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (33, N'Kiểu dữ liệu trong Java', N'https://www.youtube.com/embed/4k_5vWY2wps', 17)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (34, N'Toán tử trong Java', N'https://www.youtube.com/embed/H9FmP010A_Q', 17)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (35, N'Hằng trong Java', N'https://www.youtube.com/embed/dqybUkGCaVw', 18)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (36, N'Ép kiểu trong Java ', N'https://www.youtube.com/embed/kOMiIKLCK34', 18)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (37, N'Cấu trúc rẽ nhánh trong Java', N'https://www.youtube.com/embed/vradAZcby8I', 19)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (38, N'Vòng lặp While trong Java', N'https://www.youtube.com/embed/tDfQ33fmmvs', 19)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (39, N'Mảng trong Java', N'https://www.youtube.com/embed/1QVfZFOt7uI', 20)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (40, N'Foreach trong Java', N'https://www.youtube.com/embed/SVnPYiHS68U', 20)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (41, N'Giới thiệu ngôn ngữ lập trình Python', N'https://www.youtube.com/embed/NZj6LI5a9vc', 21)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (42, N'Cài đặt môi trường Python', N'https://www.youtube.com/embed/jf-q_dG8WzI', 21)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (43, N'Biến(Variable) trong Python ', N'https://www.youtube.com/embed/nclE18Yl-kA', 22)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (44, N'Kiểu số trong Python ', N'https://www.youtube.com/embed/IAVvgqDBiv0', 22)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (45, N'Kiểu chuỗi trong Python', N'https://www.youtube.com/embed/Vb6XWSLPQfg', 23)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (46, N' List trong Python', N'https://www.youtube.com/embed/u2Kd3weqPZE', 23)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (47, N'Tuple trong Python', N'https://www.youtube.com/embed/dDFFCbRGm3o', 24)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (48, N'Hashable và Unhashable trong Python', N'https://www.youtube.com/embed/gw9zbl2Q7r4', 24)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (49, N'Hàm xuất trong Python', N'https://www.youtube.com/embed/rhOyCSIf1is', 25)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (50, N'Hàm nhập trong Python', N'https://www.youtube.com/embed/rK4MphZVhDM', 25)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (51, N'Function trong python - Sơ lược về hàm', N'https://www.youtube.com/embed/a6FnNvt3Fw4', 26)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (52, N'Function trong python - Positional', N'https://www.youtube.com/embed/M77p3PB-qzM', 26)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (53, N'Spring boot là gì', N'https://www.youtube.com/embed/GBOMXhDLxmc', 27)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (54, N'Restful api web service trong java web spring boot phần 1', N'https://www.youtube.com/embed/Ptjqr1HPgPk', 27)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (55, N'Tạo ứng dụng Spring Boot ', N'https://www.youtube.com/embed/CZJTBlEUvls', 28)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (56, N'Giới thiệu về Controller của Spring MVC', N'https://www.youtube.com/embed/SGUbh6hjVdE', 28)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (57, N'Đọc dữ liệu trong action', N'https://www.youtube.com/embed/nPN0AD_dlrU', 29)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (58, N'Gọi các action của controller theo phương thức GET hoặc POST', N'https://www.youtube.com/embed/aP0lDxgmeps', 29)
SET IDENTITY_INSERT [dbo].[Video] OFF
ALTER TABLE [dbo].[Chapter]  WITH CHECK ADD  CONSTRAINT [FKChapter917126] FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Chapter] CHECK CONSTRAINT [FKChapter917126]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Category] FOREIGN KEY([CategoryCourse])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Category]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FKCourse287810] FOREIGN KEY([Teacher_ID])
REFERENCES [dbo].[Teacher] ([TeacherID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FKCourse287810]
GO
ALTER TABLE [dbo].[Description]  WITH CHECK ADD  CONSTRAINT [FKDescriptio705554] FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Description] CHECK CONSTRAINT [FKDescriptio705554]
GO
ALTER TABLE [dbo].[MyCourse]  WITH CHECK ADD  CONSTRAINT [FKMyCourse150142] FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[MyCourse] CHECK CONSTRAINT [FKMyCourse150142]
GO
ALTER TABLE [dbo].[MyCourse]  WITH CHECK ADD  CONSTRAINT [FKMyCourse531829] FOREIGN KEY([User_ID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[MyCourse] CHECK CONSTRAINT [FKMyCourse531829]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK__Order__Course_ID__45F365D3] FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK__Order__Course_ID__45F365D3]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK__Order__User_ID__44FF419A] FOREIGN KEY([User_ID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK__Order__User_ID__44FF419A]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD FOREIGN KEY([User_ID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FKUser187275] FOREIGN KEY([Role_ID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FKUser187275]
GO
ALTER TABLE [dbo].[Video]  WITH CHECK ADD  CONSTRAINT [FKVideo491000] FOREIGN KEY([Chapter_ID])
REFERENCES [dbo].[Chapter] ([ChapterID])
GO
ALTER TABLE [dbo].[Video] CHECK CONSTRAINT [FKVideo491000]
GO
USE [master]
GO
ALTER DATABASE [OnlineEducation] SET  READ_WRITE 
GO
