USE [master]
GO
/****** Object:  Database [DataQuickJob]    Script Date: 4/23/2021 10:24:29 PM ******/
CREATE DATABASE [DataQuickJob]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DataQuickJob', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DataQuickJob.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DataQuickJob_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DataQuickJob_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DataQuickJob] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DataQuickJob].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DataQuickJob] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DataQuickJob] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DataQuickJob] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DataQuickJob] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DataQuickJob] SET ARITHABORT OFF 
GO
ALTER DATABASE [DataQuickJob] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DataQuickJob] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DataQuickJob] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DataQuickJob] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DataQuickJob] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DataQuickJob] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DataQuickJob] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DataQuickJob] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DataQuickJob] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DataQuickJob] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DataQuickJob] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DataQuickJob] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DataQuickJob] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DataQuickJob] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DataQuickJob] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DataQuickJob] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DataQuickJob] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DataQuickJob] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DataQuickJob] SET  MULTI_USER 
GO
ALTER DATABASE [DataQuickJob] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DataQuickJob] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DataQuickJob] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DataQuickJob] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DataQuickJob] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DataQuickJob] SET QUERY_STORE = OFF
GO
USE [DataQuickJob]
GO
/****** Object:  Table [dbo].[Bills]    Script Date: 4/23/2021 10:24:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bills](
	[bill_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[bill_datecreate] [datetime] NULL,
	[bill_sum] [int] NULL,
	[bill_active] [bit] NULL,
	[bill_dealine] [datetime] NULL,
	[pakege_id] [int] NULL,
	[bill_key] [nvarchar](max) NULL,
	[bill_orderid] [nvarchar](max) NULL,
 CONSTRAINT [PK_Bills] PRIMARY KEY CLUSTERED 
(
	[bill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categorys]    Script Date: 4/23/2021 10:24:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorys](
	[cate_id] [int] IDENTITY(1,1) NOT NULL,
	[cate_name] [nvarchar](300) NULL,
	[cate_view] [int] NULL,
 CONSTRAINT [PK_Categorys] PRIMARY KEY CLUSTERED 
(
	[cate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chats]    Script Date: 4/23/2021 10:24:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chats](
	[chat_id] [int] IDENTITY(1,1) NOT NULL,
	[chat_sender] [int] NULL,
	[chat_receiver] [int] NULL,
	[chat_content] [nvarchar](max) NULL,
	[chat_datecreate] [datetime] NULL,
	[chat_color] [nvarchar](400) NULL,
	[chat_key] [nvarchar](max) NULL,
	[chat_active] [bit] NULL,
 CONSTRAINT [PK_Chats] PRIMARY KEY CLUSTERED 
(
	[chat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cvs]    Script Date: 4/23/2021 10:24:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cvs](
	[cv_id] [int] IDENTITY(1,1) NOT NULL,
	[cv_img] [nvarchar](max) NULL,
	[cv_location] [nvarchar](300) NULL,
	[cv_datebirth] [nvarchar](200) NULL,
	[cv_sex] [nvarchar](5) NULL,
	[cv_website] [nvarchar](max) NULL,
	[cv_target] [nvarchar](max) NULL,
	[cv_interest] [nvarchar](max) NULL,
	[cv_informatin] [nvarchar](max) NULL,
	[cv_referenceperson] [nvarchar](max) NULL,
	[cv_title] [nvarchar](200) NULL,
	[cv_email] [varchar](200) NULL,
	[cv_phone] [varchar](15) NULL,
	[cv_fullname] [nvarchar](300) NULL,
	[cv_active] [int] NULL,
	[cv_option] [bit] NULL,
	[cv_bin] [bit] NULL,
	[cv_datecreate] [datetime] NULL,
	[cv_dateupdate] [datetime] NULL,
	[cv_fakeid] [nvarchar](max) NULL,
	[cv_fontsize] [int] NULL,
	[cv_bg] [nvarchar](60) NULL,
	[cv_p] [int] NULL,
	[cv_view] [int] NULL,
	[cv_point] [int] NULL,
	[cv_deadline] [datetime] NULL,
	[user_id] [int] NULL,
	[theme_id] [int] NULL,
	[cv_addpress] [nvarchar](30) NULL,
	[cv_f] [nvarchar](100) NULL,
 CONSTRAINT [PK_Cvs] PRIMARY KEY CLUSTERED 
(
	[cv_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exps]    Script Date: 4/23/2021 10:24:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exps](
	[exp_id] [int] IDENTITY(1,1) NOT NULL,
	[exp_name] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Exps] PRIMARY KEY CLUSTERED 
(
	[exp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 4/23/2021 10:24:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[group_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[category_id] [int] NULL,
	[datecreate] [datetime] NULL,
	[group_item] [int] NULL,
	[job_id] [int] NULL,
	[provice_id] [int] NULL,
	[email] [varchar](3000) NULL,
	[skill] [nvarchar](max) NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemCvs]    Script Date: 4/23/2021 10:24:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemCvs](
	[ic_id] [int] IDENTITY(1,1) NOT NULL,
	[ic_name] [nvarchar](max) NULL,
	[ic_mid] [nvarchar](max) NULL,
	[ic_content] [nvarchar](max) NULL,
	[ic_fakeid] [int] NULL,
	[ic_theme_id] [int] NULL,
	[ic_usid] [int] NULL,
	[ic_stt] [int] NULL,
	[ic_enddate] [nvarchar](max) NULL,
	[ic_todate] [nvarchar](max) NULL,
	[ic_fake] [nvarchar](max) NULL,
 CONSTRAINT [PK_ItemCvs] PRIMARY KEY CLUSTERED 
(
	[ic_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jobs]    Script Date: 4/23/2021 10:24:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobs](
	[job_id] [int] IDENTITY(1,1) NOT NULL,
	[job_title] [nvarchar](2000) NULL,
	[job_addpress] [nvarchar](2000) NULL,
	[job_amout] [int] NULL,
	[wp_id] [int] NULL,
	[type_id] [int] NULL,
	[job_sex] [bit] NULL,
	[exp_id] [int] NULL,
	[job_payend] [varchar](50) NULL,
	[job_paystart] [varchar](50) NULL,
	[job_datedeline] [datetime] NULL,
	[job_name] [nvarchar](1000) NULL,
	[job_phone] [varchar](15) NULL,
	[job_describe] [nvarchar](max) NULL,
	[job_request] [nvarchar](max) NULL,
	[job_right] [nvarchar](max) NULL,
	[job_active] [bit] NULL,
	[job_option] [bit] NULL,
	[job_datecreate] [datetime] NULL,
	[job_dateupdate] [datetime] NULL,
	[job_bin] [bit] NULL,
	[job_view] [int] NULL,
	[user_id] [int] NULL,
	[job_key] [nvarchar](max) NULL,
	[job_textprice] [nvarchar](300) NULL,
 CONSTRAINT [PK_Jobs] PRIMARY KEY CLUSTERED 
(
	[job_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pakages]    Script Date: 4/23/2021 10:24:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pakages](
	[pakage_id] [int] IDENTITY(1,1) NOT NULL,
	[pakage_name] [nvarchar](max) NULL,
	[pakage_note] [nvarchar](max) NULL,
	[pakage_money] [int] NULL,
	[pakage_precent] [int] NULL,
	[pakage_active] [bit] NULL,
	[role_id] [int] NULL,
 CONSTRAINT [PK_Pakages] PRIMARY KEY CLUSTERED 
(
	[pakage_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provices]    Script Date: 4/23/2021 10:24:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provices](
	[provice_id] [int] IDENTITY(1,1) NOT NULL,
	[provice_name] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Provices] PRIMARY KEY CLUSTERED 
(
	[provice_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 4/23/2021 10:24:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](500) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubmitCv]    Script Date: 4/23/2021 10:24:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubmitCv](
	[sb_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[job_id] [int] NULL,
	[sb_datecreate] [datetime] NULL,
	[sb_active] [int] NULL,
	[sb_notecandidate] [nvarchar](max) NULL,
	[sb_noteemployer] [nvarchar](max) NULL,
	[sb_update] [datetime] NULL,
	[cv_id] [int] NULL,
 CONSTRAINT [PK_SubmitCv] PRIMARY KEY CLUSTERED 
(
	[sb_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubmitJob]    Script Date: 4/23/2021 10:24:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubmitJob](
	[sj_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[job_id] [int] NULL,
	[sj_note] [nvarchar](max) NULL,
	[sj_datecreate] [datetime] NULL,
	[cv_id] [int] NULL,
 CONSTRAINT [PK_SubmitJob] PRIMARY KEY CLUSTERED 
(
	[sj_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Themes]    Script Date: 4/23/2021 10:24:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Themes](
	[theme_id] [int] IDENTITY(1,1) NOT NULL,
	[theme_name] [nvarchar](500) NULL,
	[theme_img] [nvarchar](max) NULL,
	[theme_note] [nvarchar](max) NULL,
	[theme_view] [int] NULL,
	[theme_datecreate] [datetime] NULL,
	[theme_active] [bit] NULL,
	[theme_version] [bit] NULL,
 CONSTRAINT [PK_Themes] PRIMARY KEY CLUSTERED 
(
	[theme_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeJobs]    Script Date: 4/23/2021 10:24:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeJobs](
	[type_id] [int] IDENTITY(1,1) NOT NULL,
	[type_name] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Types] PRIMARY KEY CLUSTERED 
(
	[type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/23/2021 10:24:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_email] [varchar](300) NULL,
	[user_pass] [nvarchar](max) NULL,
	[user_active] [bit] NULL,
	[user_option] [bit] NULL,
	[user_datecreate] [datetime] NULL,
	[user_dateupdate] [datetime] NULL,
	[user_img] [nvarchar](max) NULL,
	[user_sex] [bit] NULL,
	[user_birth] [datetime] NULL,
	[user_favourite] [nvarchar](max) NULL,
	[role_id] [int] NULL,
	[user_name] [nvarchar](600) NULL,
	[user_phone] [varchar](15) NULL,
	[employer_company] [nvarchar](300) NULL,
	[provice_id] [int] NULL,
	[employer_banner] [nvarchar](max) NULL,
	[employer_logo] [nvarchar](max) NULL,
	[employer_introduce] [nvarchar](max) NULL,
	[employer_favourite] [nvarchar](max) NULL,
	[employer_amount] [int] NULL,
	[user_note] [nvarchar](max) NULL,
	[employer_pageload] [bit] NULL,
	[employer_youtube] [nvarchar](max) NULL,
	[user_key] [nvarchar](max) NULL,
	[wp_id] [int] NULL,
	[employer_addpress] [nvarchar](300) NULL,
	[version_id] [int] NULL,
	[user_deadline] [datetime] NULL,
	[employer_amoutjob] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Versions]    Script Date: 4/23/2021 10:24:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Versions](
	[version_id] [int] IDENTITY(1,1) NOT NULL,
	[version_name] [nvarchar](400) NULL,
 CONSTRAINT [PK_Versions] PRIMARY KEY CLUSTERED 
(
	[version_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ViewCvs]    Script Date: 4/23/2021 10:24:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ViewCvs](
	[view_id] [int] IDENTITY(1,1) NOT NULL,
	[view_view] [int] NULL,
	[cv_id] [int] NULL,
	[user_id] [int] NULL,
	[view_dateupdate] [datetime] NULL,
 CONSTRAINT [PK_ViewCvs] PRIMARY KEY CLUSTERED 
(
	[view_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Words]    Script Date: 4/23/2021 10:24:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Words](
	[word_id] [int] IDENTITY(1,1) NOT NULL,
	[word_name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Words] PRIMARY KEY CLUSTERED 
(
	[word_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkPlaces]    Script Date: 4/23/2021 10:24:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkPlaces](
	[wp_id] [int] IDENTITY(1,1) NOT NULL,
	[wp_name] [nvarchar](900) NULL,
 CONSTRAINT [PK_WorkPlaces] PRIMARY KEY CLUSTERED 
(
	[wp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bills] ON 

INSERT [dbo].[Bills] ([bill_id], [user_id], [bill_datecreate], [bill_sum], [bill_active], [bill_dealine], [pakege_id], [bill_key], [bill_orderid]) VALUES (4, 1, CAST(N'2021-04-10T12:35:49.730' AS DateTime), 270000, 1, CAST(N'2022-04-10T12:35:49.730' AS DateTime), 10, N'8df04bbb-4a74-4039-aaa9-a5d45d561f7e', N'0517c4e0-8bfe-4968-ae76-4dd23ae76461')
INSERT [dbo].[Bills] ([bill_id], [user_id], [bill_datecreate], [bill_sum], [bill_active], [bill_dealine], [pakege_id], [bill_key], [bill_orderid]) VALUES (5, 4, CAST(N'2021-04-15T15:42:41.563' AS DateTime), 39500, 1, CAST(N'2021-05-15T15:42:41.563' AS DateTime), 12, NULL, NULL)
INSERT [dbo].[Bills] ([bill_id], [user_id], [bill_datecreate], [bill_sum], [bill_active], [bill_dealine], [pakege_id], [bill_key], [bill_orderid]) VALUES (6, 1010, CAST(N'2021-04-23T11:16:58.057' AS DateTime), 35500, 1, CAST(N'2021-05-23T11:16:58.057' AS DateTime), 14, NULL, NULL)
INSERT [dbo].[Bills] ([bill_id], [user_id], [bill_datecreate], [bill_sum], [bill_active], [bill_dealine], [pakege_id], [bill_key], [bill_orderid]) VALUES (7, 1010, CAST(N'2021-04-23T11:30:48.507' AS DateTime), 41500, 1, CAST(N'2021-05-23T11:30:48.507' AS DateTime), 13, NULL, NULL)
INSERT [dbo].[Bills] ([bill_id], [user_id], [bill_datecreate], [bill_sum], [bill_active], [bill_dealine], [pakege_id], [bill_key], [bill_orderid]) VALUES (8, 1010, CAST(N'2021-04-23T11:31:33.053' AS DateTime), 35500, 1, CAST(N'2021-05-23T11:31:33.053' AS DateTime), 14, NULL, NULL)
INSERT [dbo].[Bills] ([bill_id], [user_id], [bill_datecreate], [bill_sum], [bill_active], [bill_dealine], [pakege_id], [bill_key], [bill_orderid]) VALUES (9, 1010, CAST(N'2021-04-23T11:36:53.783' AS DateTime), 35500, 1, CAST(N'2021-05-23T11:36:53.783' AS DateTime), 14, NULL, NULL)
INSERT [dbo].[Bills] ([bill_id], [user_id], [bill_datecreate], [bill_sum], [bill_active], [bill_dealine], [pakege_id], [bill_key], [bill_orderid]) VALUES (10, 1010, CAST(N'2021-04-23T11:37:45.133' AS DateTime), 35500, 1, CAST(N'2021-05-23T11:37:45.133' AS DateTime), 13, NULL, NULL)
INSERT [dbo].[Bills] ([bill_id], [user_id], [bill_datecreate], [bill_sum], [bill_active], [bill_dealine], [pakege_id], [bill_key], [bill_orderid]) VALUES (11, 1010, CAST(N'2021-04-23T11:38:28.100' AS DateTime), 35000, 1, CAST(N'2021-05-23T11:38:28.100' AS DateTime), 14, NULL, NULL)
INSERT [dbo].[Bills] ([bill_id], [user_id], [bill_datecreate], [bill_sum], [bill_active], [bill_dealine], [pakege_id], [bill_key], [bill_orderid]) VALUES (12, 1010, CAST(N'2021-04-23T11:38:53.307' AS DateTime), 41500, 1, CAST(N'2021-05-23T11:38:53.307' AS DateTime), 14, NULL, NULL)
INSERT [dbo].[Bills] ([bill_id], [user_id], [bill_datecreate], [bill_sum], [bill_active], [bill_dealine], [pakege_id], [bill_key], [bill_orderid]) VALUES (13, 1010, CAST(N'2021-04-23T11:40:01.887' AS DateTime), 14000, 0, CAST(N'2021-04-23T11:40:01.887' AS DateTime), 11, NULL, NULL)
INSERT [dbo].[Bills] ([bill_id], [user_id], [bill_datecreate], [bill_sum], [bill_active], [bill_dealine], [pakege_id], [bill_key], [bill_orderid]) VALUES (14, 1010, CAST(N'2021-04-23T11:41:26.557' AS DateTime), 16600, 1, CAST(N'2021-05-23T11:41:26.557' AS DateTime), 13, NULL, NULL)
INSERT [dbo].[Bills] ([bill_id], [user_id], [bill_datecreate], [bill_sum], [bill_active], [bill_dealine], [pakege_id], [bill_key], [bill_orderid]) VALUES (15, 1011, CAST(N'2021-04-23T11:42:46.873' AS DateTime), 12000, 1, CAST(N'2022-04-23T11:42:46.873' AS DateTime), 10, N'20b1c414-2316-4ab0-a223-d34b12194544', N'f39e845e-a6b1-4796-91b9-19eadbe92c80')
INSERT [dbo].[Bills] ([bill_id], [user_id], [bill_datecreate], [bill_sum], [bill_active], [bill_dealine], [pakege_id], [bill_key], [bill_orderid]) VALUES (16, 1010, CAST(N'2021-04-23T11:46:10.800' AS DateTime), 14000, 1, CAST(N'2021-05-23T11:46:10.800' AS DateTime), 11, NULL, NULL)
INSERT [dbo].[Bills] ([bill_id], [user_id], [bill_datecreate], [bill_sum], [bill_active], [bill_dealine], [pakege_id], [bill_key], [bill_orderid]) VALUES (17, 1010, CAST(N'2021-04-23T11:46:11.263' AS DateTime), 14000, 1, CAST(N'2021-05-23T11:46:11.263' AS DateTime), 11, NULL, NULL)
INSERT [dbo].[Bills] ([bill_id], [user_id], [bill_datecreate], [bill_sum], [bill_active], [bill_dealine], [pakege_id], [bill_key], [bill_orderid]) VALUES (18, 1010, CAST(N'2021-04-23T11:47:59.197' AS DateTime), 15800, 1, CAST(N'2021-05-23T11:47:59.197' AS DateTime), 12, NULL, NULL)
INSERT [dbo].[Bills] ([bill_id], [user_id], [bill_datecreate], [bill_sum], [bill_active], [bill_dealine], [pakege_id], [bill_key], [bill_orderid]) VALUES (19, 1010, CAST(N'2021-04-23T11:47:59.700' AS DateTime), 15800, 1, CAST(N'2021-05-23T11:47:59.700' AS DateTime), 12, NULL, NULL)
INSERT [dbo].[Bills] ([bill_id], [user_id], [bill_datecreate], [bill_sum], [bill_active], [bill_dealine], [pakege_id], [bill_key], [bill_orderid]) VALUES (20, 1010, CAST(N'2021-04-23T11:50:05.527' AS DateTime), 15800, 1, CAST(N'2021-05-23T11:50:05.527' AS DateTime), 12, NULL, NULL)
INSERT [dbo].[Bills] ([bill_id], [user_id], [bill_datecreate], [bill_sum], [bill_active], [bill_dealine], [pakege_id], [bill_key], [bill_orderid]) VALUES (21, 1010, CAST(N'2021-04-23T11:50:05.993' AS DateTime), 15800, 1, CAST(N'2021-05-23T11:50:05.993' AS DateTime), 12, NULL, NULL)
INSERT [dbo].[Bills] ([bill_id], [user_id], [bill_datecreate], [bill_sum], [bill_active], [bill_dealine], [pakege_id], [bill_key], [bill_orderid]) VALUES (22, 1012, CAST(N'2021-04-23T12:59:55.087' AS DateTime), 14200, 1, CAST(N'2021-05-23T12:59:55.087' AS DateTime), 14, NULL, NULL)
INSERT [dbo].[Bills] ([bill_id], [user_id], [bill_datecreate], [bill_sum], [bill_active], [bill_dealine], [pakege_id], [bill_key], [bill_orderid]) VALUES (23, 1012, CAST(N'2021-04-23T12:59:55.593' AS DateTime), 14200, 1, CAST(N'2021-05-23T12:59:55.593' AS DateTime), 14, NULL, NULL)
INSERT [dbo].[Bills] ([bill_id], [user_id], [bill_datecreate], [bill_sum], [bill_active], [bill_dealine], [pakege_id], [bill_key], [bill_orderid]) VALUES (24, 1013, CAST(N'2021-04-23T13:14:53.900' AS DateTime), 16600, 1, CAST(N'2021-05-23T13:14:53.903' AS DateTime), 13, NULL, NULL)
INSERT [dbo].[Bills] ([bill_id], [user_id], [bill_datecreate], [bill_sum], [bill_active], [bill_dealine], [pakege_id], [bill_key], [bill_orderid]) VALUES (25, 1014, CAST(N'2021-04-23T13:31:32.250' AS DateTime), 14200, 1, CAST(N'2021-05-23T13:31:32.250' AS DateTime), 14, NULL, NULL)
INSERT [dbo].[Bills] ([bill_id], [user_id], [bill_datecreate], [bill_sum], [bill_active], [bill_dealine], [pakege_id], [bill_key], [bill_orderid]) VALUES (26, 1014, CAST(N'2021-04-23T13:31:32.757' AS DateTime), 14200, 1, CAST(N'2021-05-23T13:31:32.757' AS DateTime), 14, NULL, NULL)
INSERT [dbo].[Bills] ([bill_id], [user_id], [bill_datecreate], [bill_sum], [bill_active], [bill_dealine], [pakege_id], [bill_key], [bill_orderid]) VALUES (27, 1015, CAST(N'2021-04-23T13:40:16.930' AS DateTime), 16600, 1, CAST(N'2021-05-23T13:40:16.930' AS DateTime), 13, NULL, NULL)
INSERT [dbo].[Bills] ([bill_id], [user_id], [bill_datecreate], [bill_sum], [bill_active], [bill_dealine], [pakege_id], [bill_key], [bill_orderid]) VALUES (28, 1015, CAST(N'2021-04-23T13:40:17.427' AS DateTime), 16600, 1, CAST(N'2021-05-23T13:40:17.427' AS DateTime), 13, NULL, NULL)
INSERT [dbo].[Bills] ([bill_id], [user_id], [bill_datecreate], [bill_sum], [bill_active], [bill_dealine], [pakege_id], [bill_key], [bill_orderid]) VALUES (29, 1016, CAST(N'2021-04-23T13:47:12.853' AS DateTime), 14200, 1, CAST(N'2021-05-23T13:47:12.853' AS DateTime), 14, NULL, NULL)
INSERT [dbo].[Bills] ([bill_id], [user_id], [bill_datecreate], [bill_sum], [bill_active], [bill_dealine], [pakege_id], [bill_key], [bill_orderid]) VALUES (30, 1016, CAST(N'2021-04-23T13:47:13.353' AS DateTime), 14200, 1, CAST(N'2021-05-23T13:47:13.353' AS DateTime), 14, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Bills] OFF
GO
SET IDENTITY_INSERT [dbo].[Categorys] ON 

INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (1, N'Bán hàng kỹ thuật', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (2, N'Bán hàng', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (3, N'Bán lẻ/Bán sỉ', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (4, N'Bảo hiểm', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (5, N'Bảo trì/sửa chữa', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (6, N'Bất động sản', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (7, N'Biên phiên dịch', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (8, N'Cấp quản lý điều hành', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (9, N'Chứng khoán', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (10, N'Cơ khí', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (11, N'Công nghệ cao', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (12, N'Dầu khí', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (13, N'Dệt may/Da giày', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (14, N'Dịch vụ khách hàng', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (15, N'Dược phẩm/Công nghệ sinh học', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (16, N'Dược sĩ', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (17, N'Giáo dục/Đào tạo', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (18, N'Hàng cao cấp', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (19, N'Hàng gia dụng', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (20, N'Hàng hải', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (21, N'Hàng không/Du lịch', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (22, N'Hàng tiêu dùng', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (23, N'Hành chánh/Thư ký', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (24, N'Hóa học/Sinh học', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (25, N'Hoạch đinh/Dự án', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (26, N'In ấn/Xuất bản', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (27, N'Internet/Online Media', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (28, N'IT-Phần mềm', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (29, N'IT-Phần cứng/ Mạng', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (30, N'Kế toán', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (31, N'Khác', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (32, N'Kho vận', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (33, N'Kiểm toán', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (34, N'Kiến trúc / Thiết kế nội thất', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (35, N'Marketing', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (36, N'Mới tốt nghiệp', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (37, N'Môi trường / Xử lý rác thải', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (38, N'Mỹ thuật / Nghệ thuật / Thiết kế', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (39, N'Ngân hàng', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (40, N'Người nước ngoài / Việt kiều', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (41, N'Nhà hàng/ Khách sạn', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (42, N'Nhân sự', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (43, N'Nông nghiệp / Lâm nghiệp', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (44, N'Kinh doanh', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (45, N'Thư ký / Trợ lý', NULL)
INSERT [dbo].[Categorys] ([cate_id], [cate_name], [cate_view]) VALUES (46, N'Xây dựng', NULL)
SET IDENTITY_INSERT [dbo].[Categorys] OFF
GO
SET IDENTITY_INSERT [dbo].[Chats] ON 

INSERT [dbo].[Chats] ([chat_id], [chat_sender], [chat_receiver], [chat_content], [chat_datecreate], [chat_color], [chat_key], [chat_active]) VALUES (4, 4, 1006, N'chào', CAST(N'2021-04-11T10:05:18.520' AS DateTime), NULL, N'4key1006asal@keyuynhm', 0)
INSERT [dbo].[Chats] ([chat_id], [chat_sender], [chat_receiver], [chat_content], [chat_datecreate], [chat_color], [chat_key], [chat_active]) VALUES (5, 4, 1006, N'2', CAST(N'2021-04-11T10:05:57.653' AS DateTime), NULL, N'4key1006asal@keyuynhm', 0)
INSERT [dbo].[Chats] ([chat_id], [chat_sender], [chat_receiver], [chat_content], [chat_datecreate], [chat_color], [chat_key], [chat_active]) VALUES (6, 4, 1006, N'chào bạn', CAST(N'2021-04-11T10:07:34.293' AS DateTime), NULL, N'4key1006asal@keyuynhm', 1)
INSERT [dbo].[Chats] ([chat_id], [chat_sender], [chat_receiver], [chat_content], [chat_datecreate], [chat_color], [chat_key], [chat_active]) VALUES (8, 4, 1006, N'chào', CAST(N'2021-04-11T10:18:38.280' AS DateTime), NULL, N'4key1006asal@keyuynhm', 1)
INSERT [dbo].[Chats] ([chat_id], [chat_sender], [chat_receiver], [chat_content], [chat_datecreate], [chat_color], [chat_key], [chat_active]) VALUES (9, 4, 1006, N'Alo', CAST(N'2021-04-11T10:18:40.640' AS DateTime), NULL, N'4key1006asal@keyuynhm', 1)
INSERT [dbo].[Chats] ([chat_id], [chat_sender], [chat_receiver], [chat_content], [chat_datecreate], [chat_color], [chat_key], [chat_active]) VALUES (10, 4, 1006, N'@@', CAST(N'2021-04-11T12:42:27.523' AS DateTime), NULL, N'4key1006asal@keyuynhm', 0)
INSERT [dbo].[Chats] ([chat_id], [chat_sender], [chat_receiver], [chat_content], [chat_datecreate], [chat_color], [chat_key], [chat_active]) VALUES (11, 2, 1006, N'h', CAST(N'2021-04-12T18:44:49.890' AS DateTime), NULL, N'2key1006uynhmkeyuynhm', 0)
SET IDENTITY_INSERT [dbo].[Chats] OFF
GO
SET IDENTITY_INSERT [dbo].[Cvs] ON 

INSERT [dbo].[Cvs] ([cv_id], [cv_img], [cv_location], [cv_datebirth], [cv_sex], [cv_website], [cv_target], [cv_interest], [cv_informatin], [cv_referenceperson], [cv_title], [cv_email], [cv_phone], [cv_fullname], [cv_active], [cv_option], [cv_bin], [cv_datecreate], [cv_dateupdate], [cv_fakeid], [cv_fontsize], [cv_bg], [cv_p], [cv_view], [cv_point], [cv_deadline], [user_id], [theme_id], [cv_addpress], [cv_f]) VALUES (4, N'674f81a0-b6c7-4788-8849-bfc6eaf2e29fcong-ty-co-phan-dau-tu-giao-duc-va-phat-trien-nguon-luc-quoc-te-pasal-5ad4093c6754b_rs.jpg', N'Backend C#', N'27/12/1999', N'Nam', N'http://fb.com/nguyenvana', N'Áp dụng những kinh nghiệm về kỹ năng bán hàng và sự hiểu biết về thị trường để trở thành một nhân viên bán hàng chuyên nghiệp, mang đến nhiều giá trị cho khách hàng. Từ đó giúp Công ty tăng số lượng khách hàng và mở rộng tập khách hàng.', N'Đọc sách - Mỗi tháng đọc 1 quyển sách về kinh doanh.
Đá bóng - Tham gia hoạt động đá bóng của công ty hàng tuần', N'Điền các thông tin khác (nếu có)', N'Anh... - Trưởng phòng Marketing
Công ty QuickJon
Điện thoại:...', N'Huỳnh Minh Tấn a033a8', N'huynhminhtan4019@gmail.com', N'0924404019', N'Huỳnh Minh Tấn', 1, 1, 0, CAST(N'2021-04-15T18:40:41.953' AS DateTime), CAST(N'2021-04-15T18:40:41.953' AS DateTime), N'a033a888-b343-4ffa-af54-45a1700da3ce1', 15, N'den', 1, 1, 99, CAST(N'2021-05-15T18:40:41.953' AS DateTime), 1, 1, N'25/5 Hiệp An', N'on')
INSERT [dbo].[Cvs] ([cv_id], [cv_img], [cv_location], [cv_datebirth], [cv_sex], [cv_website], [cv_target], [cv_interest], [cv_informatin], [cv_referenceperson], [cv_title], [cv_email], [cv_phone], [cv_fullname], [cv_active], [cv_option], [cv_bin], [cv_datecreate], [cv_dateupdate], [cv_fakeid], [cv_fontsize], [cv_bg], [cv_p], [cv_view], [cv_point], [cv_deadline], [user_id], [theme_id], [cv_addpress], [cv_f]) VALUES (6, N'3d23c59e-3972-4605-b98c-ed1c98853a9732644928_2062295167425734_7686714948314988544_n.jpg', N'Backend c#', N'27/12/1999', N'Nam', N'http://fb.com/nguyenvana', N'Áp dụng những kinh nghiệm về kỹ năng bán hàng và sự hiểu biết về thị trường để trở thành một nhân viên bán hàng chuyên nghiệp, mang đến nhiều giá trị cho khách hàng. Từ đó giúp Công ty tăng số lượng khách hàng và mở rộng tập khách hàng.', N'Đọc sách - Mỗi tháng đọc 1 quyển sách về kinh doanh.
Đá bóng - Tham gia hoạt động đá bóng của công ty hàng tuần', N'Điền các thông tin khác (nếu có)', N'Anh... - Trưởng phòng Marketing
Công ty QuickJon
Điện thoại:...', N'Huỳnh Minh Tấn 7ceaaf', N'huynhminhtan4019@gmail.com', N'0924404019', N'Huỳnh Minh Tấn', 1, 1, 0, CAST(N'2021-04-10T16:38:06.037' AS DateTime), CAST(N'2021-04-10T16:38:06.037' AS DateTime), N'7ceaafce-d916-4929-82bc-90f747b4732a1', 15, N'den', 1, 1, 78, CAST(N'2021-05-10T16:38:06.037' AS DateTime), 5, 1, N'25/5 Hiệp An', N'on')
INSERT [dbo].[Cvs] ([cv_id], [cv_img], [cv_location], [cv_datebirth], [cv_sex], [cv_website], [cv_target], [cv_interest], [cv_informatin], [cv_referenceperson], [cv_title], [cv_email], [cv_phone], [cv_fullname], [cv_active], [cv_option], [cv_bin], [cv_datecreate], [cv_dateupdate], [cv_fakeid], [cv_fontsize], [cv_bg], [cv_p], [cv_view], [cv_point], [cv_deadline], [user_id], [theme_id], [cv_addpress], [cv_f]) VALUES (7, N'e06783f5-8003-4201-8311-895d63b8319c32644928_2062295167425734_7686714948314988544_n.jpg', N'Code java', N'27/12/1999', N'Nam', N'http://fb.com/nguyenvana', N'Áp dụng những kinh nghiệm về kỹ năng bán hàng và sự hiểu biết về thị trường để trở thành một nhân viên bán hàng chuyên nghiệp, mang đến nhiều giá trị cho khách hàng. Từ đó giúp Công ty tăng số lượng khách hàng và mở rộng tập khách hàng.', N'Đọc sách - Mỗi tháng đọc 1 quyển sách về kinh doanh.
Đá bóng - Tham gia hoạt động đá bóng của công ty hàng tuần', N'Điền các thông tin khác (nếu có)', N'Anh... - Trưởng phòng Marketing
Công ty QuickJon
Điện thoại:...', N'Huỳnh Minh Tấn e5a73d', N'huynhminhtan4019@gmail.com', N'0924404019', N'Huỳnh Minh Tấn', 1, 1, 0, CAST(N'2021-04-10T17:33:26.330' AS DateTime), CAST(N'2021-04-10T17:33:26.330' AS DateTime), N'e5a73ddb-e112-49f3-8acf-9075d09d8bcc1', 18, N'den', 1, 1, 92, CAST(N'2021-05-10T17:33:26.330' AS DateTime), 6, 1, N'25/5 Hiệp An', N'on')
INSERT [dbo].[Cvs] ([cv_id], [cv_img], [cv_location], [cv_datebirth], [cv_sex], [cv_website], [cv_target], [cv_interest], [cv_informatin], [cv_referenceperson], [cv_title], [cv_email], [cv_phone], [cv_fullname], [cv_active], [cv_option], [cv_bin], [cv_datecreate], [cv_dateupdate], [cv_fakeid], [cv_fontsize], [cv_bg], [cv_p], [cv_view], [cv_point], [cv_deadline], [user_id], [theme_id], [cv_addpress], [cv_f]) VALUES (1007, N'40b72b55-44e1-4b9c-a35a-090abf5b832232644928_2062295167425734_7686714948314988544_n.jpg', N'Code java', N'27/12/1999', N'Nam', N'http://fb.com/nguyenvana', N'Áp dụng những kinh nghiệm về kỹ năng bán hàng và sự hiểu biết về thị trường để trở thành một nhân viên bán hàng chuyên nghiệp, mang đến nhiều giá trị cho khách hàng. Từ đó giúp Công ty tăng số lượng khách hàng và mở rộng tập khách hàng.', N'Đọc sách - Mỗi tháng đọc 1 quyển sách về kinh doanh.
Đá bóng - Tham gia hoạt động đá bóng của công ty hàng tuần', N'Điền các thông tin khác (nếu có)', N'Anh... - Trưởng phòng Marketing
Công ty QuickJon
Điện thoại:...', N'Huỳnh Minh Tấn 2cc099', N'huynhminhtan4019@gmail.com', N'0924404019', N'Huỳnh Minh Tấn', 1, 1, 0, CAST(N'2021-04-10T20:17:40.707' AS DateTime), CAST(N'2021-04-10T20:17:40.707' AS DateTime), N'2cc09924-a512-4117-a7c9-ca62d75df6171', 15, N'den', 1, 1, 52, CAST(N'2021-05-10T20:17:40.707' AS DateTime), 1006, 1, N'25/5 Hiệp An', N'on')
INSERT [dbo].[Cvs] ([cv_id], [cv_img], [cv_location], [cv_datebirth], [cv_sex], [cv_website], [cv_target], [cv_interest], [cv_informatin], [cv_referenceperson], [cv_title], [cv_email], [cv_phone], [cv_fullname], [cv_active], [cv_option], [cv_bin], [cv_datecreate], [cv_dateupdate], [cv_fakeid], [cv_fontsize], [cv_bg], [cv_p], [cv_view], [cv_point], [cv_deadline], [user_id], [theme_id], [cv_addpress], [cv_f]) VALUES (1014, N'86e72a4d-1b5c-463c-a935-0270b0e8c2ed32644928_2062295167425734_7686714948314988544_n.jpg', N'Backend C#', N'27/12/1999', N'Nam', N'http://fb.com/nguyenvana', N'Áp dụng những kinh nghiệm về kỹ năng bán hàng và sự hiểu biết về thị trường để trở thành một nhân viên bán hàng chuyên nghiệp, mang đến nhiều giá trị cho khách hàng. Từ đó giúp Công ty tăng số lượng khách hàng và mở rộng tập khách hàng.', N'Đọc sách - Mỗi tháng đọc 1 quyển sách về kinh doanh.
Đá bóng - Tham gia hoạt động đá bóng của công ty hàng tuần', N'Điền các thông tin khác (nếu có)', N'Anh... - Trưởng phòng Marketing
Công ty QuickJon
Điện thoại:...', N'Huỳnh Minh Tấn 6810e7', N'huynhminhtan4019@gmail.com', N'0924404019', N'Huỳnh Minh Tấn', 1, 1, 0, CAST(N'2021-04-15T23:44:30.240' AS DateTime), CAST(N'2021-04-15T23:44:30.240' AS DateTime), N'6810e701-57bc-42ae-97cd-00897477e6394', 15, N'darkcyan', 1, 1, 85, CAST(N'2021-05-15T23:44:30.240' AS DateTime), 1, 4, N'25/5 Hiệp An', N'Arial')
SET IDENTITY_INSERT [dbo].[Cvs] OFF
GO
SET IDENTITY_INSERT [dbo].[Exps] ON 

INSERT [dbo].[Exps] ([exp_id], [exp_name]) VALUES (1, N'Chưa có kinh nghiệm')
INSERT [dbo].[Exps] ([exp_id], [exp_name]) VALUES (2, N'Dưới 1 năm')
INSERT [dbo].[Exps] ([exp_id], [exp_name]) VALUES (3, N'1 năm')
INSERT [dbo].[Exps] ([exp_id], [exp_name]) VALUES (4, N'2 năm')
INSERT [dbo].[Exps] ([exp_id], [exp_name]) VALUES (5, N'3 năm')
INSERT [dbo].[Exps] ([exp_id], [exp_name]) VALUES (6, N'4 năm')
INSERT [dbo].[Exps] ([exp_id], [exp_name]) VALUES (7, N'Trên 5 năm')
SET IDENTITY_INSERT [dbo].[Exps] OFF
GO
SET IDENTITY_INSERT [dbo].[Groups] ON 

INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (1, 2, 5, CAST(N'2021-04-08T21:56:49.527' AS DateTime), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (2, 2, 7, CAST(N'2021-04-08T21:56:49.557' AS DateTime), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (3, NULL, 1, CAST(N'2021-04-09T15:15:49.900' AS DateTime), 2, 1, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (4, NULL, NULL, CAST(N'2021-04-09T15:15:49.943' AS DateTime), 3, 1, 1, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (6, 4, 2, CAST(N'2021-04-09T17:27:50.313' AS DateTime), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (7, NULL, 2, CAST(N'2021-04-09T19:00:09.813' AS DateTime), 2, 2, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (8, NULL, 17, CAST(N'2021-04-09T19:00:09.853' AS DateTime), 2, 2, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (9, NULL, NULL, CAST(N'2021-04-09T19:00:09.857' AS DateTime), 3, 2, 24, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (10, NULL, 17, CAST(N'2021-04-15T14:40:18.273' AS DateTime), 2, 3, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (11, NULL, 35, CAST(N'2021-04-15T14:40:18.313' AS DateTime), 2, 3, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (12, NULL, NULL, CAST(N'2021-04-15T14:40:18.317' AS DateTime), 3, 3, 24, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (13, NULL, 17, CAST(N'2021-04-15T14:42:05.323' AS DateTime), 2, 4, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (14, NULL, NULL, CAST(N'2021-04-15T14:42:05.327' AS DateTime), 3, 4, 24, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (15, 1008, 2, CAST(N'2021-04-15T15:59:05.553' AS DateTime), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (16, 1008, 4, CAST(N'2021-04-15T15:59:05.567' AS DateTime), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (17, 1008, 39, CAST(N'2021-04-15T15:59:05.570' AS DateTime), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (18, NULL, 4, CAST(N'2021-04-15T16:32:14.433' AS DateTime), 2, 5, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (19, NULL, 39, CAST(N'2021-04-15T16:32:14.437' AS DateTime), 2, 5, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (20, NULL, NULL, CAST(N'2021-04-15T16:32:14.440' AS DateTime), 3, 5, 58, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (21, 1009, 42, CAST(N'2021-04-15T16:36:30.110' AS DateTime), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (22, 1009, 44, CAST(N'2021-04-15T16:36:30.113' AS DateTime), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (23, NULL, 11, CAST(N'2021-04-15T16:41:01.317' AS DateTime), 2, 6, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (24, NULL, 28, CAST(N'2021-04-15T16:41:01.323' AS DateTime), 2, 6, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (25, NULL, 35, CAST(N'2021-04-15T16:41:01.323' AS DateTime), 2, 6, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (26, NULL, NULL, CAST(N'2021-04-15T16:41:01.327' AS DateTime), 3, 6, 24, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (27, 1010, 7, CAST(N'2021-04-15T17:33:12.740' AS DateTime), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (28, 1010, 23, CAST(N'2021-04-15T17:33:12.747' AS DateTime), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (29, NULL, 7, CAST(N'2021-04-15T17:36:15.523' AS DateTime), 2, 7, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (30, NULL, NULL, CAST(N'2021-04-15T17:36:15.537' AS DateTime), 3, 7, 24, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (31, 1012, 8, CAST(N'2021-04-23T12:44:23.993' AS DateTime), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (32, 1012, 22, CAST(N'2021-04-23T12:44:24.010' AS DateTime), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (33, 1012, 32, CAST(N'2021-04-23T12:44:24.013' AS DateTime), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (34, NULL, 8, CAST(N'2021-04-23T12:52:42.560' AS DateTime), 2, 8, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (35, NULL, 22, CAST(N'2021-04-23T12:52:42.567' AS DateTime), 2, 8, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (36, NULL, 32, CAST(N'2021-04-23T12:52:42.567' AS DateTime), 2, 8, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (37, NULL, NULL, CAST(N'2021-04-23T12:52:42.570' AS DateTime), 3, 8, 58, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (38, 1013, 2, CAST(N'2021-04-23T13:12:01.933' AS DateTime), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (39, 1013, 44, CAST(N'2021-04-23T13:12:01.953' AS DateTime), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (40, NULL, 2, CAST(N'2021-04-23T13:18:34.827' AS DateTime), 2, 9, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (41, NULL, 23, CAST(N'2021-04-23T13:18:34.863' AS DateTime), 2, 9, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (42, NULL, 44, CAST(N'2021-04-23T13:18:34.863' AS DateTime), 2, 9, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (43, NULL, NULL, CAST(N'2021-04-23T13:18:34.867' AS DateTime), 3, 9, 24, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (44, 1014, 17, CAST(N'2021-04-23T13:25:17.473' AS DateTime), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (45, 1014, 23, CAST(N'2021-04-23T13:25:17.477' AS DateTime), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (46, 1014, 35, CAST(N'2021-04-23T13:25:17.480' AS DateTime), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (47, NULL, 14, CAST(N'2021-04-23T13:28:45.077' AS DateTime), 2, 10, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (48, NULL, 17, CAST(N'2021-04-23T13:28:45.083' AS DateTime), 2, 10, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (49, NULL, 23, CAST(N'2021-04-23T13:28:45.083' AS DateTime), 2, 10, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (50, NULL, NULL, CAST(N'2021-04-23T13:28:45.087' AS DateTime), 3, 10, 24, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (51, NULL, NULL, CAST(N'2021-04-23T13:28:45.090' AS DateTime), 3, 10, 58, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (52, 1015, 27, CAST(N'2021-04-23T13:34:47.883' AS DateTime), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (53, 1015, 28, CAST(N'2021-04-23T13:34:47.907' AS DateTime), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (54, NULL, 28, CAST(N'2021-04-23T13:39:25.387' AS DateTime), 2, 11, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (55, NULL, NULL, CAST(N'2021-04-23T13:39:25.390' AS DateTime), 3, 11, 24, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (56, 1016, 44, CAST(N'2021-04-23T13:44:05.400' AS DateTime), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (57, 1016, 45, CAST(N'2021-04-23T13:44:05.417' AS DateTime), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (58, NULL, 14, CAST(N'2021-04-23T13:46:23.580' AS DateTime), 2, 12, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (59, NULL, 44, CAST(N'2021-04-23T13:46:23.587' AS DateTime), 2, 12, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (60, NULL, NULL, CAST(N'2021-04-23T13:46:23.587' AS DateTime), 3, 12, 9, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (78, 1, NULL, CAST(N'2021-04-23T20:25:12.327' AS DateTime), 5, 12, NULL, NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [user_id], [category_id], [datecreate], [group_item], [job_id], [provice_id], [email], [skill]) VALUES (80, 1, NULL, CAST(N'2021-04-23T20:29:12.967' AS DateTime), 5, 3, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Groups] OFF
GO
SET IDENTITY_INSERT [dbo].[ItemCvs] ON 

INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (24, N'Đại học QuickJob', N'Chuyên ngành: Quản trị Doanh nghiệp', N'Tốt nghiệp loại Giỏi, điểm trung bình 8.0', NULL, 1, 1, 1, N'05/2014', N'10/2010', N'a033a888-b343-4ffa-af54-45a1700da3ce1')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (25, N'Công ty QuickJob', N'Nhân viên bán hàng', N'- Hỗ trợ viết bài quảng cáo sản phẩm qua kênh facebook, các forum,... 
 - Giới thiệu, tư vấn sản phẩm, giải đáp các vấn đề thắc mắc của khách hàng qua điện thoại và email.', NULL, 1, 1, 2, N'05/2014', N'10/2010', N'a033a888-b343-4ffa-af54-45a1700da3ce1')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (26, N'Nhóm tình nguyện QuickJob', N'Tình nguyện viên', N'Tập hợp các món quà và phân phát tới người vô gia cư. 
 - Chia sẻ, động viên họ vượt qua giai đoạn khó khăn, giúp họ có những suy nghĩ lạc quan.', NULL, 1, 1, 3, N'05/2014', N'10/2010', N'a033a888-b343-4ffa-af54-45a1700da3ce1')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (27, N'Giải nhất tài năng QuickJob 2017', NULL, NULL, NULL, 1, 1, 4, N'2017', NULL, N'a033a888-b343-4ffa-af54-45a1700da3ce1')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (28, N'Nhân viên xuất sắc năm công ty QuickJob', NULL, NULL, NULL, 1, 1, 5, N'2017', NULL, N'a033a888-b343-4ffa-af54-45a1700da3ce1')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (29, N'Tin học văn phòng QuickJob', N'Sử dụng thành thạo các công cụ Word, Excel, Power Point', NULL, NULL, 1, 1, 6, N'', NULL, N'a033a888-b343-4ffa-af54-45a1700da3ce1')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (30, N'Tin học văn phòng QuickJob', N'Sử dụng thành thạo các công cụ Word, Excel, Power Point', NULL, NULL, 1, 1, 6, N'', NULL, N'a033a888-b343-4ffa-af54-45a1700da3ce1')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (38, N'Đại học QuickJob', N'Chuyên ngành: Quản trị Doanh nghiệp', N'Tốt nghiệp loại Giỏi, điểm trung bình 8.0', NULL, 1, 5, 1, N'05/2014', N'10/2010', N'7ceaafce-d916-4929-82bc-90f747b4732a1')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (39, N'Công ty QuickJob', N'Nhân viên bán hàng', N'- Hỗ trợ viết bài quảng cáo sản phẩm qua kênh facebook, các forum,... 
 - Giới thiệu, tư vấn sản phẩm, giải đáp các vấn đề thắc mắc của khách hàng qua điện thoại và email.', NULL, 1, 5, 2, N'05/2014', N'10/2010', N'7ceaafce-d916-4929-82bc-90f747b4732a1')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (40, N'Nhóm tình nguyện QuickJob', N'Tình nguyện viên', N'Tập hợp các món quà và phân phát tới người vô gia cư. 
 - Chia sẻ, động viên họ vượt qua giai đoạn khó khăn, giúp họ có những suy nghĩ lạc quan.', NULL, 1, 5, 3, N'05/2014', N'10/2010', N'7ceaafce-d916-4929-82bc-90f747b4732a1')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (41, N'Giải nhất tài năng QuickJob 2017', NULL, NULL, NULL, 1, 5, 4, N'2017', NULL, N'7ceaafce-d916-4929-82bc-90f747b4732a1')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (42, N'Nhân viên xuất sắc năm công ty QuickJob', NULL, NULL, NULL, 1, 5, 5, N'2017', NULL, N'7ceaafce-d916-4929-82bc-90f747b4732a1')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (43, N'Tin học văn phòng QuickJob', N'Sử dụng thành thạo các công cụ Word, Excel, Power Point', NULL, NULL, 1, 5, 6, N'', NULL, N'7ceaafce-d916-4929-82bc-90f747b4732a1')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (44, N'Tin học văn phòng QuickJob', N'Sử dụng thành thạo các công cụ Word, Excel, Power Point', NULL, NULL, 1, 5, 6, N'', NULL, N'7ceaafce-d916-4929-82bc-90f747b4732a1')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (45, N'Nhân viên xuất sắc năm công ty QuickJob 2', N'NULL', N'NULL', NULL, 1, 5, 5, N'2017', N'NULL', N'7ceaafce-d916-4929-82bc-90f747b4732a1')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (46, N'Đại học QuickJob', N'Chuyên ngành: Quản trị Doanh nghiệp', N'Tốt nghiệp loại Giỏi, điểm trung bình 8.0', NULL, 1, 6, 1, N'05/2014', N'10/2010', N'e5a73ddb-e112-49f3-8acf-9075d09d8bcc1')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (47, N'Công ty QuickJob', N'Nhân viên bán hàng', N'- Hỗ trợ viết bài quảng cáo sản phẩm qua kênh facebook, các forum,... 
 - Giới thiệu, tư vấn sản phẩm, giải đáp các vấn đề thắc mắc của khách hàng qua điện thoại và email.', NULL, 1, 6, 2, N'05/2014', N'10/2010', N'e5a73ddb-e112-49f3-8acf-9075d09d8bcc1')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (48, N'Nhóm tình nguyện QuickJob', N'Tình nguyện viên', N'Tập hợp các món quà và phân phát tới người vô gia cư. 
 - Chia sẻ, động viên họ vượt qua giai đoạn khó khăn, giúp họ có những suy nghĩ lạc quan.', NULL, 1, 6, 3, N'05/2014', N'10/2010', N'e5a73ddb-e112-49f3-8acf-9075d09d8bcc1')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (49, N'Giải nhất tài năng QuickJob 2017', NULL, NULL, NULL, 1, 6, 4, N'2017', NULL, N'e5a73ddb-e112-49f3-8acf-9075d09d8bcc1')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (50, N'Nhân viên xuất sắc năm công ty QuickJob', NULL, NULL, NULL, 1, 6, 5, N'2017', NULL, N'e5a73ddb-e112-49f3-8acf-9075d09d8bcc1')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (51, N'Tin học văn phòng QuickJob', N'Sử dụng thành thạo các công cụ Word, Excel, Power Point', NULL, NULL, 1, 6, 6, N'', NULL, N'e5a73ddb-e112-49f3-8acf-9075d09d8bcc1')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (52, N'Tin học văn phòng QuickJob', N'Sử dụng thành thạo các công cụ Word, Excel, Power Point', NULL, NULL, 1, 6, 6, N'', NULL, N'e5a73ddb-e112-49f3-8acf-9075d09d8bcc1')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1046, N'Đại học QuickJob', N'Chuyên ngành: Quản trị Doanh nghiệp', N'Tốt nghiệp loại Giỏi, điểm trung bình 8.0', NULL, 1, 1006, 1, N'05/2014', N'10/2010', N'2cc09924-a512-4117-a7c9-ca62d75df6171')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1047, N'Công ty QuickJob', N'Nhân viên bán hàng', N'- Hỗ trợ viết bài quảng cáo sản phẩm qua kênh facebook, các forum,... 
 - Giới thiệu, tư vấn sản phẩm, giải đáp các vấn đề thắc mắc của khách hàng qua điện thoại và email.', NULL, 1, 1006, 2, N'05/2014', N'10/2010', N'2cc09924-a512-4117-a7c9-ca62d75df6171')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1048, N'Nhóm tình nguyện QuickJob', N'Tình nguyện viên', N'Tập hợp các món quà và phân phát tới người vô gia cư. 
 - Chia sẻ, động viên họ vượt qua giai đoạn khó khăn, giúp họ có những suy nghĩ lạc quan.', NULL, 1, 1006, 3, N'05/2014', N'10/2010', N'2cc09924-a512-4117-a7c9-ca62d75df6171')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1049, N'Giải nhất tài năng QuickJob 2017', NULL, NULL, NULL, 1, 1006, 4, N'2017', NULL, N'2cc09924-a512-4117-a7c9-ca62d75df6171')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1050, N'Nhân viên xuất sắc năm công ty QuickJob', NULL, NULL, NULL, 1, 1006, 5, N'2017', NULL, N'2cc09924-a512-4117-a7c9-ca62d75df6171')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1051, N'Tin học văn phòng QuickJob', N'Sử dụng thành thạo các công cụ Word, Excel, Power Point', NULL, NULL, 1, 1006, 6, N'', NULL, N'2cc09924-a512-4117-a7c9-ca62d75df6171')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1052, N'Tin học văn phòng QuickJob', N'Sử dụng thành thạo các công cụ Word, Excel, Power Point', NULL, NULL, 1, 1006, 6, N'', NULL, N'2cc09924-a512-4117-a7c9-ca62d75df6171')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1060, N'Đại học QuickJob', N'Chuyên ngành: Quản trị Doanh nghiệp', N'Tốt nghiệp loại Giỏi, điểm trung bình 8.0', NULL, 2, 1, 1, N'05/2014', N'10/2010', N'5017c8c1-eaa3-47e7-a500-009b862d22ec2')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1061, N'Công ty QuickJob', N'Nhân viên bán hàng', N'- Hỗ trợ viết bài quảng cáo sản phẩm qua kênh facebook, các forum,... 
 - Giới thiệu, tư vấn sản phẩm, giải đáp các vấn đề thắc mắc của khách hàng qua điện thoại và email.', NULL, 2, 1, 2, N'05/2014', N'10/2010', N'5017c8c1-eaa3-47e7-a500-009b862d22ec2')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1062, N'Nhóm tình nguyện QuickJob', N'Tình nguyện viên', N'Tập hợp các món quà và phân phát tới người vô gia cư. 
 - Chia sẻ, động viên họ vượt qua giai đoạn khó khăn, giúp họ có những suy nghĩ lạc quan.', NULL, 2, 1, 3, N'05/2014', N'10/2010', N'5017c8c1-eaa3-47e7-a500-009b862d22ec2')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1063, N'Giải nhất tài năng QuickJob 2017', NULL, NULL, NULL, 2, 1, 4, N'2017', NULL, N'5017c8c1-eaa3-47e7-a500-009b862d22ec2')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1064, N'Nhân viên xuất sắc năm công ty QuickJob', NULL, NULL, NULL, 2, 1, 5, N'2017', NULL, N'5017c8c1-eaa3-47e7-a500-009b862d22ec2')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1065, N'Tin học văn phòng QuickJob', N'Sử dụng thành thạo các công cụ Word, Excel, Power Point', NULL, NULL, 2, 1, 6, N'', NULL, N'5017c8c1-eaa3-47e7-a500-009b862d22ec2')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1066, N'Tin học văn phòng QuickJob', N'Sử dụng thành thạo các công cụ Word, Excel, Power Point', NULL, NULL, 2, 1, 6, N'', NULL, N'5017c8c1-eaa3-47e7-a500-009b862d22ec2')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1069, N'Đại học QuickJob', N'Chuyên ngành: Quản trị Doanh nghiệp', N'Tốt nghiệp loại Giỏi, điểm trung bình 8.0', NULL, 3, 1, 1, N'05/2014', N'10/2010', N'960e0f35-a5fd-4f26-8708-7f3332607cb73')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1070, N'Công ty QuickJob', N'Nhân viên bán hàng', N'- Hỗ trợ viết bài quảng cáo sản phẩm qua kênh facebook, các forum,... 
 - Giới thiệu, tư vấn sản phẩm, giải đáp các vấn đề thắc mắc của khách hàng qua điện thoại và email.', NULL, 3, 1, 2, N'05/2014', N'10/2010', N'960e0f35-a5fd-4f26-8708-7f3332607cb73')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1071, N'Nhóm tình nguyện QuickJob', N'Tình nguyện viên', N'Tập hợp các món quà và phân phát tới người vô gia cư. 
 - Chia sẻ, động viên họ vượt qua giai đoạn khó khăn, giúp họ có những suy nghĩ lạc quan.', NULL, 3, 1, 3, N'05/2014', N'10/2010', N'960e0f35-a5fd-4f26-8708-7f3332607cb73')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1072, N'Giải nhất tài năng QuickJob 2017', NULL, NULL, NULL, 3, 1, 4, N'2017', NULL, N'960e0f35-a5fd-4f26-8708-7f3332607cb73')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1073, N'Nhân viên xuất sắc năm công ty QuickJob', NULL, NULL, NULL, 3, 1, 5, N'2017', NULL, N'960e0f35-a5fd-4f26-8708-7f3332607cb73')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1074, N'Tin học văn phòng QuickJob', N'Sử dụng thành thạo các công cụ Word, Excel, Power Point', NULL, NULL, 3, 1, 6, N'', NULL, N'960e0f35-a5fd-4f26-8708-7f3332607cb73')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1075, N'Tin học văn phòng QuickJob', N'Sử dụng thành thạo các công cụ Word, Excel, Power Point', NULL, NULL, 3, 1, 6, N'', NULL, N'960e0f35-a5fd-4f26-8708-7f3332607cb73')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1076, N'Đại học QuickJob', N'Chuyên ngành: Quản trị Doanh nghiệp', N'Tốt nghiệp loại Giỏi, điểm trung bình 8.0', NULL, 4, 1, 1, N'05/2014', N'10/2010', N'958cc142-2b11-4dc0-a1b0-518ecbeaf17c4')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1077, N'Công ty QuickJob', N'Nhân viên bán hàng', N'- Hỗ trợ viết bài quảng cáo sản phẩm qua kênh facebook, các forum,... 
 - Giới thiệu, tư vấn sản phẩm, giải đáp các vấn đề thắc mắc của khách hàng qua điện thoại và email.', NULL, 4, 1, 2, N'05/2014', N'10/2010', N'958cc142-2b11-4dc0-a1b0-518ecbeaf17c4')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1078, N'Nhóm tình nguyện QuickJob', N'Tình nguyện viên', N'Tập hợp các món quà và phân phát tới người vô gia cư. 
 - Chia sẻ, động viên họ vượt qua giai đoạn khó khăn, giúp họ có những suy nghĩ lạc quan.', NULL, 4, 1, 3, N'05/2014', N'10/2010', N'958cc142-2b11-4dc0-a1b0-518ecbeaf17c4')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1079, N'Giải nhất tài năng QuickJob 2017', NULL, NULL, NULL, 4, 1, 4, N'2017', NULL, N'958cc142-2b11-4dc0-a1b0-518ecbeaf17c4')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1080, N'Nhân viên xuất sắc năm công ty QuickJob', NULL, NULL, NULL, 4, 1, 5, N'2017', NULL, N'958cc142-2b11-4dc0-a1b0-518ecbeaf17c4')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1081, N'Tin học văn phòng QuickJob', N'Sử dụng thành thạo các công cụ Word, Excel, Power Point', NULL, NULL, 4, 1, 6, N'', NULL, N'958cc142-2b11-4dc0-a1b0-518ecbeaf17c4')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1082, N'Tin học văn phòng QuickJob', N'Sử dụng thành thạo các công cụ Word, Excel, Power Point', NULL, NULL, 4, 1, 6, N'', NULL, N'958cc142-2b11-4dc0-a1b0-518ecbeaf17c4')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1084, N'Đại học QuickJob', N'Chuyên ngành: Quản trị Doanh nghiệp', N'Tốt nghiệp loại Giỏi, điểm trung bình 8.0', NULL, 5, 1, 1, N'05/2014', N'10/2010', N'c43ca7e4-62da-49f3-b24c-eb910a101be55')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1085, N'Công ty QuickJob', N'Nhân viên bán hàng', N'- Hỗ trợ viết bài quảng cáo sản phẩm qua kênh facebook, các forum,... 
 - Giới thiệu, tư vấn sản phẩm, giải đáp các vấn đề thắc mắc của khách hàng qua điện thoại và email.', NULL, 5, 1, 2, N'05/2014', N'10/2010', N'c43ca7e4-62da-49f3-b24c-eb910a101be55')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1086, N'Nhóm tình nguyện QuickJob', N'Tình nguyện viên', N'Tập hợp các món quà và phân phát tới người vô gia cư. 
 - Chia sẻ, động viên họ vượt qua giai đoạn khó khăn, giúp họ có những suy nghĩ lạc quan.', NULL, 5, 1, 3, N'05/2014', N'10/2010', N'c43ca7e4-62da-49f3-b24c-eb910a101be55')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1087, N'Giải nhất tài năng QuickJob 2017', NULL, NULL, NULL, 5, 1, 4, N'2017', NULL, N'c43ca7e4-62da-49f3-b24c-eb910a101be55')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1088, N'Nhân viên xuất sắc năm công ty QuickJob', NULL, NULL, NULL, 5, 1, 5, N'2017', NULL, N'c43ca7e4-62da-49f3-b24c-eb910a101be55')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1089, N'Tin học văn phòng QuickJob', N'Sử dụng thành thạo các công cụ Word, Excel, Power Point', NULL, NULL, 5, 1, 6, N'', NULL, N'c43ca7e4-62da-49f3-b24c-eb910a101be55')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1090, N'Tin học văn phòng QuickJob', N'Sử dụng thành thạo các công cụ Word, Excel, Power Point', NULL, NULL, 5, 1, 6, N'', NULL, N'c43ca7e4-62da-49f3-b24c-eb910a101be55')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1091, N'Đại học QuickJob', N'Chuyên ngành: Quản trị Doanh nghiệp', N'Tốt nghiệp loại Giỏi, điểm trung bình 8.0', NULL, 4, 1, 1, N'05/2014', N'10/2010', N'afee61dd-9026-41c0-9add-4fd28d0fd7ac4')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1092, N'Công ty QuickJob', N'Nhân viên bán hàng', N'- Hỗ trợ viết bài quảng cáo sản phẩm qua kênh facebook, các forum,... 
 - Giới thiệu, tư vấn sản phẩm, giải đáp các vấn đề thắc mắc của khách hàng qua điện thoại và email.', NULL, 4, 1, 2, N'05/2014', N'10/2010', N'afee61dd-9026-41c0-9add-4fd28d0fd7ac4')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1093, N'Nhóm tình nguyện QuickJob', N'Tình nguyện viên', N'Tập hợp các món quà và phân phát tới người vô gia cư. 
 - Chia sẻ, động viên họ vượt qua giai đoạn khó khăn, giúp họ có những suy nghĩ lạc quan.', NULL, 4, 1, 3, N'05/2014', N'10/2010', N'afee61dd-9026-41c0-9add-4fd28d0fd7ac4')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1094, N'Giải nhất tài năng QuickJob 2017', NULL, NULL, NULL, 4, 1, 4, N'2017', NULL, N'afee61dd-9026-41c0-9add-4fd28d0fd7ac4')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1095, N'Nhân viên xuất sắc năm công ty QuickJob', NULL, NULL, NULL, 4, 1, 5, N'2017', NULL, N'afee61dd-9026-41c0-9add-4fd28d0fd7ac4')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1096, N'Tin học văn phòng QuickJob', N'Sử dụng thành thạo các công cụ Word, Excel, Power Point', NULL, NULL, 4, 1, 6, N'', NULL, N'afee61dd-9026-41c0-9add-4fd28d0fd7ac4')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1097, N'Tin học văn phòng QuickJob', N'Sử dụng thành thạo các công cụ Word, Excel, Power Point', NULL, NULL, 4, 1, 6, N'', NULL, N'afee61dd-9026-41c0-9add-4fd28d0fd7ac4')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1098, N'Đại học QuickJob', N'Chuyên ngành: Quản trị Doanh nghiệp', N'Tốt nghiệp loại Giỏi, điểm trung bình 8.0', NULL, 4, 1, 1, N'05/2014', N'10/2010', N'6810e701-57bc-42ae-97cd-00897477e6394')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1099, N'Công ty QuickJob', N'Nhân viên bán hàng', N'- Hỗ trợ viết bài quảng cáo sản phẩm qua kênh facebook, các forum,... 
 - Giới thiệu, tư vấn sản phẩm, giải đáp các vấn đề thắc mắc của khách hàng qua điện thoại và email.', NULL, 4, 1, 2, N'05/2014', N'10/2010', N'6810e701-57bc-42ae-97cd-00897477e6394')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1100, N'Nhóm tình nguyện QuickJob', N'Tình nguyện viên', N'Tập hợp các món quà và phân phát tới người vô gia cư. 
 - Chia sẻ, động viên họ vượt qua giai đoạn khó khăn, giúp họ có những suy nghĩ lạc quan.', NULL, 4, 1, 3, N'05/2014', N'10/2010', N'6810e701-57bc-42ae-97cd-00897477e6394')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1101, N'Giải nhất tài năng QuickJob 2017', NULL, NULL, NULL, 4, 1, 4, N'2017', NULL, N'6810e701-57bc-42ae-97cd-00897477e6394')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1102, N'Nhân viên xuất sắc năm công ty QuickJob', NULL, NULL, NULL, 4, 1, 5, N'2017', NULL, N'6810e701-57bc-42ae-97cd-00897477e6394')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1103, N'Tin học văn phòng QuickJob', N'Sử dụng thành thạo các công cụ Word, Excel, Power Point', NULL, NULL, 4, 1, 6, N'', NULL, N'6810e701-57bc-42ae-97cd-00897477e6394')
INSERT [dbo].[ItemCvs] ([ic_id], [ic_name], [ic_mid], [ic_content], [ic_fakeid], [ic_theme_id], [ic_usid], [ic_stt], [ic_enddate], [ic_todate], [ic_fake]) VALUES (1104, N'Tin học văn phòng QuickJob', N'Sử dụng thành thạo các công cụ Word, Excel, Power Point', NULL, NULL, 4, 1, 6, N'', NULL, N'6810e701-57bc-42ae-97cd-00897477e6394')
SET IDENTITY_INSERT [dbo].[ItemCvs] OFF
GO
SET IDENTITY_INSERT [dbo].[Jobs] ON 

INSERT [dbo].[Jobs] ([job_id], [job_title], [job_addpress], [job_amout], [wp_id], [type_id], [job_sex], [exp_id], [job_payend], [job_paystart], [job_datedeline], [job_name], [job_phone], [job_describe], [job_request], [job_right], [job_active], [job_option], [job_datecreate], [job_dateupdate], [job_bin], [job_view], [user_id], [job_key], [job_textprice]) VALUES (1, N'FRESHER C/C++ DEVELOPER', N' ILA Nguyễn Văn Linh - Đà Nẵng', 0, 1, 1, 1, 1, N'2', N'1', CAST(N'2021-04-23T00:00:00.000' AS DateTime), N'Tấn Huỳnh', N'0924404019', N'<p>aasas</p>', N'<p>as</p>', N'<p>asa</p>', 0, 1, CAST(N'2021-04-09T15:15:49.627' AS DateTime), CAST(N'2021-04-09T15:15:49.627' AS DateTime), 0, 0, 2, N'c776ff78-e4d4-4588-a6a5-8033bedeeefd', N'Trong khoảng')
INSERT [dbo].[Jobs] ([job_id], [job_title], [job_addpress], [job_amout], [wp_id], [type_id], [job_sex], [exp_id], [job_payend], [job_paystart], [job_datedeline], [job_name], [job_phone], [job_describe], [job_request], [job_right], [job_active], [job_option], [job_datecreate], [job_dateupdate], [job_bin], [job_view], [user_id], [job_key], [job_textprice]) VALUES (2, N'CHUYÊN VIÊN TƯ VẤN GIÁO DỤC - LƯƠNG CỨNG 6 - 8 TRIỆU/THÁNG', N'Tầng 4, Số 346 đường Nguyễn Trãi, Thanh Xuân, Hà Nội', 3, 1, 1, NULL, 2, N'15', N'10', CAST(N'2021-04-29T00:00:00.000' AS DateTime), N'Huỳnh Minh Tấn', N'0924404019', N'<p>- Nhận Data từ bộ phân MKT để khai thác thông tin nhu cầu khách hàng từ đó tư vấn các khóa học phù hợp</p><p>- Khai thác, chăm sóc nguồn khách hàng mới và duy trì, phát triển đội ngũ khách hàng cũ thông qua các kênh online như zalo/sms/email.</p><p>- Phối hợp với các bộ phận liên quan tổ chức các buổi học thử; test demo, coaching &amp; làm các thủ tục hỗ trợ cho khách hàng trong quá trình khách hàng tham gia trải nghiệm sản phẩm.&nbsp;</p><p>- Chi tiết mô tả công việc được trao đổi trong quá trình phỏng vấn.</p>', N'<p>- Nam/ Nữ, độ tuổi từ 21- 30</p><p>- Có tối thiểu từ 06 tháng đến 01 năm kinh nghiệm công việc liên quan. Đắc biệt ưu tiên ứng viên có kinh nghiệm liên quan đến telesales/chăm sóc khách hàng/tư vấn - bán hàng trong lĩnh vực về tư vấn giáo dục/bất động sản/dịch vụ.&nbsp;</p><p>- Tác phong thanh lịch, khả năng giao tiếp tốt. Không nói ngọng hoặc giọng địa phương.&nbsp;&nbsp;</p><p>- Nhanh nhẹn, ý thức trách nhiệm cao .&nbsp;</p><p>- Thời gian làm việc 6 ngày/tuần. Luân phiên theo ca ( Gồm: 4 buổi ca sáng và 2 buổi ca chiều)&nbsp;</p><p>Ca Sáng (Từ 8:30 – 17:45)&nbsp;</p><p>Ca Chiều (1:30- 20:30.)</p><p>- Chủ động về phương tiện làm việc: laptop cá nhân. Chấp nhận sinh viên mới ra trường có kinh nghiệm làm việc partime 03-06 tháng tại các đơn vị liên quan đến telesale/bán hàng.</p>', N'<p>- Lương cơ bản thỏa thuận theo năng lực từ 6.000.000 - 8.000.000 VNĐ/Tháng + Hoa hồng lương kinh doanh + Thưởng kinh doanh. Tổng thu nhập giao động từ 10.000.000 - 15.000.000 VNĐ/Tháng)</p><p>- Hưởng 100% Lương cơ bản + 4% hoa hồng trong thời gian thử việc.&nbsp;</p><p>- Phụ cấp ăn ca 30.000 VNĐ/ca trực tối từ 13:30 đến 20:30.&nbsp;</p><p>- Được tham gia các chương trình thi đua doanh số của hệ thống các trung tâm của Pasal. Tham gia các chương trình đào tạo nâng cao kỹ năng nghiệp vụ chuyên môn. Đắc biệt được tặng học bổng 100% khoá học tiếng Anh giao tiếp độc quyền chỉ có tại Pasal.&nbsp;</p><p>- Chính sách thưởng lương tháng 13 và thưởng cuối năm vinh danh nhân sự có thành tích xuất sắc. Chính sách phúc lợi: sinh nhật, nghỉ mát; xét duyệt tăng lương định kỳ hàng năm 1 năm/lần, thưởng theo thâm niên công tác.&nbsp;</p><p>- Được tham gia đầy đủ các chế độ BHXH, BHYT và BHTN...&nbsp;</p><p>- Môi trường làm việc năng động, nhiều cơ hội thăng tiến, lộ trình thăng tiến rõ ràng.</p>', 1, 1, CAST(N'2021-04-09T19:00:09.557' AS DateTime), CAST(N'2021-04-09T19:00:09.557' AS DateTime), 0, 0, 4, N'8db461f5-dbf8-463c-865c-b26ababa818a', N'Trong khoảng')
INSERT [dbo].[Jobs] ([job_id], [job_title], [job_addpress], [job_amout], [wp_id], [type_id], [job_sex], [exp_id], [job_payend], [job_paystart], [job_datedeline], [job_name], [job_phone], [job_describe], [job_request], [job_right], [job_active], [job_option], [job_datecreate], [job_dateupdate], [job_bin], [job_view], [user_id], [job_key], [job_textprice]) VALUES (3, N'CHUYÊN VIÊN VIDEO CONTENT MARKETING', N' Số 2, Ngõ 54, Phố Vũ Trọng Phụng, Thanh Xuân, Hà Nội', 1, 1, 1, NULL, 3, N'12', N'10', CAST(N'2021-04-30T00:00:00.000' AS DateTime), N'Huỳnh Minh Tấn 1', N'0924404019', N'<p><strong>1. Xây dựng kế hoạch và sản xuất Video Content.</strong></p><ul><li>Xây dựng kế hoạch sản xuất Video Content định kỳ hàng tháng theo mục tiêu chung của Phòng Marketing;</li><li>Đăng tải Video Content lên các kênh truyền thông thuộc sở hữu của Công ty;</li><li>Chủ trì xây dựng nội dung, tổ chức quay dựng, sản xuất Viral Video Content theo chiến dịch marketing của Phòng; triển khai seeding, liên hệ các kênh truyền thông thứ 3 khác để phát tán Viral Video Content;</li><li>Sản xuất Video Content phục vụ cho các chiến dịch quảng cáo theo yêu cầu &amp; KHKD của công ty.</li></ul><p><strong>2. Quản trị, phát triển kênh Youtube/Tiktok của Công ty.</strong></p><ul><li>Chịu trách nhiệm đăng tải video content lên kênh Youtube/Tiktok chính của Công ty;</li><li>Xây dựng và phát triển các kênh Youtube vệ tinh, kênh Tiktok, Mạng xã hội Video khác của Công ty theo yêu cầu của Trưởng nhóm Digital Marketing hoặc Trưởng phòng Marketing;</li><li>Đề xuất, thực hiện các công việc nhằm tăng chất lượng video cũng như lượt view trên Youtube, Tiktok;</li><li>Báo cáo và phân tích số liệu phát triển kênh.</li></ul><p><strong>3.Thực hiện các công việc khác theo yêu cầu của Trưởng nhóm Digital Marketing / Trưởng phòng Marketing&nbsp;</strong></p>', N'<ul><li>Nam/Nữ. Độ tuổi từ 25-30 tuổi.</li><li>Cố tối thiểu 01 năm kinh nghiệm ở vị trí tương đương. Tốt nghiệp Đại học trở lên, ưu tiên chuyên ngành Marketing, Ngoại ngữ (Ưu tiên ứng viên có TOEIC 800 + / IELTS 7.5 +)</li><li>Có kiến thức về Video Content Marketing, am hiểu về quy trình sản xuất Video, các kênh Youtube/Tiktok và các mạng xã hội khác.</li><li>Khả năng viết tốt: sáng tạo nội dung; viết kịch bản nội dung; kịch bản quay dựng và sử dụng cơ bản phần mềm chỉnh sửa video, thiết kế.</li><li>Kỹ năng phân tích, đánh giá &amp; khả năng làm việc độc lập hoặc theo nhóm.</li></ul>', N'<ul><li><strong>Lương cơ bản 10.000.000 VNĐ - 12.000.000 VNĐ + Thưởng hiệu suất công việc + Thưởng team MKT . Thu nhập từ 12.000.000 - 15.000.000 VNĐ</strong></li><li>Được tặng học bổng 100% khoá học tiếng Anh giao tiếp độc quyền chỉ có tại Pasal.</li><li>Xét duyệt tăng lương cơ bản 1 lần/ năm, đánh giá công việc định kỳ để xét thăng tiến theo lộ trình phát triển sự nghiệp tại Pasal.</li><li>Ngoài ra có thưởng lương tháng 13 và thưởng cuối năm theo kết quả hoạt động kinh doanh của công ty.</li><li>Được tham gia đóng BHXH theo quy định của pháp luật và theo quy định của công ty.</li><li>Tham gia các hoạt động nôi bộ như teambuilding, year end party, sinh nhật,...</li></ul>', 1, 1, CAST(N'2021-04-15T14:40:18.047' AS DateTime), CAST(N'2021-04-15T14:40:18.047' AS DateTime), 0, 0, 4, N'46bad25a-2f98-41cf-9a14-858712419504', N'Trong khoảng')
INSERT [dbo].[Jobs] ([job_id], [job_title], [job_addpress], [job_amout], [wp_id], [type_id], [job_sex], [exp_id], [job_payend], [job_paystart], [job_datedeline], [job_name], [job_phone], [job_describe], [job_request], [job_right], [job_active], [job_option], [job_datecreate], [job_dateupdate], [job_bin], [job_view], [user_id], [job_key], [job_textprice]) VALUES (4, N'NHÂN VIÊN GIÁO VỤ ĐÀO TẠO', N' Số 2, Ngõ 54, Phố Vũ Trọng Phụng, Thanh Xuân, Hà Nội', 1, 1, 1, 0, 3, N'0', N'0', CAST(N'2021-04-30T00:00:00.000' AS DateTime), N'Huỳnh Minh Tấn 1', N'0924404019', N'<p>- Quản lý sắp xếp lớp học, thời khóa biểu cho Giảng viên - Trợ giảng dựa vào kế hoạch mở lớp của Phòng Đào tạo &amp; Phòng Kinh doanh.</p><p>- Phối hợp với giám đốc Trung tâm để đảm bảo sử dụng và khai thác tối đa lớp học &amp; các tiện ích của Trung tâm.</p><p>- Quản lý văn phòng phẩm; hệ thống tài khoản học cho học viên &amp; Phòng Đào tạo.</p><p>- Xây dựng quản trị file quản lý lớp học; xử lý trường hợp phát sinh trong quá trình điều phối giảng viên&nbsp; - trợ giảng liên quan đến lịch mở lớp, lịch khai gia</p><p>- Tiếp nhận và xử lý các vấn đề phát sinh liên quan đến cơ sở vật; giáo trình dạy học; chất lượng lớp học.</p><p>- Tiến hành công tác thanh tra lớp học trực tiếp để đánh giá chất lượng giảng dạy của GV-TG đảm bảo tuân thủ theo yêu cầu và quy đình của Phòng Đào tạo.</p><p>- Tổng hợp kết quả đánh giá, chấm công, tính lương cho đội ngũ giảng dạy.</p><p>- Tham gia tổ chức các hoạt động nội bộ (đào tạo chuyên môn, hoạt động kết nối, vinh danh,…)</p><p>- Phối hợp với Quản lý bộ phận xây dựng hệ thống văn bản, quy trình, tổng hợp báo cáo nội bộ Phòng Đào tạo &amp; thực hiện các công việc khác theo yêu cầu của Trưởng phòng Đào tạo.</p>', N'<p>- Nữ, độ tuổi từ 22-28 tuổi.</p><p>- Tốt nghiệp Đại học/Cao đẳng ưu tiên ứng viên học các chuyên ngành về Sư phạm, Quản lý giáo dục.</p><p>- Có ít nhất 06 tháng đến 01 năm kinh nghiệm ở vị trí tương đương.</p><p>- Sử dụng thành thạo tin học văn phòng (Word, Excel, Googlesheet, PPT…..)&nbsp;</p><p>- Kỹ năng giao tiếp &amp; xử lý tình huống và làm việc độc lập.</p><p>- Chủ động về phương tiện làm việc: máy tính laptop cá nhân.</p><p>*** Ưu tiên:</p><p>- Ứng viên có khả năng giao tiếp Tiếng Anh (Có bằng TOEIC, IELTS hoặc có kinh nghiệm giảng dạy tiếng Anh giao tiếp cho người lớn là một lợi thế)</p><p>- Ứng viên đã làm việc trong các môi trường giáo dục, có khả năng tổ chức đào tạo, tổ chức sự kiện.</p><p>- Thái độ: có sự cam kết, trách nhiệm &amp; chủ động trong công việc</p><p>- Thời gian làm việc: giờ Hành chính 08h/ngày (Sáng từ 08h00-12h00, Chiều từ 13h30-17h30, Tối từ 17h30 – 21h00), từ thứ 2 đến hết sáng thứ 7, nghỉ chiều thứ 7 &amp; Chủ nhật.&nbsp;</p>', N'<p>- Lương cơ bản offer theo năng lực từ <strong>7.000.000 - 9.000.000 VNĐ/tháng + Thưởng đánh giá theo hiệu suất công việc.</strong></p><p>- Xét duyệt tăng lương cơ bản 1 lần/ năm, đánh giá công việc định kỳ để xét thăng tiến theo lộ trình phát triển sự nghiệp tại Pasal.</p><p>- Thưởng lương tháng 13 và thưởng cuối năm theo kết quả hoạt động kinh doanh của công ty.</p><p>- Đóng BHXH theo quy định của pháp luật và theo quy định của công ty.</p><p>- Được đào tạo về sản phẩm, kỹ năng chuyên môn và nhận học bổng 100% khóa học Tiếng anh giao tiếp độc quyền tại Pasal.</p><p>- Phát triển kỹ năng đội nhóm, teamwork, bán hàng và chăm sóc khách hàng.</p><p>- Chế độ du lịch, nghỉ mát team building không giới hạn cùng cơ hội phát triển sự nghiệp tại Pasal.</p>', 0, 1, CAST(N'2021-04-15T14:42:05.310' AS DateTime), CAST(N'2021-04-15T14:42:05.310' AS DateTime), 0, 0, 4, N'22235ef4-b0f7-4cff-b400-bc361f5758cd', NULL)
INSERT [dbo].[Jobs] ([job_id], [job_title], [job_addpress], [job_amout], [wp_id], [type_id], [job_sex], [exp_id], [job_payend], [job_paystart], [job_datedeline], [job_name], [job_phone], [job_describe], [job_request], [job_right], [job_active], [job_option], [job_datecreate], [job_dateupdate], [job_bin], [job_view], [user_id], [job_key], [job_textprice]) VALUES (5, N'CHUYÊN VIÊN TƯ VẤN TÀI CHÍNH - LƯƠNG CỨNG ĐẾN 15 TRIỆU (HÀ NỘI, ĐÀ NẴNG, HỒ CHÍ MINH)', N'43-45 Lý Chính Thắng, Phường 7, Quận 3', 10, 1, 1, NULL, 1, N'0', N'15', CAST(N'2021-04-25T00:00:00.000' AS DateTime), N'Huỳnh Minh Tấn', N'0924404019', N'<p>- Tư vấn cho khách hàng giải pháp tài chính phù hợp, những sản phẩm bảo vệ đến từ Generali, mang đến cho khách hàng trải nghiệm dịch vụ xuất sắc.</p><p>- Gặp gỡ khách hàng để tăng trưởng doanh số theo chỉ tiêu được giao</p><p>- Phối hợp với các phòng ban khác, giúp khách hàng có được quyền lợi tối ưu, đồng hành cùng khách hàng trong suốt quá trình tham gia bảo hiểm.</p><p>- Mở rộng, phát triển các mối quan hệ mới, duy trì mối quan hệ với khách hàng tiềm năng</p><p>- Lan tỏa ý nghĩa tích cực của Bảo hiểm nhân thọ</p>', N'<p>- Tuổi từ 23 – 35</p><p>- Tốt nghiệp Cao đẳng/đại học</p><p>- Kỹ năng giao tiếp tốt, khả năng trình bày rõ ràng</p><p>- Mong muốn khẳng định bản thân, tạo sự khác biệt, bứt phá trong sự nghiệp</p><p>- Tâm huyết, kiên trì để theo đuổi con đường trở thành chuyên viên tư vấn tài chính chuyên nghiệp.</p>', N'<p><strong>- Chính sách thu nhập hấp dẫn và không giới hạn (lương cố định lên đến 15 triệu/tháng + hoa hồng)</strong></p><p>- Hỗ trợ công nghệ, cung cấp những thiết bị phục vụ cho tư vấn</p><p>- Đồng phục chuyên nghiệp dành riêng cho Gen E</p><p>- Bảo hiểm sức khỏe cao cấp</p><p>- Lộ trình huấn luyện sát sao, bài bản, từng bước giúp bạn ngày càng hoàn thiện bản thân, xây dựng và phát triển thương hiệu cá nhân vượt trội</p><p>- Cơ hội được đặt chân đến nhiều địa danh nổi tiếng trong và ngoài nước không tốn phí</p><p>- Quyền được sáng tạo, chia sẻ ý kiến và phối hợp với đồng nghiệp tạo nên thành công vượt trội</p>', 1, 1, CAST(N'2021-04-15T16:32:14.403' AS DateTime), CAST(N'2021-04-15T16:32:14.403' AS DateTime), 0, 0, 1008, N'785bf9ae-71b1-4ce7-9ce9-2507fb846e4e', N'Lên đến')
INSERT [dbo].[Jobs] ([job_id], [job_title], [job_addpress], [job_amout], [wp_id], [type_id], [job_sex], [exp_id], [job_payend], [job_paystart], [job_datedeline], [job_name], [job_phone], [job_describe], [job_request], [job_right], [job_active], [job_option], [job_datecreate], [job_dateupdate], [job_bin], [job_view], [user_id], [job_key], [job_textprice]) VALUES (6, N'CHUYÊN VIÊN SEO MARKETING (THU NHẬP TỪ 10 - 15 TRIỆU)', N'Tầng 10 Tòa CIT ngõ 15 Duy Tân Cầu Giấy Hà Nội', 1, 1, 1, NULL, 1, N'15', N'10', CAST(N'2021-04-25T00:00:00.000' AS DateTime), N'Huỳnh Minh Tấn', N'0924404019', N'<p>Kế hoạch SEO hiệu quả, chiến lược cụ thể để đẩy từ khóa trong từng giai đoạn khác</p><p>SEO từ khóa lên Top bộ máy tìm kiếm và đảm bảo duy trì vị trí Top lâu dài.</p><p>Xây dựng, sáng tạo ý tưởng thiết kế hình ảnh theo các chiến dịch, hoạt động Marketing của Công ty trong từng giai đoạn.</p><p>Hợp tác cùng team Marketing đưa ra những đột phá cho các chiến lược SEO. Xây dựng được chiến lược SEO ngắn hạn và dài hạn theo từng giai đoạn cho sản phẩm.</p><p>Phân tích và đánh giá về thị trường thông qua các từ khóa, bổ sung những từ khóa hot nhất cho website.</p><p>Thiết kế hình ảnh phục vụ cho các kênh truyền thông online của công ty như Website, Facebook, Youtube,...hoặc các công cụ Marketing trên kênh phân phối offline. Biết Chỉnh sửa video là một lợi thế.</p><p>Báo cáo công việc, vị trí từ khóa và lượng truy cập hàng tuần/ tháng.</p>', N'<p>Nữ, Tốt nghiệp Đại học chuyên ngành: Marketing, Kinh tế, Quản trị Kinh Doanh, CNTT</p><p>Kinh nghiệm: có kinh nghiệm &gt;02 năm làm việc tại vị trí tương đương</p><p>Thành thạo sử dụng các công cụ GG, kỹ năng viết bài chuẩn SEO, phân tích đọc hiểu các chỉ số qc cũng như các chỉ số về phát triển web</p><p>Hiểu và nắm được các khái niệm của SEO; sử dụng thành thạo các cộng cụ kiểm tra backlink, cách công cụ, phần mềm hỗ trợ cho SEO</p><p>Có khả năng tư duy sáng tạo, phân tích nội dung thiết kế, chuyển tải ý tưởng, thông điệp bằng hình ảnh.</p><p>Sử dụng tốt các phần mềm design như AI, PS, PR và các app chỉnh sửa mobile.</p>', N'<p>Mức thu nhập: 10-15tr/tháng</p><p>Được thưởng tháng lương thứ 13</p><p>Có cơ hội thăng tiến teamleader, trưởng nhóm Marketting</p><p>Đóng BHXH, BHYT theo bộ luật lao động.</p><p>Chế độ nghỉ lễ Tết, đi du lịch hằng năm. Sinh nhật</p><p>Làm việc trong môi trường trẻ, năng động, thoải mái</p><p>Thời gian làm việc: T2-T6 ( từ 8h-17h30) được nghỉ T7, CN</p>', 1, 1, CAST(N'2021-04-15T16:41:01.300' AS DateTime), CAST(N'2021-04-15T16:41:01.300' AS DateTime), 0, 0, 1009, N'a39d85f2-40cf-4281-86a3-8594733cee87', N'Trong khoảng')
INSERT [dbo].[Jobs] ([job_id], [job_title], [job_addpress], [job_amout], [wp_id], [type_id], [job_sex], [exp_id], [job_payend], [job_paystart], [job_datedeline], [job_name], [job_phone], [job_describe], [job_request], [job_right], [job_active], [job_option], [job_datecreate], [job_dateupdate], [job_bin], [job_view], [user_id], [job_key], [job_textprice]) VALUES (7, N'TRỢ LÝ KỸ SƯ BIẾT TIẾNG TRUNG', N'Khu Depot Dự án đường sắt đô thị Cát Linh - Hà Đông (Phú Lương, Hà Đông, Hà Nội)', 10, 1, 1, NULL, 1, N'20', N'10', CAST(N'2021-04-25T00:00:00.000' AS DateTime), N'Huỳnh Minh Tấn', N'0924404019', N'<p>- Làm việc tại Dự án tư vấn, hỗ trợ quản lý, vận hành khai thác tuyến ĐSĐT Cát Linh – Hà Đông.</p><p>- Dịch nói tại các buổi đào tạo, làm việc, cuộc họp tại hiện trường và trong văn phòng hiện trường; Dịch tài liệu, báo cáo, văn bản trong văn phòng;</p><p>- Hỗ trợ chuyên gia thực hiện các công việc, trao đổi, giao dịch với cơ quan quản lý trong quá trình thực hiện hợp đồng.</p>', N'<p>- Thành thạo 4 kỹ năng nghe, nói, đọc, viết tiếng Trung;</p><p>- Dự án đường sắt đô thị Cát Linh - Hà Đông, lĩnh vực này khá là đặc thù, nên cần người có kinh nghiệm phiên dịch hiện trường, đủ khả năng linh hoạt, thích nghi nhanh với công việc mới</p><p>&nbsp;</p><p>- Thành thạo vi tính văn phòng;</p><p>- Nhiệt tình, chịu khó, ham học hỏi, linh hoạt.</p><p>- Trợ lý kỹ sư: Có thể làm thêm giờ buổi tối hoặc làm ca đêm.</p>', N'<p>- Lương: 10 - 20 triệu/tháng</p><p>- Phụ cấp điện thoại, xăng xe, ăn trưa v.v. theo quy định của Công ty</p><p>- Đóng BHXH, BHYT, trợ cấp thất nghiệp theo quy định của Luật pháp Việt Nam.</p><p>- Làm việc trong môi trường năng động, chuyên nghiệp có nhiều cơ hội thăng tiến.</p><p>- Cung cấp trang thiết bị đầy đủ để phục vụ công việc.</p><p>- Được hưởng các chính sách phúc lợi theo quy định của công ty.</p><p>- Được đào tạo, nâng cao nghiệp vụ thường xuyên.</p>', 1, 1, CAST(N'2021-04-15T17:36:15.500' AS DateTime), CAST(N'2021-04-15T17:36:15.500' AS DateTime), 0, 0, 1010, N'a787a23b-3a15-4fe2-9bda-1228f85a9a5d', N'Trong khoảng')
INSERT [dbo].[Jobs] ([job_id], [job_title], [job_addpress], [job_amout], [wp_id], [type_id], [job_sex], [exp_id], [job_payend], [job_paystart], [job_datedeline], [job_name], [job_phone], [job_describe], [job_request], [job_right], [job_active], [job_option], [job_datecreate], [job_dateupdate], [job_bin], [job_view], [user_id], [job_key], [job_textprice]) VALUES (8, N'QUẢN LÝ KHO HÀNG (THỦ KHO) - TẠI HÀ NỘI, HỒ CHÍ MINH', N'Địa điểm tại HN: CN5, Cụm Công nghiệp Ngọc Hồi, Thanh Trì, HN - Địa điểm tại SG: 23C Lỹ Bán Bích, P.Tân Thới Hòa, Q.Tân Phú, Tp. HCM', 0, 1, 1, NULL, 3, N'18', N'12', CAST(N'2021-04-29T00:00:00.000' AS DateTime), N'Tấn Huỳnh', N'0924404019', N'<p>- Chịu trách nhiệm quản lý đơn hàng trên nền tảng thương mại điện tử, tổ chức đóng gói, giao hàng theo đơn)</p><p>- Quản lý hàng trong kho, vị trí và phân bổ sắp xếp vị trí sản phẩm trong kho</p><p>- Quản lý thời gian làm việc, hiệu suất của nhân viên kho (Nhân sự thời vụ, nhân sự chính, phân công, đào tạo)</p><p>- Báo cáo định kỳ theo quy định</p><p>- Các công việc phát sinh khác tại Kho (Trao đổi cụ thể khi Pv)</p>', N'<p>- Nam tuổi từ 25-35</p><p>- Tốt nghiệp ĐH chuyên ngành liên quan</p><p>- Kinh nghiệm 1-2 năm (ưu tiên quản lý kho bán lẻ trên TMĐT)</p><p>- Có trách nhiệm và chịu áp lực cao trong công việc</p><p>- Có năng lực quản lý, sắp xếp công việc và làm việc nhóm tốt</p><p>- Sử dụng thành thạo các phần mềm microsoft office và các phần mềm văn phòng thông thường khác, khai thác thông tin tốt trên internet</p><p>- Ưu tiên ứng viên có kinh nghiệm làm việc trong ngành hàng văn phòng phẩm</p>', N'<p>- Mức lương: 12-18 triệu (có thể thương lượng theo năng lực thực tế)</p><p>- Được hưởng đầy đủ chế độ BHXH, BHYT theo quy định của nhà nước</p><p>- Được thưởng lương tháng 13,14, các ngày lễ phép theo quy đinh của công ty</p><p>- Được làm việc trong môi trường năng động, trẻ trung.</p><p>- Được học hỏi trao dồi kỹ năng.</p>', 1, 1, CAST(N'2021-04-23T12:52:42.543' AS DateTime), CAST(N'2021-04-23T12:52:42.543' AS DateTime), 0, 0, 1012, N'da6722b3-81e4-4245-afe1-a5e9077b7169', N'Trong khoảng')
INSERT [dbo].[Jobs] ([job_id], [job_title], [job_addpress], [job_amout], [wp_id], [type_id], [job_sex], [exp_id], [job_payend], [job_paystart], [job_datedeline], [job_name], [job_phone], [job_describe], [job_request], [job_right], [job_active], [job_option], [job_datecreate], [job_dateupdate], [job_bin], [job_view], [user_id], [job_key], [job_textprice]) VALUES (9, N'NAM NHÂN VIÊN NGÀNH HÀNG - SALE ADMIN', N'Hà Nội, Hà Nam, Miền Bắc, Miền Trung, Ninh Bình', 5, 1, 1, 1, 2, N'0', N'15', CAST(N'2021-05-09T00:00:00.000' AS DateTime), N'Tấn Huỳnh', N'0924404019', N'<p>- Điều phối hàng hóa từ Nhà máy Hoa Sen về các Chi nhánh Tỉnh quản lý</p><p>- Hỗ trợ Tỉnh xử lý các đơn hàng</p><p>- Tổng hợp, phân tích các số liệu kinh doanh, như số liệu bán hàng, tình hình kinh doanh, phân tích chi phí, công nợ....liên quan đến quản trị kinh doanh</p><p>- Đề xuất xây dựng kế hoạch kinh doanh</p><p>- Xây dựng chính sách kinh doanh, chính sách giá bán</p><p>-Thực hiện chỉ đạo theo yêu cầu của Trưởng Phòng/ Trưởng Bộ phận Kinh doanh Tôn Thép.</p>', N'<p>- Nam Từ 24 đến 27 tuối</p><p>- Tốt Nghiệp chuyên ngành Kinh tế, kĩ năng tin học văn phòng, kĩ năng mềm tốt.</p><p>- Đam mê kinh doanh, có định hướng phát triển cao trong công việc<br>&nbsp;</p><p>- Có tinh thần cầu tiến và ham học hỏi</p><p>- Không yêu cầu kinh nghiệm/ sẽ được đào tạo.</p>', N'<p>- Nam Từ 24 đến 27 tuối</p><p>- Tốt Nghiệp chuyên ngành Kinh tế, kĩ năng tin học văn phòng, kĩ năng mềm tốt.</p><p>- Đam mê kinh doanh, có định hướng phát triển cao trong công việc<br>&nbsp;</p><p>- Có tinh thần cầu tiến và ham học hỏi</p><p>- Không yêu cầu kinh nghiệm/ sẽ được đào tạo.</p>', 1, 1, CAST(N'2021-04-23T13:18:34.610' AS DateTime), CAST(N'2021-04-23T13:18:34.610' AS DateTime), 0, 0, 1013, N'027252cc-9005-4778-a8a8-acb204e72f24', N'Từ')
INSERT [dbo].[Jobs] ([job_id], [job_title], [job_addpress], [job_amout], [wp_id], [type_id], [job_sex], [exp_id], [job_payend], [job_paystart], [job_datedeline], [job_name], [job_phone], [job_describe], [job_request], [job_right], [job_active], [job_option], [job_datecreate], [job_dateupdate], [job_bin], [job_view], [user_id], [job_key], [job_textprice]) VALUES (10, N' NHÂN VIÊN VẬN HÀNH LỚP HỌC', N'Địa chỉ các học viện Teky trong phạm vi toàn quốc: - Số 422 đại lộ Bình Dương, Phường Hiệp Thành, Thành Phố Thủ Dầu 1, Bình Dương - Tầng 4, Toà nhà Sài Gòn Mall, Số 19 Cao Thắng, Phường 2, Quận 3, TP.Hồ Chí Minh - Số 340 Cộng Hoà, Phường 13, Quận Tân Bình', 2, 1, 1, 0, 1, N'9', N'7', CAST(N'2021-05-09T00:00:00.000' AS DateTime), N'Huỳnh Minh Tấn', N'0924404019', N'<p>Phụ trách các vấn đề liên quan tới mối quan hệ trong nội bộ/Ngoài văn phòng công ty, các vấn đề giảng viên và thiết bị</p><p><strong>Học vụ</strong></p><p>- Đề xuất Ghi danh học sinh</p><p>- Quản lý học sinh trên hệ thống ED-Tech LMS (Điểm danh học sinh; Điểm danh lớp; Chăm sóc học viên; Theo dõi tình hình học tập)</p><p>- Quản lý nhập xuất thiết bị học tập hằng ngày, kho đồ dùng; Chuẩn bị học liệu cho giảng viên khi được yêu cầu</p><p>- Theo dõi chấp hành nội quy nhà trường của giảng viên (nề nếp, giờ giấc v.v..); Cập nhật, phổ biến các quy định của cơ sở/ hệ thống học viện cho giảng viên;</p><p>- Tổng hợp thời gian giảng dạy, thù lao cho giảng viên, cộng tác viên (xuất báo cáo và lấy chữ ký xác nhận của quản lý, giảng viên);</p><p>- Lên lịch bảo vệ cuối khoá, mời phụ huynh và những người liên quan (tạo event), Phối hợp tổ chức các buổi bảo vệ cuối khoá.</p><p>- Cập nhật offset, đổi giáo viên, đổi lớp cho học sinh, bảo lưu, hoàn tiền</p><p>- Phụ trách các vấn đề liên quan tới mối quan hệ phụ huynh, học sinh; chịu trách nhiệm đảm bảo mọi vấn đề Dịch vụ&nbsp;<br>&nbsp;</p><p>- Quản lý Student Test</p><p>- Đón tiếp/Điều phối học sinh</p><p><strong>Theo dõi Thu - Công nợ</strong></p><p>- Thực hiện thu học phí</p><p>- Lập báo cáo thu tiền hàng ngày, scan các chứng từ thu tiền (các SO) và báo cáo thu tiền hàng ngày có đầy đủ chữ ký và email về cho kế toán tại HO. Định kỳ hàng tuần tập hợp chứng từ gốc về HO;</p><p>- Lập bảng kê các khoản chi phí, các hóa đơn đầu vào kẹp cùng chứng từ gốc để chuyển về HO;</p><p><strong>Công tác Văn phòng:</strong></p><p>- Phối hợp với Cán bộ chuyên môn của Trụ sở chính thực hiện các hoạt động đón tiếp ứng viên, tiếp nhận ban đầu, theo dõi và thực hiện chế độ, nội quy, hành chính văn phòng.</p><p>- Quản lý Vệ sinh - An toàn cơ sở&nbsp;<br>&nbsp;</p><p>- Tham gia các cuộc Kiểm kê tiền mặt, tài sản hàng tuần.&nbsp;</p>', N'<p>• Tốt ngiệp Cao Đẳng/Đại học các nghành nghề liên quan như: Sư phạm, hành chính, công nghệ thông tin, kinh tế,......<br>&nbsp;</p><p>• Tốt nghiệp các lĩnh vực Sư phạm, Công nghệ là một lợi thế</p><p>• Có kinh nghiệm làm việc tại các trung tâm Tin học, Tiếng anh hoặc ở vị trí tương đương.&nbsp;</p><p>• Yêu thích môi trường giáo dục, tiếp xúc và trao đổi với Học viên, Phụ huynh.&nbsp;<br>&nbsp;</p><p>• Có kinh nghiệm kĩ năng tương tác, chăm sóc khách hàng.</p><p>• Có laptop cá nhân. Kỹ năng máy tính tốt</p><p><strong>Thời gian làm việc:</strong></p><p>Làm việc theo ca sáng, chiều hoặc tối: tối thiểu 44h/tuần, 11 ca/tuần:</p><p>Ca sáng: 8h00 – 12h00; ca chiều: 13h00 – 17h00 hoặc ca tối: 17h00 – 21h00&nbsp;&nbsp;</p><p>Nghỉ trưa 1h00p (12h00 – 13h00).</p><p>Nghỉ 1,5 ngày/tuần, đăng kí theo tuần. Ưu tiên nghỉ trong tuần và đi làm cuối tuần</p>', N'<p>• Lương khởi điểm: 7- 9 triệu/tháng, thỏa thuận theo năng lực</p><p>• Được làm việc trong môi trường Giáo dục năng động, chuyên nghiệp, cơ sở vật chất hiện đại.</p><p>• Được đóng BHXH, BHYT, BHTN theo chế độ của Nhà Nước.<br>&nbsp;</p><p>• Được đi du lịch ít nhất 1 lần 1 năm, Teambuilding theo quý,..</p><p>• Cơ hội làm việc trực tiếp tham gia các dự án giáo dục mang tính quốc tế cao, có sự tham gia của các doanh nghiệp hàng đầu về giáo dục và công nghệ tại Mĩ, Hàn Quốc, Nhật Bản …</p><p>• Được đào tạo về tư duy quản lý, sáng tạo, phát triển năng lực chuyên môn</p><p><strong>ĐỊA ĐIỂM LÀM VIỆC</strong></p><p><strong>* Hà Nội:</strong></p><p>- Số 6 Nguyễn Thị Thập, Trung Hòa Nhân Chính, Cầu Giấy, Hà Nội</p><p>- Tầng 5, tòa nhà Mac Plaza, số 10 Trần Phú, Hà Đông</p><p>- Số 96 Phố Hai Bà Trưng, Cửa Nam, quận Hoàn Kiếm</p><p>- 414 Nguyễn Văn Cừ, P. Bồ Đề, Q. Long Biên, Hà Nội</p><p>- 17B10 - Hàm Nghi, Mỹ Đình, Nam Từ Liêm</p><p><strong>* Hồ Chí Minh:</strong></p><p>- Tòa nhà Sài Gòn Mall, Số 19 Cao Thắng, P.2, Q.3, HCM.</p><p>- Tầng trệt, Số 249 Cộng Hòa, Phường 13, Quận Tân Bình, TP.Hồ Chí Minh</p><p>- 133 Nguyễn Thị Thập, Phường Tân Hưng, Quận 7</p><p>- 569 Phan Văn Trị, Phường 5, Quận Gò Vấp</p><p>- 20 Ung Văn Khiêm, Phường 25, Quận Bình Thạnh, TP.Hồ Chí Minh</p><p>- Số 27, Masteri An Phú, 179 Xa lộ Hà Nội, Phường Thảo Điền, Quận 2, TP.Hồ Chí Minh</p><p>- 143 – 145 Phan Xích Long, Phường 7, Quận Phú Nhuận, TP.Hồ Chí Minh</p><p>- 98 Đường số 17A, Phường Bình Trị Đông B, Quận Bình Tân, TP.Hồ Chí Minh</p><p><strong>* TEKY Hải Phòng:</strong> 104 Lương Khánh Thiện, Ngô Quyền, Hải Phòng</p><p><strong>* TEKY Quảng Ninh:</strong> SH4 Times Garden, Đường 25 tháng 4, P. Bạch Đằng, TP. Hạ Long, Quảng Ninh (ra mắt tháng 9/2019)</p><p><strong>* TEKY Bình Dương:</strong> 422 đại lộ Bình Dương, Phường Hiệp Thành, Thành Phố Thủ Dầu 1, Bình Dương</p>', 1, 1, CAST(N'2021-04-23T13:28:45.063' AS DateTime), CAST(N'2021-04-23T13:28:45.063' AS DateTime), 0, 0, 1014, N'98673e7b-b1a2-4f30-a36b-631a6ecc59c6', N'Trong khoảng')
INSERT [dbo].[Jobs] ([job_id], [job_title], [job_addpress], [job_amout], [wp_id], [type_id], [job_sex], [exp_id], [job_payend], [job_paystart], [job_datedeline], [job_name], [job_phone], [job_describe], [job_request], [job_right], [job_active], [job_option], [job_datecreate], [job_dateupdate], [job_bin], [job_view], [user_id], [job_key], [job_textprice]) VALUES (11, N'PYTHON DEVELOPER', N'Số 48 Vạn Bảo, Phường Ngọc Khánh, Quận Ba Đình, Hà Nội', 2, 1, 1, NULL, 3, N'0', N'0', CAST(N'2021-05-09T00:00:00.000' AS DateTime), N'Huỳnh Minh Tấn', N'0924404019', N'<ul><li>Tham gia xây dựng và phát triển các dự án website của công ty.</li><li>Lập trình web trên nền tảng python sử dụng framework Django.</li><li>Viết các chương trình, ứng dụng trên desktop, điện thoại di động, tự động hóa các tác vụ vận hành hệ thống mạng viễn thông của FPT.</li></ul>', N'<ul><li>Tốt nghiệp chuyên ngành CNTT, Điện tử, Viễn thông,...</li><li>Yêu thích làm sản phẩm và yêu thích lập trình.</li><li>Nắm rõ ít nhất 1 ngôn ngữ lập trình, ưu tiên có kinh nghiệm lập trình python.</li><li>Có kinh nghiệm về Web framework (Django hoặc framework của ngôn ngữ khác).</li><li>Có kinh nghiệm về HTML/JS/CSS. Hiểu biết về các framework front-end là một lợi thế.</li><li>Có khả năng làm việc độc lập và theo nhóm.</li><li>Cẩn thận, kiên nhẫn và ham học hỏi.</li></ul>', N'<ul><li>Gói thu nhập tương đương từ 14 - 17 tháng lương quy đổi (Thưởng lương tháng 13, lương kinh doanh, tiền mừng tuổi...).</li><li>Đầy đủ các chế độ theo luật lao động hiện hành.</li><li>Chính sách phúc lợi theo quy định của Công ty đa dạng: Chăm sóc sức khỏe định kì hàng năm; Gói bảo hiểm sức khỏe chuyên biệt (FPT Care – Khám chữa bệnh miễn phí tại tất cả các bệnh viện); Các hoạt động tri ân, chăm lo đời sống tinh thần CBNV và Thân nhân...</li><li>Môi trường làm việc thân thiện, cởi mở.</li><li>Cơ sở vật chất và công cụ làm việc hiện đại, tiện nghi.</li><li>​Nhiều cơ hội phát triển và thăng tiến.</li><li>Văn hóa Doanh nghiệp đặc sắc, sinh động bậc nhất với nhiều các hoạt động hấp dẫn: tân binh, 72 giờ trải nghiệm, teambuilding, thi trạng, hội làng, hội diễn Sao Chổi, sinh nhật FPT, ngày 08/03, ngày 11/11,...</li><li>Hưởng các gói ưu đãi cước khi sử dụng dịch vụ của FPT Telecom.</li><li>Hỗ trợ chi phí cho các chứng chỉ quốc tế.</li></ul>', 1, 1, CAST(N'2021-04-23T13:39:25.367' AS DateTime), CAST(N'2021-04-23T13:39:25.367' AS DateTime), 0, 0, 1015, N'9a123eaa-0c82-4883-8721-45ca12ae5d09', NULL)
INSERT [dbo].[Jobs] ([job_id], [job_title], [job_addpress], [job_amout], [wp_id], [type_id], [job_sex], [exp_id], [job_payend], [job_paystart], [job_datedeline], [job_name], [job_phone], [job_describe], [job_request], [job_right], [job_active], [job_option], [job_datecreate], [job_dateupdate], [job_bin], [job_view], [user_id], [job_key], [job_textprice]) VALUES (12, N'NHÂN VIÊN BÁN HÀNG TẠI SHOWROOM KHU VỰC THỦ ĐỨC, BÌNH DƯƠNG', N'Số 63, đường Đại Lộ Bình Dương, Phường Hiệp Thành, Thành phố Thủ Dầu Một, Tỉnh Bình Dương', 10, 1, 1, NULL, 1, N'0', N'15', CAST(N'2021-05-09T00:00:00.000' AS DateTime), N'Huỳnh Minh Tấn', N'0924404019', N'<p>- Làm việc tại 3 chi nhánh sau:</p><p>+ Lái Thiêu - Thuận An - Bình Dương</p><p>+ Số 63, đường Đại Lộ Bình Dương, Phường Hiệp Thành, Thành phố Thủ Dầu Một, Tỉnh Bình Dương</p><p>+ VPDD: 92 đường 10, Khu đô thị Vạn Phúc, P.Hiệp Bình Phước, Thủ Đức, Tp.HCM</p><p>- Nhận và thực hiện chỉ tiêu doanh số theo tháng.</p><p>- Tìm kiếm, tư vấn, thuyết phục khách hàng lựa chọn sản phẩm, dịch vụ của công ty, đàm phán ký hợp đồng.</p><p>- Tiếp nhận yêu cầu của khách hàng để tiến hành xử lý, giải đáp thắc mắc, tư vấn kịp thời về chất lượng, giá cả, số lượng yêu cầu,… cho khách hàng.</p><p>- Thực hiện công tác bàn giao xe, hồ sơ cho khách hàng.</p><p>- Trực bán hàng tại Showroom theo sự phân công của Trưởng phòng.</p><p>- Chi tiết trao đổi thêm khi phỏng vấn.</p>', N'<p>- Nam/ Nữ : Tốt nghiệp chuyên ngành Ô Tô, QTKD, Kinh Tế, Marketing, ...</p><p>- Ưu tiên các ứng viên có kinh nghiệm trong ngành kinh doanh ô tô. Có bằng lái xe là một lợi thế.</p><p>- Năng động, nhanh nhẹn, đam mê kinh doanh, thể thao.</p><p>- Chủ động nhanh nhẹn trong công việc.</p>', N'<p>= &gt; Tổng thu nhập từ 10 triệu – 30 triệu++/ tháng &amp; không giới hạn theo năng lực. (Lương cơ bản + Hoa hồng + Thưởng nóng)</p><p>- THƯỞNG NÓNG 1 - 5 triệu đối với các dòng xe theo chương trình.</p><p>- Lương tháng 13, 14, BHXH, phép năm, sinh nhật, thưởng các ngày lễ.</p><p>- Môi trường làm việc trẻ, năng động, nhiệt huyết, thỏa sức thể hiện đam mê.</p><p>- Phong trào thể dục thể thao, văn nghệ sôi nổi.</p><p>- Cơ hội thăng tiến lên các vị trí như Trưởng Nhóm, Trưởng Phòng,... sau 12 tháng.</p><p>- Được đào tạo Kỹ Năng Bán Hàng, Sản Phẩm hàng tuần &amp; Chứng chỉ Tư Vấn Bán Hàng HTC.</p>', 1, 1, CAST(N'2021-04-23T13:46:23.560' AS DateTime), CAST(N'2021-04-23T13:46:23.560' AS DateTime), 0, 0, 1016, N'129c610d-733e-4564-b9d7-b4bf2d28b0a1', N'Từ')
SET IDENTITY_INSERT [dbo].[Jobs] OFF
GO
SET IDENTITY_INSERT [dbo].[Pakages] ON 

INSERT [dbo].[Pakages] ([pakage_id], [pakage_name], [pakage_note], [pakage_money], [pakage_precent], [pakage_active], [role_id]) VALUES (10, N'TÀI KHOẢN VIP', NULL, 40000, 70, 1, 1)
INSERT [dbo].[Pakages] ([pakage_id], [pakage_name], [pakage_note], [pakage_money], [pakage_precent], [pakage_active], [role_id]) VALUES (11, N'GÓI CAO CẤP 1', N'<ul class="plan-features">
    <li>
        Giới hạn đăng: <b class="text-danger font-weight-bold">30</b> tin tuyển dụng
    </li>
    <li>
        Nhận ứng viên: <b class="text-danger font-weight-bold">50</b> trong 1 ngày
    </li>
    <li>
        Hiển thị tại việc làm <b class="text-danger font-weight-bold">Nên làm</b>
    </li>
    <li>
        Màu đặc trưng: <b class="text-danger font-weight-bold">Xanh lá</b>
    </li>
    <li>
        Xem cv: <b class="text-danger font-weight-bold">Không giới hạn</b>
    </li>
    <li>
        Ưu tiên nhận ứng viên tốt
    </li>
    <li>
        Tải pdf ứng viên không giới hạn
    </li>
    <li>
        1 phiếu quảng cáo tại QuickJob 3 ngày
    </li>
    <li>
        Xem được bài tuyển dụng mẫu tốt nhất.
    </li>
    <li>
        <i class="fa fa-times-circle text-danger"></i>
    </li>
    <li>
        <i class="fa fa-times-circle text-danger"></i>
    </li>
</ul>', 20000, 30, 1, 2)
INSERT [dbo].[Pakages] ([pakage_id], [pakage_name], [pakage_note], [pakage_money], [pakage_precent], [pakage_active], [role_id]) VALUES (12, N'GÓI CAO CẤP 2', N'<ul class="plan-features">
    <li>
        Giới hạn đăng: <b class="text-danger font-weight-bold">50</b> tin tuyển dụng
    </li>
    <li>
        Nhận ứng viên: <b class="text-danger font-weight-bold">100</b> trong 1 ngày
    </li>
    <li>
        Hiển thị tại việc làm <b class="text-danger font-weight-bold">Nên làm</b>
    </li>
    <li>
        Màu đặc trưng: <b class="text-danger font-weight-bold">Xanh lá</b>
    </li>
    <li>
        Xem cv: <b class="text-danger font-weight-bold">Không giới hạn</b>
    </li>
    <li>
        Ưu tiên nhận ứng viên tốt
    </li>
    <li>
        Tải pdf ứng viên không giới hạn
    </li>
    <li>
        1 phiếu quảng cáo tại QuickJob 3 ngày
    </li>
    <li>
        Xem được bài tuyển dụng mẫu tốt nhất.
    </li>
    <li>
        <i class="fa fa-times-circle text-danger"></i>
    </li>
    <li>
        <i class="fa fa-times-circle text-danger"></i>
    </li>
</ul>', 20000, 21, 1, 2)
INSERT [dbo].[Pakages] ([pakage_id], [pakage_name], [pakage_note], [pakage_money], [pakage_precent], [pakage_active], [role_id]) VALUES (13, N'GÓI PROFESSIONAL', N'<ul class="plan-features">
    <li>
        Giới hạn đăng: <b class="text-danger font-weight-bold">80</b> tin tuyển dụng
    </li>
    <li>
        Nhận ứng viên: <b class="text-danger font-weight-bold">200</b> trong 1 ngày
    </li>
    <li>
        Hiển thị tại việc làm <b class="text-danger font-weight-bold">Hấp dẫn</b>
    </li>
    <li>
        Màu đặc trưng: <b class="text-danger font-weight-bold">Cam</b>
    </li>
    <li>
        Xem cv: <b class="text-danger font-weight-bold">Không giới hạn</b>
    </li>
    <li>
        Ưu tiên nhận ứng viên tốt
    </li>
    <li>
        Tải pdf ứng viên không giới hạn
    </li>
    <li>
        1 phiếu quảng cáo tại QuickJob 1 tuần
    </li>
    <li>
        Xem được bài tuyển dụng mẫu tốt nhất.
    </li>
    <li>
        Có trang cá nhân chuyển nghiệp.
    </li>
    <li>
        <i class="fa fa-times-circle text-danger"></i>
    </li>
</ul>', 20000, 17, 1, 2)
INSERT [dbo].[Pakages] ([pakage_id], [pakage_name], [pakage_note], [pakage_money], [pakage_precent], [pakage_active], [role_id]) VALUES (14, N'GÓI MAX PRO', N'<ul class="plan-features">
    <li>
        Giới hạn đăng: <b class="text-danger font-weight-bold">120</b> tin tuyển dụng
    </li>
    <li>
        Nhận ứng viên: <b class="text-danger font-weight-bold">300</b> trong 1 ngày
    </li>
    <li>
        Hiển thị tại việc làm <b class="text-danger font-weight-bold">Tốt nhất</b>
    </li>
    <li>
        Màu đặc trưng: <b class="text-danger font-weight-bold">Đỏ</b>
    </li>
    <li>
        Xem cv: <b class="text-danger font-weight-bold">Không giới hạn</b>
    </li>
    <li>
        Ưu tiên nhận ứng viên tốt
    </li>
    <li>
        Tải pdf ứng viên không giới hạn
    </li>
    <li>
        1 phiếu quảng cáo tại QuickJob 1 tuần
    </li>
    <li>
        Xem được bài tuyển dụng mẫu tốt nhất.
    </li>
    <li>
        Có trang cá nhân chuyển nghiệp.
    </li>
    <li>
        Tối ưu tin tuyển dụng, nhận được nhiều hồ sơ.
    </li>
</ul>', 20000, 29, 1, 2)
SET IDENTITY_INSERT [dbo].[Pakages] OFF
GO
SET IDENTITY_INSERT [dbo].[Provices] ON 

INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (1, N'An Giang')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (2, N'Bà Rịa - Vũng Tàu')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (3, N'Bắc Giang')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (4, N'Bắc Kạn')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (5, N'Bạc Liêu')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (6, N'Bắc Ninh')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (7, N'Bến Tre')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (8, N'Bình Định')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (9, N'Bình Dương')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (10, N'Bình Phước')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (11, N'Bình Thuận')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (12, N'Cà Mau')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (13, N'Cần Thơ')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (14, N'Cao Bằng')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (15, N'Đà Nẵng')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (16, N'Đắk Lắk')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (17, N'Đắk Nông')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (18, N'Điện Biên')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (19, N'Đồng Nai')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (20, N'Đồng Tháp')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (21, N'Gia Lai')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (22, N'Hà Giang')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (23, N'Hà Nam')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (24, N'Hà Nội')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (25, N'Hà Tĩnh')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (26, N'Hải Dương')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (27, N'Hải Phòng')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (28, N'Hậu Giang')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (29, N'Hòa Bình')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (30, N'Hưng Yên')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (31, N'Khánh Hòa')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (32, N'Kiên Giang')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (33, N'Kon Tum')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (34, N'Lai Châu')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (35, N'Lâm Đồng')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (36, N'Lạng Sơn')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (37, N'Lào Cai')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (38, N'Long An')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (39, N'Nam Định')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (40, N'Nghệ An')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (41, N'Ninh Bình')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (42, N'Ninh Thuận')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (43, N'Phú Thọ')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (44, N'Phú Yên')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (45, N'Quảng Bình')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (46, N'Quảng Nam')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (47, N'Quảng Ngãi')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (48, N'Quảng Ninh')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (49, N'Quảng Trị')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (50, N'Sóc Trăng')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (51, N'Sơn La')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (52, N'Tây Ninh')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (53, N'Thái Bình')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (54, N'Thái Nguyên')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (55, N'Thanh Hóa')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (56, N'Thừa Thiên Huế')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (57, N'Tiền Giang')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (58, N'Thành phố Hồ Chí Minh')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (59, N'Trà Vinh')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (60, N'Tuyên Quang')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (61, N'Vĩnh Long')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (62, N'Vĩnh Phúc')
INSERT [dbo].[Provices] ([provice_id], [provice_name]) VALUES (63, N'Yên Bái')
SET IDENTITY_INSERT [dbo].[Provices] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([role_id], [role_name]) VALUES (1, N'Ứng viên')
INSERT [dbo].[Roles] ([role_id], [role_name]) VALUES (2, N'Nhà tuyển dụng')
INSERT [dbo].[Roles] ([role_id], [role_name]) VALUES (3, N'Admin')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[SubmitCv] ON 

INSERT [dbo].[SubmitCv] ([sb_id], [user_id], [job_id], [sb_datecreate], [sb_active], [sb_notecandidate], [sb_noteemployer], [sb_update], [cv_id]) VALUES (1, 1, 2, CAST(N'2021-04-10T17:33:47.340' AS DateTime), 3, N'sasas', N'Chúng tôi thấy CV của bạn không phù hợp với công ty. Bạn có thể chỉnh sửa lại Cv và ứng tuyển lại các công việc. Nếu phù hợp chúng tôi sẽ chấp nhận ứng tuyển bạn.', CAST(N'2021-04-10T20:38:39.780' AS DateTime), 4)
INSERT [dbo].[SubmitCv] ([sb_id], [user_id], [job_id], [sb_datecreate], [sb_active], [sb_notecandidate], [sb_noteemployer], [sb_update], [cv_id]) VALUES (3, 6, 2, CAST(N'2021-04-10T17:33:47.340' AS DateTime), 1, N'Em muốn làm ok', NULL, CAST(N'2021-04-10T17:33:47.340' AS DateTime), 7)
INSERT [dbo].[SubmitCv] ([sb_id], [user_id], [job_id], [sb_datecreate], [sb_active], [sb_notecandidate], [sb_noteemployer], [sb_update], [cv_id]) VALUES (1003, 5, 2, CAST(N'2021-04-10T19:16:57.693' AS DateTime), 3, NULL, N'Chúng tôi thấy CV của bạn không phù hợp với công ty. Bạn có thể chỉnh sửa lại Cv và ứng tuyển lại các công việc. Nếu phù hợp chúng tôi sẽ chấp nhận ứng tuyển bạn.', CAST(N'2021-04-15T14:20:24.843' AS DateTime), 6)
INSERT [dbo].[SubmitCv] ([sb_id], [user_id], [job_id], [sb_datecreate], [sb_active], [sb_notecandidate], [sb_noteemployer], [sb_update], [cv_id]) VALUES (1004, 1006, 2, CAST(N'2021-04-10T20:18:03.140' AS DateTime), 3, NULL, N'Chúng tôi thấy CV của bạn không phù hợp với công ty. Bạn có thể chỉnh sửa lại Cv và ứng tuyển lại các công việc. Nếu phù hợp chúng tôi sẽ chấp nhận ứng tuyển bạn.', CAST(N'2021-04-12T18:47:24.777' AS DateTime), 1007)
SET IDENTITY_INSERT [dbo].[SubmitCv] OFF
GO
SET IDENTITY_INSERT [dbo].[SubmitJob] ON 

INSERT [dbo].[SubmitJob] ([sj_id], [user_id], [job_id], [sj_note], [sj_datecreate], [cv_id]) VALUES (4, 4, 2, N'mời', CAST(N'2021-04-11T13:38:32.257' AS DateTime), 1007)
SET IDENTITY_INSERT [dbo].[SubmitJob] OFF
GO
SET IDENTITY_INSERT [dbo].[Themes] ON 

INSERT [dbo].[Themes] ([theme_id], [theme_name], [theme_img], [theme_note], [theme_view], [theme_datecreate], [theme_active], [theme_version]) VALUES (1, N'Mẫu CV tiêu chuẩn', N'mau-cv-default.jpg', N'Mẫu CV tiêu chuẩn phù hợp với nhiều ngành nghề, dễ sử dụng', 1, CAST(N'2021-03-14T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Themes] ([theme_id], [theme_name], [theme_img], [theme_note], [theme_view], [theme_datecreate], [theme_active], [theme_version]) VALUES (2, N'Mẫu CV sinh viên', N'mau-cv-tiny_1.jpg', N'Mẫu CV tiêu chuẩn phù hợp với nhiều ngành nghề, dễ sử dụng', 1, CAST(N'2021-03-14T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Themes] ([theme_id], [theme_name], [theme_img], [theme_note], [theme_view], [theme_datecreate], [theme_active], [theme_version]) VALUES (3, N'Mẫu CV kỹ thuật phần mềm', N'mau-cv-software_engineer.jpg', N'Mẫu CV tiêu chuẩn phù hợp với nhiều ngành nghề, dễ sử dụng', 1, CAST(N'2021-03-14T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Themes] ([theme_id], [theme_name], [theme_img], [theme_note], [theme_view], [theme_datecreate], [theme_active], [theme_version]) VALUES (4, N'Mẫu CV chuyên nghiệp ấn tượng', N'mau-cv-impressive_pro.jpg', N'Mẫu CV tiêu chuẩn phù hợp với nhiều ngành nghề, dễ sử dụng', 1, CAST(N'2021-03-14T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Themes] ([theme_id], [theme_name], [theme_img], [theme_note], [theme_view], [theme_datecreate], [theme_active], [theme_version]) VALUES (5, N'Mẫu CV chuyên nghiệp 2', N'mau-cv-pro_2.jpg', N'Mẫu CV tiêu chuẩn phù hợp với nhiều ngành nghề, dễ sử dụng', 1, CAST(N'2021-03-14T00:00:00.000' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[Themes] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeJobs] ON 

INSERT [dbo].[TypeJobs] ([type_id], [type_name]) VALUES (1, N'Toàn thời gian')
INSERT [dbo].[TypeJobs] ([type_id], [type_name]) VALUES (2, N'Bán thời gian')
INSERT [dbo].[TypeJobs] ([type_id], [type_name]) VALUES (3, N'Thực tập')
INSERT [dbo].[TypeJobs] ([type_id], [type_name]) VALUES (4, N'Remote - Làm việc từ x')
SET IDENTITY_INSERT [dbo].[TypeJobs] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [user_email], [user_pass], [user_active], [user_option], [user_datecreate], [user_dateupdate], [user_img], [user_sex], [user_birth], [user_favourite], [role_id], [user_name], [user_phone], [employer_company], [provice_id], [employer_banner], [employer_logo], [employer_introduce], [employer_favourite], [employer_amount], [user_note], [employer_pageload], [employer_youtube], [user_key], [wp_id], [employer_addpress], [version_id], [user_deadline], [employer_amoutjob]) VALUES (1, N'huynhminhtan4019@gmail.com', N'284eda83581e2939126579a8e4f6531b', 1, 1, CAST(N'2021-04-08T15:54:56.733' AS DateTime), CAST(N'2021-04-08T15:54:56.733' AS DateTime), N'129ecade-6236-4019-99a9-fd63218e6f1bBenefits-of-Using-VUE.JS.jpeg', 1, CAST(N'2021-04-24T00:00:00.000' AS DateTime), N'Thích code', 1, N'Tấn Huỳnh', N'0924404019', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, CAST(N'2022-04-10T12:35:49.367' AS DateTime), NULL)
INSERT [dbo].[Users] ([user_id], [user_email], [user_pass], [user_active], [user_option], [user_datecreate], [user_dateupdate], [user_img], [user_sex], [user_birth], [user_favourite], [role_id], [user_name], [user_phone], [employer_company], [provice_id], [employer_banner], [employer_logo], [employer_introduce], [employer_favourite], [employer_amount], [user_note], [employer_pageload], [employer_youtube], [user_key], [wp_id], [employer_addpress], [version_id], [user_deadline], [employer_amoutjob]) VALUES (2, N'huynhminhtan4019@gmail.com', N'284eda83581e2939126579a8e4f6531b', 1, 1, CAST(N'2021-04-08T21:56:49.333' AS DateTime), CAST(N'2021-04-08T21:56:49.333' AS DateTime), N'146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png', 1, NULL, NULL, 2, N'Tấn Huỳnh', N'0924404019', N'FPT SOFTWARE', 1, N'd870e804-6b8d-4d43-ac49-fffd7b6bb598Rab27a5af98ddba86f945c3b93d1e3ad2.png', N'1c4b0a97-0f92-47be-b4ce-949510592bbcsass.jpeg', N'<p>as</p>', N'<p>as</p>', 4, NULL, 0, N'as', N'7cec83b5-090c-4d57-aa17-fd770d27f0de', 7, N' 146 Nguyễn Đình Chiểu, Phường 6, Quận 3, TP. HCM.', 1, NULL, NULL)
INSERT [dbo].[Users] ([user_id], [user_email], [user_pass], [user_active], [user_option], [user_datecreate], [user_dateupdate], [user_img], [user_sex], [user_birth], [user_favourite], [role_id], [user_name], [user_phone], [employer_company], [provice_id], [employer_banner], [employer_logo], [employer_introduce], [employer_favourite], [employer_amount], [user_note], [employer_pageload], [employer_youtube], [user_key], [wp_id], [employer_addpress], [version_id], [user_deadline], [employer_amoutjob]) VALUES (3, N'huynhminhtan4019@gmail.com', N'284eda83581e2939126579a8e4f6531b', 1, 1, CAST(N'2021-04-08T21:56:49.333' AS DateTime), CAST(N'2021-04-08T21:56:49.333' AS DateTime), N'146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png', NULL, NULL, NULL, 3, N'Tấn Huỳnh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Users] ([user_id], [user_email], [user_pass], [user_active], [user_option], [user_datecreate], [user_dateupdate], [user_img], [user_sex], [user_birth], [user_favourite], [role_id], [user_name], [user_phone], [employer_company], [provice_id], [employer_banner], [employer_logo], [employer_introduce], [employer_favourite], [employer_amount], [user_note], [employer_pageload], [employer_youtube], [user_key], [wp_id], [employer_addpress], [version_id], [user_deadline], [employer_amoutjob]) VALUES (4, N'pasal@gmail.com', N'284eda83581e2939126579a8e4f6531b', 1, 1, CAST(N'2021-04-09T17:27:50.250' AS DateTime), CAST(N'2021-04-09T17:27:50.250' AS DateTime), N'146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png', 1, NULL, NULL, 2, N'Huỳnh Minh Tấn 1', N'0924404019', N'Công ty Cổ Phần Đầu tư Giáo dục Và Phát triển Nguồn Lực Quốc Tế Pasal', 24, N'b1c78609-2880-4abd-8575-16f7e3066610cong-ty-co-phan-dau-tu-giao-duc-va-phat-trien-nguon-luc-quoc-te-pasal-28b7b2c0a54d917e3a2c9a5f258b8623-5f17b302edc71.jpg', N'ffc3676d-eaa7-47e3-b93e-4802ff672c87cong-ty-co-phan-dau-tu-giao-duc-va-phat-trien-nguon-luc-quoc-te-pasal-5ad4093c6754b_rs.jpg', N'<p>Tổ chức giáo dục Pasal là nơi hội tụ của những người trẻ chứa đựng khát khao thay đổi tiếng Anh và tư duy của thế hệ trẻ Việt Nam để thành công trên con đường sự nghiệp đầy năng động và thách thức sau này. Họ đã tìm ra “Đam mê” đích thực của mình với sự nghiệp đào tạo tiếng Anh và sẻ chia giá trị cho các bạn Sinh viên Việt Nam với khát vọng to lớn về tương lai của đất nước và hình ảnh con người Việt Nam khắp bốn bể năm châu.</p><p>Với môi trường làm việc No Boss_Staff, được trao quyền, mọi người có thể nói lên được suy nghĩ, ý kiến của bản thân.Tại đây chúng tôi hi vọng có thể là nơi đồng hành và phát triển cùng các bạn đồng nghiệp, phát triển về công việc, phát triển về bản thân tiến tới nắm giữ những vị trí chủ chốt của công ty ( GD cơ sở, góp cổ phần...)</p><p>Trong năm 2015, Pasal vinh dự là đối tác độc quyền cung cấp hệ thống học hiện đại nhất hiện nay - Effortless English Online. Tiến sĩ AJ.Hoge và Tổ chức đào tạo tiếng Anh giao tiếp Pasal sẽ cùng nhau hợp tác trong các dự án liên quan đến nghiên cứu và phát triển các phương pháp, bài học tài liệu giáo trình học tiếng Anh phù hợp với người Việt Nam. Và trong tương lai gần, không chỉ giới hạn tại Việt Nam, Pasal sẽ trở thành đối tác độc quyền chương trình học mới nhất hiện nay của tiến sĩ AJ.Hoge tại toàn bộ khu vực Đông Nam Á.</p><p>&nbsp;</p><p>Hãy chung tay cùng chúng tôi vì một hình ảnh người trẻ Việt Nam toàn diện!</p>', N'<p><br><strong>CHÍNH SÁCH PHÁT TRIỂN NHÂN LỰC</strong></p><p>Trog những năm tới, Pasal hướng tới đào tạo, nâng cao nguồn nhân lực. Tạo cho các bạn môi trường phát triển và đồng hành cùng Pasal.</p><p><strong>CƠ HỘI THĂNG TIẾN</strong></p><p>Đến với Pasal" Ai cũng quan trọng, không ai quan trọng hơn ai". Chúng tôi hướng tới đào tạo phát triển những nhân lực trẻ, nhiệt huyết tiến xa hơn. Cơ hội lên những vị trí chủ chốt của công ty luôn chào đón các bạn.</p><p><strong>LƯƠNG, THƯỞNG, LỢI NHUẬN</strong></p><p>Bảo hiểm, teambuilding hàng năm và tặng khóa học tiếng anh free cho nhân viên.</p>', 500, NULL, 1, N'<iframe width="560" height="315" src="https://www.youtube.com/embed/4Pw-Y_ANuwQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>', N'3a562e67-b46d-4953-8e54-14a946f91c7f', 3, N'Tầng 4, Số 346 đường Nguyễn Trãi, Thanh Xuân, Hà Nội', 4, CAST(N'2021-05-15T15:42:41.563' AS DateTime), 53)
INSERT [dbo].[Users] ([user_id], [user_email], [user_pass], [user_active], [user_option], [user_datecreate], [user_dateupdate], [user_img], [user_sex], [user_birth], [user_favourite], [role_id], [user_name], [user_phone], [employer_company], [provice_id], [employer_banner], [employer_logo], [employer_introduce], [employer_favourite], [employer_amount], [user_note], [employer_pageload], [employer_youtube], [user_key], [wp_id], [employer_addpress], [version_id], [user_deadline], [employer_amoutjob]) VALUES (5, N'laptring@gmail.com', N'd3f8f37ebf778f37074a740531eb09f2', 1, 1, CAST(N'2021-04-10T16:37:11.530' AS DateTime), CAST(N'2021-04-10T16:37:11.530' AS DateTime), N'146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png', NULL, NULL, NULL, 1, N'Huỳnh Minh Tấn 4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'4421dfef-4cfe-465e-87ff-53555dc6ccb9', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Users] ([user_id], [user_email], [user_pass], [user_active], [user_option], [user_datecreate], [user_dateupdate], [user_img], [user_sex], [user_birth], [user_favourite], [role_id], [user_name], [user_phone], [employer_company], [provice_id], [employer_banner], [employer_logo], [employer_introduce], [employer_favourite], [employer_amount], [user_note], [employer_pageload], [employer_youtube], [user_key], [wp_id], [employer_addpress], [version_id], [user_deadline], [employer_amoutjob]) VALUES (6, N'huynhminhtan4019122@gmail.com', N'd3f8f37ebf778f37074a740531eb09f2', 1, 1, CAST(N'2021-04-10T17:32:54.870' AS DateTime), CAST(N'2021-04-10T17:32:54.870' AS DateTime), N'146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png', NULL, NULL, NULL, 1, N'Huỳnh Minh Tấn 2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'b6da93c7-95dd-42a4-a866-e43f60150162', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Users] ([user_id], [user_email], [user_pass], [user_active], [user_option], [user_datecreate], [user_dateupdate], [user_img], [user_sex], [user_birth], [user_favourite], [role_id], [user_name], [user_phone], [employer_company], [provice_id], [employer_banner], [employer_logo], [employer_introduce], [employer_favourite], [employer_amount], [user_note], [employer_pageload], [employer_youtube], [user_key], [wp_id], [employer_addpress], [version_id], [user_deadline], [employer_amoutjob]) VALUES (1006, N'huynhminhtan1224019@gmail.com', N'd3f8f37ebf778f37074a740531eb09f2', 1, 1, CAST(N'2021-04-10T20:17:19.040' AS DateTime), CAST(N'2021-04-10T20:17:19.040' AS DateTime), N'146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png', NULL, NULL, NULL, 1, N'Huỳnh Minh Tấn 3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'b0e39b83-3b58-4cbb-bffc-b0ce405a464e', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Users] ([user_id], [user_email], [user_pass], [user_active], [user_option], [user_datecreate], [user_dateupdate], [user_img], [user_sex], [user_birth], [user_favourite], [role_id], [user_name], [user_phone], [employer_company], [provice_id], [employer_banner], [employer_logo], [employer_introduce], [employer_favourite], [employer_amount], [user_note], [employer_pageload], [employer_youtube], [user_key], [wp_id], [employer_addpress], [version_id], [user_deadline], [employer_amoutjob]) VALUES (1007, N'huynhminhtan40194019@gmail.com', N'b21cb6d4f166b902da965d1135cbf276', 1, 1, CAST(N'2021-04-15T11:51:00.140' AS DateTime), CAST(N'2021-04-15T11:51:00.140' AS DateTime), N'81efd5ab-9db5-487d-bbd7-629cdb05ecd332644928_2062295167425734_7686714948314988544_n.jpg', 1, CAST(N'2021-04-17T00:00:00.000' AS DateTime), N'Thích code', 1, N'Huỳnh Minh Tấn', N'0924404019', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'36012721-5664-4ce9-9d5b-3b73da2b787b', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Users] ([user_id], [user_email], [user_pass], [user_active], [user_option], [user_datecreate], [user_dateupdate], [user_img], [user_sex], [user_birth], [user_favourite], [role_id], [user_name], [user_phone], [employer_company], [provice_id], [employer_banner], [employer_logo], [employer_introduce], [employer_favourite], [employer_amount], [user_note], [employer_pageload], [employer_youtube], [user_key], [wp_id], [employer_addpress], [version_id], [user_deadline], [employer_amoutjob]) VALUES (1008, N'generali@gmail.com', N'd3f8f37ebf778f37074a740531eb09f2', 1, 1, CAST(N'2021-04-15T15:59:05.540' AS DateTime), CAST(N'2021-04-15T15:59:05.540' AS DateTime), N'146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png', 1, NULL, NULL, 2, N'Huỳnh Minh Tấn', N'0924404019', N'GENERALI VIỆT NAM', 58, N'1eb3a88e-9cc3-48d0-a1fb-92b20397adb1s7obxAVS8I9BL3g4IZC0.jpg', N'470838db-f2fc-4c34-8e44-65473c016ab2generali-viet-nam-600a6bd730b20 (1).jpg', N'<p>Generali Vietnam is a member of Generali Group – an independent, Italian Group, with a strong international presence. Established in 1831, it is among the world’s leading insurers and it is present in over 60 countries with total premium income exceeding €70 billion in 2016. With over 74,000 employees in the world, and 55 million clients, the Group has a leading position in Europe and an increasingly significant presence Asia and South America. Generali is the only insurance company to be included in the “Top 50 Smartest Companies” in the world by MIT Technology Review in 2015. Generali was also included among the most sustainable companies in the world by the Corporate Knights ranking. In 2017, Generali Net Promoter System has been recognized as world’s best by Medallia – a global leader in Customer Experience management, consulting and softwar</p>', N'<p>Generali Vietnam is a member of Generali Group – an independent, Italian Group, with a strong international presence. Established in 1831, it is among the world’s leading insurers and it is present in over 60 countries with total premium income exceeding €70 billion in 2016. With over 74,000 employees in the world, and 55 million clients, the Group has a leading position in Europe and an increasingly significant presence Asia and South America. Generali is the only insurance company to be included in the “Top 50 Smartest Companies” in the world by MIT Technology Review in 2015. Generali was also included among the most sustainable companies in the world by the Corporate Knights ranking. In 2017, Generali Net Promoter System has been recognized as world’s best by Medallia – a global leader in Customer Experience management, consulting and softwar</p>', 499, NULL, 1, NULL, N'b659df8a-783a-47f3-808b-613bd798a9a4', 1, N'43-45 Lý Chính Thắng, Phường 7, Quận 3', 1, NULL, 3)
INSERT [dbo].[Users] ([user_id], [user_email], [user_pass], [user_active], [user_option], [user_datecreate], [user_dateupdate], [user_img], [user_sex], [user_birth], [user_favourite], [role_id], [user_name], [user_phone], [employer_company], [provice_id], [employer_banner], [employer_logo], [employer_introduce], [employer_favourite], [employer_amount], [user_note], [employer_pageload], [employer_youtube], [user_key], [wp_id], [employer_addpress], [version_id], [user_deadline], [employer_amoutjob]) VALUES (1009, N'hrchannels@gmail.com', N'd3f8f37ebf778f37074a740531eb09f2', 1, 1, CAST(N'2021-04-15T16:36:30.100' AS DateTime), CAST(N'2021-04-15T16:36:30.100' AS DateTime), N'146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png', 1, NULL, NULL, 2, N'Huỳnh Minh Tấn', N'0924404019', N'Công ty cổ phần giải pháp Nhân Sự Việt Nam', 24, N'satisfied-job.jpg', N'0c3c8072-aa0b-4e0e-9880-efe187c8bbabcong-ty-co-phan-giai-phap-nhan-su-viet-nam-5cf768b0a2545.jpg', N'<p>HRchannels Group với slogan "Giải pháp tốt, Con người tốt" đã trở thành tuyên bố sứ sứ mệnh của chúng tôi đối với ứng viên cũng như Nhà tuyển dụng. Sứ mệnh đó cùng với lòng tin vững chắc của các doanh nghiệp đã giúp chúng tôi thành công trong suốt hơn 10 năm qua để mang dịch vụ nhân sự chuyên nghiệp tới khách hàng, trong đó có cả doanh nghiệp lớn trong nước cũng như những doanh nghiệp trong Top Fortune 500 Global.</p><p>Các vị trí tuyển dụng cấp cao được cập nhật hàng ngày tại www.HRchannels.com</p>', N'<p>HRchannels Group với slogan "Giải pháp tốt, Con người tốt" đã trở thành tuyên bố sứ sứ mệnh của chúng tôi đối với ứng viên cũng như Nhà tuyển dụng. Sứ mệnh đó cùng với lòng tin vững chắc của các doanh nghiệp đã giúp chúng tôi thành công trong suốt hơn 10 năm qua để mang dịch vụ nhân sự chuyên nghiệp tới khách hàng, trong đó có cả doanh nghiệp lớn trong nước cũng như những doanh nghiệp trong Top Fortune 500 Global.</p><p>Các vị trí tuyển dụng cấp cao được cập nhật hàng ngày tại www.HRchannels.com</p>', 500, NULL, 1, NULL, N'f74757db-e4d0-4700-9023-fd6870f46c5b', 1, N'Tầng 10 Tòa CIT ngõ 15 Duy Tân Cầu Giấy Hà Nội', 1, NULL, 3)
INSERT [dbo].[Users] ([user_id], [user_email], [user_pass], [user_active], [user_option], [user_datecreate], [user_dateupdate], [user_img], [user_sex], [user_birth], [user_favourite], [role_id], [user_name], [user_phone], [employer_company], [provice_id], [employer_banner], [employer_logo], [employer_introduce], [employer_favourite], [employer_amount], [user_note], [employer_pageload], [employer_youtube], [user_key], [wp_id], [employer_addpress], [version_id], [user_deadline], [employer_amoutjob]) VALUES (1010, N'ntv@gmail.com', N'd3f8f37ebf778f37074a740531eb09f2', 1, 1, CAST(N'2021-04-15T17:33:12.730' AS DateTime), CAST(N'2021-04-15T17:33:12.730' AS DateTime), N'146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png', 1, NULL, NULL, 2, N'Huỳnh Minh Tấn', N'0924404019', N'CÔNG TY TNHH TƯ VẤN VÀ KỸ THUẬT NAM TRUNG VIỆT', 24, N'satisfied-job.jpg', N'3bde1f32-3b20-491f-9dae-e93d943585c1cong-ty-tnhh-tu-van-va-ky-thuat-nam-trung-viet-607047499adb0.jpg', N'<p>CÔNG TY TNHH TƯ VẤN VÀ KỸ THUẬT NAM TRUNG VIỆT đang hợp tác với Công ty HH tập đoàn Cục 6 Đường sắt Trung Quốc chuyên hoạt động trong lĩnh vực xây dựng đường sắt, đường bộ, bệnh viện, cao ốc, khu dịch vụ… Hiện nay là Tổng thầu Dự án Đường sắt đô thị Hà Nội tuyến Cát Linh, Hà Đông.&nbsp;</p>', N'<p>CÔNG TY TNHH TƯ VẤN VÀ KỸ THUẬT NAM TRUNG VIỆT đang hợp tác với Công ty HH tập đoàn Cục 6 Đường sắt Trung Quốc chuyên hoạt động trong lĩnh vực xây dựng đường sắt, đường bộ, bệnh viện, cao ốc, khu dịch vụ… Hiện nay là Tổng thầu Dự án Đường sắt đô thị Hà Nội tuyến Cát Linh, Hà Đông.&nbsp;</p>', 500, NULL, 1, NULL, N'eab085c9-33c2-4e82-8672-5b51e810ecc5', 5, N'333 khu đô thị Lacasta, Văn Phú, Hà Đông, Hà Nội', 4, CAST(N'2021-05-23T11:50:05.993' AS DateTime), 50)
INSERT [dbo].[Users] ([user_id], [user_email], [user_pass], [user_active], [user_option], [user_datecreate], [user_dateupdate], [user_img], [user_sex], [user_birth], [user_favourite], [role_id], [user_name], [user_phone], [employer_company], [provice_id], [employer_banner], [employer_logo], [employer_introduce], [employer_favourite], [employer_amount], [user_note], [employer_pageload], [employer_youtube], [user_key], [wp_id], [employer_addpress], [version_id], [user_deadline], [employer_amoutjob]) VALUES (1011, N'laptring123@gmail.com', N'b21cb6d4f166b902da965d1135cbf276', 1, 1, CAST(N'2021-04-23T11:42:08.053' AS DateTime), CAST(N'2021-04-23T11:42:08.053' AS DateTime), N'146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png', NULL, NULL, NULL, 1, N'Tấn Huỳnh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'7d2b2275-d628-4ccd-8066-f4cd0545ae39', NULL, NULL, 2, CAST(N'2022-04-23T11:42:46.867' AS DateTime), NULL)
INSERT [dbo].[Users] ([user_id], [user_email], [user_pass], [user_active], [user_option], [user_datecreate], [user_dateupdate], [user_img], [user_sex], [user_birth], [user_favourite], [role_id], [user_name], [user_phone], [employer_company], [provice_id], [employer_banner], [employer_logo], [employer_introduce], [employer_favourite], [employer_amount], [user_note], [employer_pageload], [employer_youtube], [user_key], [wp_id], [employer_addpress], [version_id], [user_deadline], [employer_amoutjob]) VALUES (1012, N'longa@gmail.com', N'd3f8f37ebf778f37074a740531eb09f2', 1, 1, CAST(N'2021-04-23T12:44:23.830' AS DateTime), CAST(N'2021-04-23T12:44:23.830' AS DateTime), N'146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png', 1, NULL, NULL, 2, N'Tấn Huỳnh', N'0924404019', N'Công ty TNHH Thương Mại Long Á', 24, N'8702c3a4-16ad-4ca9-9ce9-f36871d643b0cong-ty-tnhh-thuong-mai-long-a-a872be6d72f23b141f3cc5e4c1a9944b-605077d2ce246.jpg', N'a022e6b7-4ba0-4521-908c-3e2ef4fb99c9cong-ty-tnhh-thuong-mai-long-a-5f9bedffb2df4.jpg', N'<p>Công ty TNHH thương mại Long Á là nhà phân phối độc quyền của hãng Văn Phòng Phẩm Deli tại Việt Nam.Trải qua 10 năm triển khai sản phẩm Deli, hiện nay chúng tôi có thể tự hào vì sản phẩm Deli đã có mặt trên tất cả các tỉnh thành trên toàn quốc với hệ thống phân phối cũng như các đại lý rộng khắp. Nhấn mạnh vào việc cung cấp các sản phẩm tiết kiệm chi phí nhất cho người tiêu dùng.</p><p>Tự hào là một trong những nhãn hàng văn phòng phẩm lớn nhất tại Việt Nam, Deli Việt Nam không ngừng nỗ lực và phát triển trong lĩnh vực phân phối các sản phẩm cho các đơn vị văn phòng, trường học,... Với phương châm sản xuất những sản phẩm chất lượng tốt nhất và luôn đặt khách hàng làm trọng tâm, sứ mệnh của Deli là làm hài hòng người tiêu dùng toàn cầu với những sản phẩm chất lượng cao, độ tin cậy tuyệt đối và thân thiện với người dùng.&nbsp;</p><p>Năm 2020 là một năm thành công của Deli Việt Nam khi đã phủ sóng trên hầu hết các sàn Thương mại Điện tử uy tín. Đối với một thương hiệu còn non trẻ như Deli, chúng tôi luôn nỗ lực thay đổi từng ngày để phù hợp với thị hiếu của người tiêu dùng Việt Nam.&nbsp;&nbsp;</p><p>Trụ sở:&nbsp;</p><p>- Hà Nội: Tầng 4, Tòa nhà 189 Nghi Tàm, Tây Hồ, Hà Nội</p><p>- Hồ Chí Minh: 23C Lũy Bán Bích, Tân Thới Hòa, Tân Phú, Tp HCM</p><p>&nbsp;</p><p><a href="https://shopee.vn/shop/127805122/search?page=0&amp;shopCollection=32776850"><strong>Họa Cụ</strong></a></p><p>Sản phẩm được sản xuất với mục đích phục vụ mỹ thuật. Với nhiều sản phẩm thích hợp cho những người từ mới bắt đầu đến chuyên nghiệp.<br>- Màu vẽ chất liệu đa dạng, màu sắc sặc sỡ, tươi sáng và độ che phủ tốt,…có thể sử dụng suốt thời gian dài, được sản xuất từ nguyên liệu chất lượng cao, đã được kiểm tra và chứng nhận.<br>- Dụng cụ hỗ trợ: Khay pha màu, bút chì phác thảo, giấy vẽ chuyên dụng, bộ cọ vẽ, tẩy đa năng...</p><p><a href="https://shopee.vn/shop/127805122/search?page=0&amp;shopCollection=32776850"><strong>Tìm hiểu thêm</strong></a></p><figure class="image"><img src="https://static.topcv.vn/premium_companies/services/735e82b56e001deb3a76ac16c37b3a6c-60370327c2774.jpg"></figure><figure class="image"><img src="https://static.topcv.vn/premium_companies/services/d2cf377a2c87cfc22de5ab2b98daa64a-60370362af0f5.jpg"></figure><p><a href="https://shopee.vn/shop/127805122/search?page=0"><strong>Đồ dùng học sinh</strong></a></p><p>Deli có đầy đủ các dụng cụ phục vụ cho tất cả các môn học. Sản phẩm không gây hại cho học sinh, sinh viên bởi đều được sản xuất từ chất liệu tốt, an toàn cho sức khỏe và thân thiện với môi trường. Bộ dụng cụ với màu sắc ngộ nghĩnh đáng yêu tăng hứng thú học tập, ham hiểu biết cho người dùng.<br>- Các sản phẩm: bút bi, bút màu, giấy vẽ, bộ thước, vở, sổ ghi chép, tẩy, compa, gọt bút chì, máy tính cầm tay,...</p>', N'<p><strong>CHÍNH SÁCH PHÁT TRIỂN NHÂN LỰC</strong></p><p>&nbsp;- Long Á luôn chú trọng con người là yếu tố then chốt và là tài sản quý giá. Chúng tôi hướng tới xây dựng một đội ngũ nhân viên năng động, sáng tạo, không ngừng học hỏi và nắm bắt công nghệ hiện đại.</p><p>&nbsp;- Công ty luôn tạo môi trường làm việc chuyên nghiệp, năng động, hiện đại, phát huy quyền được làm việc, cống hiến, phát triển và luôn chào đón tất cả những ứng viên mong muốn phát triển, trau dồi kinh nghiệm.</p><p><strong>CƠ HỘI THĂNG TIẾN</strong></p><p>Đến với Long Á, ứng viên có quyền được ứng cử vào các vị trí phù hợp với năng lực bản thân. Nhân viên được thể hiện và phát huy tối đa năng lực làm việc và có quyền được ứng cử vào các vị trí cao hơn. Hằng năm, công ty luôn đầu tư chi phí lớn cho việc công tác tuyển dụng, đào tạo nhân sự, xây dựng trang thiết bị hiện đại, đầy đủ.</p><p><strong>LƯƠNG, THƯỞNG, LỢI NHUẬN</strong></p><p>&nbsp;- Công ty xây dựng chính sách lương phù hợp với trình độ, năng lực và công việc của từng người, từng vị trí. Đảm bảo nhân viên hưởng đầy đủ các chế độ theo quy định của nhà nước.</p><p>- Công ty tổ chức các buổi đào tạo chuyên môn, kỹ năng, tạo điều kiện nâng cao trình độ.</p><p>- Chế độ khen thưởng theo tháng, quý, năm và thưởng đột xuất cho từng cá nhân có kết quả làm việc xuất sắc</p><p>- Hằng năm, công ty tổ chức các buổi party, du lịch, team building,...</p><p>- Công ty trích nộp bảo hiểm theo đúng quy định Nhà nước cho người lao động: BHYT, BHXH,...</p><p>- Chế độ nghỉ phép, ma chay, hiếu hỉ, sinh nhật,...</p><p>&nbsp;</p>', 500, NULL, 1, NULL, N'5f134533-1141-48a4-96f8-2e2c4994de52', 3, N'Hồ Chí Minh: 23C Lũy Bán Bích, Tân Thới Hòa, Tân Phú, Tp HCM', 6, CAST(N'2021-05-23T12:59:55.593' AS DateTime), 120)
INSERT [dbo].[Users] ([user_id], [user_email], [user_pass], [user_active], [user_option], [user_datecreate], [user_dateupdate], [user_img], [user_sex], [user_birth], [user_favourite], [role_id], [user_name], [user_phone], [employer_company], [provice_id], [employer_banner], [employer_logo], [employer_introduce], [employer_favourite], [employer_amount], [user_note], [employer_pageload], [employer_youtube], [user_key], [wp_id], [employer_addpress], [version_id], [user_deadline], [employer_amoutjob]) VALUES (1013, N'hoasen@gmail.com', N'd3f8f37ebf778f37074a740531eb09f2', 1, 1, CAST(N'2021-04-23T13:12:01.757' AS DateTime), CAST(N'2021-04-23T13:12:01.757' AS DateTime), N'146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png', 1, NULL, NULL, 2, N'Tấn Huỳnh', N'0924404019', N'CÔNG TY CỔ PHẦN TẬP ĐOÀN HOA SEN', 58, N'945026e7-6cc9-405f-a059-a5a41c6290d2cong-ty-co-phan-tap-doan-hoa-sen-7bef20231b5608ec54165567c1aba4c5-606d650d0d14c.jpg', N'63d7837d-6b4a-4c16-a35d-9df1fb23301ccong-ty-co-phan-tap-doan-hoa-sen-5abef8f2b83d1_rs.jpg', N'<p>Công ty Cổ Phần Tập Đoàn Hoa Sen là một Doanh nghiệp chuyên sản xuất và kinh doanh Tôn – Thép – Ống Nhựa - Sản phẩm Thương mại với hơn 600 chi nhánh trải dài trên cả nước.</p><p>Quy mô: Từ 5.000-10.000 người.</p><p>Chúng tôi tự hào về một nền văn hóa Doanh nghiệp đặc biệt gắn liền với sự phát triển bản thân và chia sẻ lợi ích – gánh vác trách nhiệm xã hội trên nền tảng: “Trung thực – Cộng đồng – Phát triển"</p>', N'<p>Công ty Cổ Phần Tập Đoàn Hoa Sen là một Doanh nghiệp chuyên sản xuất và kinh doanh Tôn – Thép – Ống Nhựa - Sản phẩm Thương mại với hơn 600 chi nhánh trải dài trên cả nước.</p><p>Quy mô: Từ 5.000-10.000 người.</p><p>Chúng tôi tự hào về một nền văn hóa Doanh nghiệp đặc biệt gắn liền với sự phát triển bản thân và chia sẻ lợi ích – gánh vác trách nhiệm xã hội trên nền tảng: “Trung thực – Cộng đồng – Phát triển"</p>', 1000, NULL, 1, NULL, N'55a10d78-61d2-4622-9e66-60c93881d701', 3, N'183 Nguyễn Văn Trỗi, P.10, Quận Phú Nhuận, Tp.Hồ Chí Minh', 5, CAST(N'2021-05-23T13:14:53.900' AS DateTime), 80)
INSERT [dbo].[Users] ([user_id], [user_email], [user_pass], [user_active], [user_option], [user_datecreate], [user_dateupdate], [user_img], [user_sex], [user_birth], [user_favourite], [role_id], [user_name], [user_phone], [employer_company], [provice_id], [employer_banner], [employer_logo], [employer_introduce], [employer_favourite], [employer_amount], [user_note], [employer_pageload], [employer_youtube], [user_key], [wp_id], [employer_addpress], [version_id], [user_deadline], [employer_amoutjob]) VALUES (1014, N'teky@gmail.com', N'd3f8f37ebf778f37074a740531eb09f2', 1, 1, CAST(N'2021-04-23T13:25:17.447' AS DateTime), CAST(N'2021-04-23T13:25:17.447' AS DateTime), N'146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png', NULL, NULL, NULL, 2, N'Huỳnh Minh Tấn', N'0924404019', N'CÔNG TY CỔ PHẦN CÔNG NGHỆ & SÁNG TẠO TR', 9, N'31613299-dec9-4db0-9243-dc48093e368acong-ty-co-phan-dao-tao-cong-nghe-tre-teky-74d54088cb3caf735189862db3dfafd0-5f1a9e66ac686.jpg', N'ff731639-0dbf-4ae8-9334-5c29a5247380cong-ty-co-phan-cong-nghe-sang-tao-tre-teky-holdings-605eeb05e17da.jpg', N'<p>Teky là một tổ chức đổi mới giáo dục hàng đầu tại Việt Nam với các chương trình giảng dạy công nghệ, lập trình, STEAM cho trẻ em được biết đến rộng rãi và đạt được nhiều giải thưởng quốc tế lớn. Mục tiêu của Teky là trở thành tổ chức Edtech hàng đầu khu vực, trang bị năng lực công nghệ thời đại, giúp trẻ em dẫn đầu tương lai trong thời đại 4.0; đặc biệt đem tới giải pháp công bằng trong học tập tới học sinh ở khắp các tỉnh thành trong cả nước.</p><p>Các giải thưởng Quốc tế trong lĩnh vực giáo dục:</p><p>- Một trong 14 mô hình giáo dục toàn cầu điển hình được báo cáo tại diễn đàn kinh tế thế giới</p><p>- Chương trình giảng dạy STEAM đứng top đầu trong các tổ chức giáo dục được đánh giá bởi Tổ chức giáo dục Phần Lan (EAF) - Giải thưởng châu Á về lãnh đạo công nghệ giáo dục</p><p>- Các cuộc thi lớn dành cho học sinh trong phạm vi Quốc gia và Quốc tế, Teky tham gia và được nhiều giải thưởng: Minecraft Hackathon Vietnam; The AppJamming Summit, HongKong; WeCode ASEAN; WRO… Địa chỉ Công ty:</p><p>- Văn phòng chính tại Hà Nội: Tầng 5, Tòa nhà Machino Plaza, Số 10 Trần Phú, Phường Mộ Lao, Quận Hà Đồng, Hà Nội</p><p>- Chi nhánh tại HCM: 340 Cộng Hoà, Phường 13, Quận Tân Bình, TP.Hồ Chí Minh</p><p><br>&nbsp;</p>', N'<p>Teky là một tổ chức đổi mới giáo dục hàng đầu tại Việt Nam với các chương trình giảng dạy công nghệ, lập trình, STEAM cho trẻ em được biết đến rộng rãi và đạt được nhiều giải thưởng quốc tế lớn. Mục tiêu của Teky là trở thành tổ chức Edtech hàng đầu khu vực, trang bị năng lực công nghệ thời đại, giúp trẻ em dẫn đầu tương lai trong thời đại 4.0; đặc biệt đem tới giải pháp công bằng trong học tập tới học sinh ở khắp các tỉnh thành trong cả nước.</p><p>Các giải thưởng Quốc tế trong lĩnh vực giáo dục:</p><p>- Một trong 14 mô hình giáo dục toàn cầu điển hình được báo cáo tại diễn đàn kinh tế thế giới</p><p>- Chương trình giảng dạy STEAM đứng top đầu trong các tổ chức giáo dục được đánh giá bởi Tổ chức giáo dục Phần Lan (EAF) - Giải thưởng châu Á về lãnh đạo công nghệ giáo dục</p><p>- Các cuộc thi lớn dành cho học sinh trong phạm vi Quốc gia và Quốc tế, Teky tham gia và được nhiều giải thưởng: Minecraft Hackathon Vietnam; The AppJamming Summit, HongKong; WeCode ASEAN; WRO… Địa chỉ Công ty:</p><p>- Văn phòng chính tại Hà Nội: Tầng 5, Tòa nhà Machino Plaza, Số 10 Trần Phú, Phường Mộ Lao, Quận Hà Đồng, Hà Nội</p><p>- Chi nhánh tại HCM: 340 Cộng Hoà, Phường 13, Quận Tân Bình, TP.Hồ Chí Minh</p><p><br>&nbsp;</p>', 500, NULL, 1, NULL, N'89ab876a-0cdb-4410-a6c5-0eabde5dc9ca', 3, N'Địa chỉ các học viện Teky trong phạm vi toàn quốc: - Số 422 đại lộ Bình Dương, Phường Hiệp Thành, Thành Phố Thủ Dầu 1, Bình Dương - Tầng 4, Toà nhà Sài Gòn Mall, Số 19 Cao Thắng, Phường 2, Quận 3, TP.Hồ Chí Minh - Số 340 Cộng Hoà, Phường 13, Quận Tân Bình', 6, CAST(N'2021-05-23T13:31:32.757' AS DateTime), 120)
INSERT [dbo].[Users] ([user_id], [user_email], [user_pass], [user_active], [user_option], [user_datecreate], [user_dateupdate], [user_img], [user_sex], [user_birth], [user_favourite], [role_id], [user_name], [user_phone], [employer_company], [provice_id], [employer_banner], [employer_logo], [employer_introduce], [employer_favourite], [employer_amount], [user_note], [employer_pageload], [employer_youtube], [user_key], [wp_id], [employer_addpress], [version_id], [user_deadline], [employer_amoutjob]) VALUES (1015, N'fpttelecom@gmail.com', N'd3f8f37ebf778f37074a740531eb09f2', 1, 1, CAST(N'2021-04-23T13:34:47.700' AS DateTime), CAST(N'2021-04-23T13:34:47.700' AS DateTime), N'146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png', 1, NULL, NULL, 2, N'Huỳnh Minh Tấn', N'0924404019', N'Công ty Cổ phần viễn thông FPT', 24, N'b418a77d-b1bb-42df-a1a7-eb3c75c02897cong-ty-co-phan-vien-thong-fpt-31f41267723f53b5a2973c4446b2151d-5fc9dbf2594f4.jpg', N'3807f811-5a9e-4e2b-bbbf-20e42eb378a5cong-ty-co-phan-vien-thong-fpt-5d5f5980e317c.jpg', N'<p>Là thành viên thuộc Tập đoàn công nghệ hàng đầu Việt Nam FPT, Công ty Cổ phần Viễn thông FPT (tên gọi tắt là FPT Telecom) hiện là một trong những nhà cung cấp dịch vụ viễn thông và Internet có uy tín và được khách hàng yêu mến tại Việt Nam và khu vực.</p><p>&nbsp;</p><p>Thành lập ngày 31/01/1997, khởi nguồn từ Trung tâm Dịch vụ Trực tuyến do 4 thành viên sáng lập cùng sản phẩm mạng Intranet đầu tiên của Việt Nam mang tên “Trí tuệ Việt Nam – TTVN”, sản phẩm được coi là đặt nền móng cho sự phát triển của Internet tại Việt Nam. Sau 20 năm hoạt động, FPT Telecom đã lớn mạnh vượt bậc với hơn 7,000 nhân viên chính thức, gần 200 văn phòng điểm giao dịch thuộc hơn 80 chi nhánh tại 59 tỉnh thành trên toàn quốc. Bên cạnh đó, Công ty đã và đang đặt dấu ấn trên trường quốc tế bằng 8 chi nhánh trải dài khắp Campuchia, cũng như việc được cấp giấy phép kinh doanh dịch vụ tại Myanmar.</p><p>&nbsp;</p><p>Với sứ mệnh tiên phong đưa Internet đến với người dân Việt Nam và mong muốn mỗi gia đình Việt Nam đều sử dụng ít nhất một dịch vụ của FPT Telecom, đồng hành cùng phương châm “Khách hàng là trọng tâm”, chúng tôi không ngừng nỗ lực đầu tư hạ tầng, nâng cấp chất lượng sản phẩm – dịch vụ, tăng cường ứng dụng công nghệ mới để mang đến cho khách hàng những trải nghiệm sản phẩm dịch vụ vượt trội.</p><p>&nbsp;</p>', N'<p><a href="https://fpt.vn/"><strong>Dịch vụ internet cáp quang FPT</strong></a></p><p>FPT telecom xuất phát điểm là nhà cung cấp dịch vụ lắp mạng internet FPT, trải qua từ thời dial-up đến adsl , sau đó cập nhật công nghệ phát triển cùng thế giới . FPT telecom quyết định xây dựng lại toàn bộ cơ sở hạ tầng với trang bị cáp quang FTTH . Là dịch vụ cáp quang toàn phần với 100% lõi cáp với thạch anh tinh khiết, cho tín hiệu truyền đi với tốc độ nhanh nhất ( nhanh hơn adsl khoảng 200 lần ) không bị ảnh hưởng bởi các yếu tố thời tiết, giảm thiểu đến 99% tỉ lệ bị sét đánh. Do tín hiệu truyền dạng sóng ánh sáng không dùng điện ( electron ) . Ngoài ra cáp quang FTTH cũng có nhiều ưu điểm đặc biệt nổi trội phù hợp với sự phát triển công nghệ thông tin hiện này như tăng cường bảo mật cấp cao.</p><p><a href="https://fpt.vn/"><strong>Tìm hiểu thêm</strong></a></p><figure class="image"><img src="https://static.topcv.vn/premium_companies/services/6a0b7dceed6b8993ff2feeb5d743d56d-5fc9965b97127.jpg"></figure><figure class="image"><img src="https://static.topcv.vn/premium_companies/services/32c8892d599ec27ff9a284f56f8ddb5f-5fc9967f986b5.jpg"></figure><p><a href="https://camera.fpt.vn/"><strong>Dịch vụ camera FPT.</strong></a></p><p>Camera FPT là dịch vụ cung cấp dịch vụ giám sát online 24/24 . Dịch vụ sử dụng camera IP cho phép người dùng có thể quan sát, ghi lại hình ảnh quay được tại bát kì thời điểm nào , và ở bất kỳ đâu ( cần có mạng internet ) Camera FPT đã trở thành nhà cung cấp dịch vụ chính cho của hàng, siêu thị lớn trên cả nước. Hệ thống được đầu tư bài bản, camera chất lượng hình ảnh cao và sắc nét.</p><p><a href="https://camera.fpt.vn/"><strong>Tìm hiểu thêm</strong></a></p><p><a href="https://truyenhinh.fpt.vn/"><strong>Dịch vụ Truyền hình FPT</strong></a></p><p>Truyền hình FPT sử dụng công nghệ truyền hình cáp thông minh. Toàn bộ dữ liệu được chưa ngay tại server hệ thống lớn tại Việt Nam. Nội dung chọn lọc cùng với thế hệ chip Sigma Design chuyên dụng cho truyền hình giúp sử dụng ít tài nguyên nhưng truyền tải nội dung từ HD đến full HD . Ngoài ra với thiết bị giải mã tín hiệu có nền tảng riêng, tương đương cấu hình một máy tính cho phép khách hàng đa dạng truyền thông và giải trí với các dịch vụ tương tác trở thành hiện thực. Hơn cả một thiết bị thông minh, truyền hình FPT còn là sản phẩm thuần Việt. Với 100% phần mềm được các kỹ sư tại FPT xây dựng và phát triển trong vòng 5 năm trước khi chính thức cung cấp tới thị trường chính thức vào năm 2014 .</p><p><a href="https://truyenhinh.fpt.vn/"><strong>Tìm hiểu thêm</strong></a></p><figure class="image"><img src="https://static.topcv.vn/premium_companies/services/aa5d51b30cfee351e7a038f3ea596aec-5fc996a289b6e.jpg"></figure>', 5000, NULL, 1, N'<iframe width="560" height="315" src="https://www.youtube.com/embed/oBfSkkCn2fQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>', N'942b50b4-05b8-45d4-a878-425eb123aeff', 2, N'Tầng 2, tòa nhà FPT, Phố Duy Tân, Cầu Giấy, Hà Nội', 5, CAST(N'2021-05-23T13:40:17.427' AS DateTime), 80)
INSERT [dbo].[Users] ([user_id], [user_email], [user_pass], [user_active], [user_option], [user_datecreate], [user_dateupdate], [user_img], [user_sex], [user_birth], [user_favourite], [role_id], [user_name], [user_phone], [employer_company], [provice_id], [employer_banner], [employer_logo], [employer_introduce], [employer_favourite], [employer_amount], [user_note], [employer_pageload], [employer_youtube], [user_key], [wp_id], [employer_addpress], [version_id], [user_deadline], [employer_amoutjob]) VALUES (1016, N'nama@gmail.com', N'd3f8f37ebf778f37074a740531eb09f2', 1, 1, CAST(N'2021-04-23T13:44:05.230' AS DateTime), CAST(N'2021-04-23T13:44:05.230' AS DateTime), N'146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png', 1, NULL, NULL, 2, N'Huỳnh Minh Tấn', N'0924404019', N'CÔNG TY TNHH TM DV Ô TÔ NAM Á', 9, N'satisfied-job.jpg', N'eddb8215-b014-4a82-b785-1472217ce9f4cong-ty-tnhh-tm-dv-o-to-nam-a-605da93db7d80.jpg', N'<p>Với niềm đam mê về lĩnh vực kinh doanh xe ô tô cũng như nhận thấy sự tiềm năng của ngành, thương hiệu ô tô Nam Á được thành lập vào năm 2013.</p><p>Giữa bối cảnh kinh tế Việt Nam nói riêng và thế giới nói chung, vừa bước qua thời kì khủng hoảng, đang bước đầu khôi phục thì thị trường xe ô tô cũng dần hoạt động sôi nổi.</p><p>Ra đời với sứ mệnh mang đến khách hàng những giải pháp hữu ích nhất, Nam Á đã tự lựa chọn cho mình con đường đi lên lấy chất lượng và uy tín hàng đầu.</p><p>Những ngày đầu đặt chân vào thị trường, Công ty Nam Á chuyên kinh doanh về xe ô tô thương mại xe tải, xe chuyên dụng, xe du lich đã qua sử dụng, dịch vụ sửa chữa, thiết</p><p>kế đóng thùng xe tải.</p><p>Đến nay, Nam Á đã có hệ thống showroom trưng bày ô tô cùng hệ thống sản phẩm đa dạng về các dòng xe thuộc các thương hiệu: Huyndai, Hino, Isuzu, Ô tô tải có cần cẩu ,</p><p>xe ben, xe bồn, ép rác … Bên cạnh đó, chúng tôi còn có đội ngũ nhân viên trẻ, nhiệt huyết, luôn được trau dồi, tu dưỡng và ý thức được sứ mệnh phục vụ khách hàng cùng quy trình làm việc khép kín với mong muốn mang đến sự hài lòng tối đa cho khách hàng.</p><p>Nam Á đang hướng đến mục tiêu trở thành nhà cung cấp xe tải hàng đầu tại Việt Nam về quy mô lẫn chât lượng đem đến sự hài lòng và trải nghiệm tốt nhất cho khách hàng.</p><p>Nam Á luôn trân trọng giá trị nền tảng cho sự phát triển, đó là các cơ hội được hợp tác, phục vụ với Quý khách hàng. Và không có bất kỳ khó khăn nào có thể ngăn cản chúng tôi mang lại những giá trị tiện ích phù hợp với mong muốn và lợi ích của Quý khách hàng. Chúng tôi tin tưởng rằng với tập thể cán bộ công nhân viên đoàn kết, vững mạnh và sự ủng hộ của Quý khách hàng, Nam Á chắc chắn sẽ gặt hái được nhiều thành công hơn nữa trong tương lại</p>', N'<p>Với niềm đam mê về lĩnh vực kinh doanh xe ô tô cũng như nhận thấy sự tiềm năng của ngành, thương hiệu ô tô Nam Á được thành lập vào năm 2013.</p><p>Giữa bối cảnh kinh tế Việt Nam nói riêng và thế giới nói chung, vừa bước qua thời kì khủng hoảng, đang bước đầu khôi phục thì thị trường xe ô tô cũng dần hoạt động sôi nổi.</p><p>Ra đời với sứ mệnh mang đến khách hàng những giải pháp hữu ích nhất, Nam Á đã tự lựa chọn cho mình con đường đi lên lấy chất lượng và uy tín hàng đầu.</p><p>Những ngày đầu đặt chân vào thị trường, Công ty Nam Á chuyên kinh doanh về xe ô tô thương mại xe tải, xe chuyên dụng, xe du lich đã qua sử dụng, dịch vụ sửa chữa, thiết</p><p>kế đóng thùng xe tải.</p><p>Đến nay, Nam Á đã có hệ thống showroom trưng bày ô tô cùng hệ thống sản phẩm đa dạng về các dòng xe thuộc các thương hiệu: Huyndai, Hino, Isuzu, Ô tô tải có cần cẩu ,</p><p>xe ben, xe bồn, ép rác … Bên cạnh đó, chúng tôi còn có đội ngũ nhân viên trẻ, nhiệt huyết, luôn được trau dồi, tu dưỡng và ý thức được sứ mệnh phục vụ khách hàng cùng quy trình làm việc khép kín với mong muốn mang đến sự hài lòng tối đa cho khách hàng.</p><p>Nam Á đang hướng đến mục tiêu trở thành nhà cung cấp xe tải hàng đầu tại Việt Nam về quy mô lẫn chât lượng đem đến sự hài lòng và trải nghiệm tốt nhất cho khách hàng.</p><p>Nam Á luôn trân trọng giá trị nền tảng cho sự phát triển, đó là các cơ hội được hợp tác, phục vụ với Quý khách hàng. Và không có bất kỳ khó khăn nào có thể ngăn cản chúng tôi mang lại những giá trị tiện ích phù hợp với mong muốn và lợi ích của Quý khách hàng. Chúng tôi tin tưởng rằng với tập thể cán bộ công nhân viên đoàn kết, vững mạnh và sự ủng hộ của Quý khách hàng, Nam Á chắc chắn sẽ gặt hái được nhiều thành công hơn nữa trong tương lại</p>', 500, NULL, 1, NULL, N'b021822f-b50d-49ee-adba-18ee469f1b62', 3, N'Số 63, đường Đại Lộ Bình Dương, Phường Hiệp Thành, Thành phố Thủ Dầu Một, Tỉnh Bình Dương', 6, CAST(N'2021-05-23T13:47:13.353' AS DateTime), 120)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Versions] ON 

INSERT [dbo].[Versions] ([version_id], [version_name]) VALUES (1, N'Miễn phí')
INSERT [dbo].[Versions] ([version_id], [version_name]) VALUES (2, N'Nâng cấp')
INSERT [dbo].[Versions] ([version_id], [version_name]) VALUES (3, N'Cao cấp 1')
INSERT [dbo].[Versions] ([version_id], [version_name]) VALUES (4, N'Cao cấp 2')
INSERT [dbo].[Versions] ([version_id], [version_name]) VALUES (5, N'Pro')
INSERT [dbo].[Versions] ([version_id], [version_name]) VALUES (6, N'Max Pro')
SET IDENTITY_INSERT [dbo].[Versions] OFF
GO
SET IDENTITY_INSERT [dbo].[ViewCvs] ON 

INSERT [dbo].[ViewCvs] ([view_id], [view_view], [cv_id], [user_id], [view_dateupdate]) VALUES (1, 37, 1007, 4, CAST(N'2021-04-11T11:19:23.100' AS DateTime))
INSERT [dbo].[ViewCvs] ([view_id], [view_view], [cv_id], [user_id], [view_dateupdate]) VALUES (2, 15, 4, 4, CAST(N'2021-04-11T12:00:31.857' AS DateTime))
INSERT [dbo].[ViewCvs] ([view_id], [view_view], [cv_id], [user_id], [view_dateupdate]) VALUES (3, 1, 1007, 2, CAST(N'2021-04-12T18:44:45.160' AS DateTime))
INSERT [dbo].[ViewCvs] ([view_id], [view_view], [cv_id], [user_id], [view_dateupdate]) VALUES (4, 1, 1014, 2, CAST(N'2021-04-22T13:27:35.567' AS DateTime))
INSERT [dbo].[ViewCvs] ([view_id], [view_view], [cv_id], [user_id], [view_dateupdate]) VALUES (5, 1, 4, 2, CAST(N'2021-04-22T13:27:40.227' AS DateTime))
SET IDENTITY_INSERT [dbo].[ViewCvs] OFF
GO
SET IDENTITY_INSERT [dbo].[Words] ON 

INSERT [dbo].[Words] ([word_id], [word_name]) VALUES (1, N'MẸ')
INSERT [dbo].[Words] ([word_id], [word_name]) VALUES (2, N'CC')
INSERT [dbo].[Words] ([word_id], [word_name]) VALUES (3, N'NÓ')
INSERT [dbo].[Words] ([word_id], [word_name]) VALUES (4, N'A')
INSERT [dbo].[Words] ([word_id], [word_name]) VALUES (5, N'B')
INSERT [dbo].[Words] ([word_id], [word_name]) VALUES (6, N'C')
INSERT [dbo].[Words] ([word_id], [word_name]) VALUES (7, N'D')
INSERT [dbo].[Words] ([word_id], [word_name]) VALUES (8, N'E')
INSERT [dbo].[Words] ([word_id], [word_name]) VALUES (9, N'F')
INSERT [dbo].[Words] ([word_id], [word_name]) VALUES (10, N'CON')
INSERT [dbo].[Words] ([word_id], [word_name]) VALUES (11, N'CHÓ')
INSERT [dbo].[Words] ([word_id], [word_name]) VALUES (12, N'XL')
INSERT [dbo].[Words] ([word_id], [word_name]) VALUES (13, N'XẠO')
INSERT [dbo].[Words] ([word_id], [word_name]) VALUES (14, N'BỐ')
INSERT [dbo].[Words] ([word_id], [word_name]) VALUES (15, N'CƯƠNG')
SET IDENTITY_INSERT [dbo].[Words] OFF
GO
SET IDENTITY_INSERT [dbo].[WorkPlaces] ON 

INSERT [dbo].[WorkPlaces] ([wp_id], [wp_name]) VALUES (1, N'Nhân viên')
INSERT [dbo].[WorkPlaces] ([wp_id], [wp_name]) VALUES (2, N'Trưởng nhóm')
INSERT [dbo].[WorkPlaces] ([wp_id], [wp_name]) VALUES (3, N'Phó phòng')
INSERT [dbo].[WorkPlaces] ([wp_id], [wp_name]) VALUES (4, N'Trưởng học')
INSERT [dbo].[WorkPlaces] ([wp_id], [wp_name]) VALUES (5, N'Phó giám đốc')
INSERT [dbo].[WorkPlaces] ([wp_id], [wp_name]) VALUES (6, N'Giám đốc')
INSERT [dbo].[WorkPlaces] ([wp_id], [wp_name]) VALUES (7, N'Tổng giám đốc')
SET IDENTITY_INSERT [dbo].[WorkPlaces] OFF
GO
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD  CONSTRAINT [FK_Bills_Pakages] FOREIGN KEY([pakege_id])
REFERENCES [dbo].[Pakages] ([pakage_id])
GO
ALTER TABLE [dbo].[Bills] CHECK CONSTRAINT [FK_Bills_Pakages]
GO
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD  CONSTRAINT [FK_Bills_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Bills] CHECK CONSTRAINT [FK_Bills_Users]
GO
ALTER TABLE [dbo].[Cvs]  WITH CHECK ADD  CONSTRAINT [FK_Cvs_Themes] FOREIGN KEY([theme_id])
REFERENCES [dbo].[Themes] ([theme_id])
GO
ALTER TABLE [dbo].[Cvs] CHECK CONSTRAINT [FK_Cvs_Themes]
GO
ALTER TABLE [dbo].[Cvs]  WITH CHECK ADD  CONSTRAINT [FK_Cvs_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Cvs] CHECK CONSTRAINT [FK_Cvs_Users]
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_Groups_Categorys] FOREIGN KEY([category_id])
REFERENCES [dbo].[Categorys] ([cate_id])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_Groups_Categorys]
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_Groups_Jobs] FOREIGN KEY([job_id])
REFERENCES [dbo].[Jobs] ([job_id])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_Groups_Jobs]
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_Groups_Provices] FOREIGN KEY([provice_id])
REFERENCES [dbo].[Provices] ([provice_id])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_Groups_Provices]
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_Groups_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_Groups_Users]
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_Exps] FOREIGN KEY([exp_id])
REFERENCES [dbo].[Exps] ([exp_id])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_Exps]
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_Types] FOREIGN KEY([type_id])
REFERENCES [dbo].[TypeJobs] ([type_id])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_Types]
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_Users]
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_WorkPlaces] FOREIGN KEY([wp_id])
REFERENCES [dbo].[WorkPlaces] ([wp_id])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_WorkPlaces]
GO
ALTER TABLE [dbo].[Pakages]  WITH CHECK ADD  CONSTRAINT [FK_Pakages_Roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[Roles] ([role_id])
GO
ALTER TABLE [dbo].[Pakages] CHECK CONSTRAINT [FK_Pakages_Roles]
GO
ALTER TABLE [dbo].[SubmitCv]  WITH CHECK ADD  CONSTRAINT [FK_SubmitCv_Cvs] FOREIGN KEY([cv_id])
REFERENCES [dbo].[Cvs] ([cv_id])
GO
ALTER TABLE [dbo].[SubmitCv] CHECK CONSTRAINT [FK_SubmitCv_Cvs]
GO
ALTER TABLE [dbo].[SubmitCv]  WITH CHECK ADD  CONSTRAINT [FK_SubmitCv_Jobs] FOREIGN KEY([job_id])
REFERENCES [dbo].[Jobs] ([job_id])
GO
ALTER TABLE [dbo].[SubmitCv] CHECK CONSTRAINT [FK_SubmitCv_Jobs]
GO
ALTER TABLE [dbo].[SubmitCv]  WITH CHECK ADD  CONSTRAINT [FK_SubmitCv_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[SubmitCv] CHECK CONSTRAINT [FK_SubmitCv_Users]
GO
ALTER TABLE [dbo].[SubmitJob]  WITH CHECK ADD  CONSTRAINT [FK_SubmitJob_Cvs] FOREIGN KEY([cv_id])
REFERENCES [dbo].[Cvs] ([cv_id])
GO
ALTER TABLE [dbo].[SubmitJob] CHECK CONSTRAINT [FK_SubmitJob_Cvs]
GO
ALTER TABLE [dbo].[SubmitJob]  WITH CHECK ADD  CONSTRAINT [FK_SubmitJob_Jobs] FOREIGN KEY([job_id])
REFERENCES [dbo].[Jobs] ([job_id])
GO
ALTER TABLE [dbo].[SubmitJob] CHECK CONSTRAINT [FK_SubmitJob_Jobs]
GO
ALTER TABLE [dbo].[SubmitJob]  WITH CHECK ADD  CONSTRAINT [FK_SubmitJob_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[SubmitJob] CHECK CONSTRAINT [FK_SubmitJob_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Provices] FOREIGN KEY([provice_id])
REFERENCES [dbo].[Provices] ([provice_id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Provices]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[Roles] ([role_id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Versions] FOREIGN KEY([version_id])
REFERENCES [dbo].[Versions] ([version_id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Versions]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_WorkPlaces] FOREIGN KEY([wp_id])
REFERENCES [dbo].[WorkPlaces] ([wp_id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_WorkPlaces]
GO
ALTER TABLE [dbo].[ViewCvs]  WITH CHECK ADD  CONSTRAINT [FK_ViewCvs_Cvs] FOREIGN KEY([cv_id])
REFERENCES [dbo].[Cvs] ([cv_id])
GO
ALTER TABLE [dbo].[ViewCvs] CHECK CONSTRAINT [FK_ViewCvs_Cvs]
GO
ALTER TABLE [dbo].[ViewCvs]  WITH CHECK ADD  CONSTRAINT [FK_ViewCvs_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[ViewCvs] CHECK CONSTRAINT [FK_ViewCvs_Users]
GO
/****** Object:  StoredProcedure [dbo].[SqlQueryNotificationStoredProcedure-6660d4db-3fe7-4cc2-964b-91f63f74ff06]    Script Date: 4/23/2021 10:24:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SqlQueryNotificationStoredProcedure-6660d4db-3fe7-4cc2-964b-91f63f74ff06] AS BEGIN BEGIN TRANSACTION; RECEIVE TOP(0) conversation_handle FROM [SqlQueryNotificationService-6660d4db-3fe7-4cc2-964b-91f63f74ff06]; IF (SELECT COUNT(*) FROM [SqlQueryNotificationService-6660d4db-3fe7-4cc2-964b-91f63f74ff06] WHERE message_type_name = 'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer') > 0 BEGIN if ((SELECT COUNT(*) FROM sys.services WHERE name = 'SqlQueryNotificationService-6660d4db-3fe7-4cc2-964b-91f63f74ff06') > 0)   DROP SERVICE [SqlQueryNotificationService-6660d4db-3fe7-4cc2-964b-91f63f74ff06]; if (OBJECT_ID('SqlQueryNotificationService-6660d4db-3fe7-4cc2-964b-91f63f74ff06', 'SQ') IS NOT NULL)   DROP QUEUE [SqlQueryNotificationService-6660d4db-3fe7-4cc2-964b-91f63f74ff06]; DROP PROCEDURE [SqlQueryNotificationStoredProcedure-6660d4db-3fe7-4cc2-964b-91f63f74ff06]; END COMMIT TRANSACTION; END
GO
USE [master]
GO
ALTER DATABASE [DataQuickJob] SET  READ_WRITE 
GO
