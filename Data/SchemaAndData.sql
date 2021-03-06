USE [master]
GO
/****** Object:  Database [BookLibrary]    Script Date: 16/07/2015 8:46:30 ******/
CREATE DATABASE [BookLibrary]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookLibrary', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BookLibrary.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BookLibrary_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BookLibrary_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BookLibrary] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookLibrary].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookLibrary] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookLibrary] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookLibrary] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookLibrary] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookLibrary] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookLibrary] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookLibrary] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [BookLibrary] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookLibrary] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookLibrary] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookLibrary] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookLibrary] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookLibrary] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookLibrary] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookLibrary] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookLibrary] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BookLibrary] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookLibrary] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookLibrary] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookLibrary] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookLibrary] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookLibrary] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookLibrary] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookLibrary] SET RECOVERY FULL 
GO
ALTER DATABASE [BookLibrary] SET  MULTI_USER 
GO
ALTER DATABASE [BookLibrary] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookLibrary] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookLibrary] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookLibrary] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BookLibrary', N'ON'
GO
USE [BookLibrary]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 16/07/2015 8:46:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Books]    Script Date: 16/07/2015 8:46:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[AuthorId] [int] NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 16/07/2015 8:46:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Authors] ON 

INSERT [dbo].[Authors] ([Id], [FirstName], [LastName], [Deleted]) VALUES (1, N' Charlotte ', N'Brontë', 0)
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName], [Deleted]) VALUES (2, N'Emily', N' Brontë', 0)
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName], [Deleted]) VALUES (3, N'George', N' Orwell', 0)
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName], [Deleted]) VALUES (4, N'Oscar', N' Wilde', 0)
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName], [Deleted]) VALUES (5, N'Charles', N' Dickens', 0)
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName], [Deleted]) VALUES (6, N'Jane', N'Austen', 0)
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName], [Deleted]) VALUES (7, N'William', N'Shakespeare', 0)
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName], [Deleted]) VALUES (8, N'Mary', N'Mary Shelley', 0)
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName], [Deleted]) VALUES (9, N'William', N'Golding', 0)
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName], [Deleted]) VALUES (10, N'Thomas', N'Hardy', 0)
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName], [Deleted]) VALUES (11, N'Charlotte', N'Brontë', 1)
SET IDENTITY_INSERT [dbo].[Authors] OFF
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([Id], [Name], [CategoryId], [AuthorId]) VALUES (1, N'Jane Eyre', 1, 1)
INSERT [dbo].[Books] ([Id], [Name], [CategoryId], [AuthorId]) VALUES (4, N'The Picture of Dorian Gray', 11, 4)
INSERT [dbo].[Books] ([Id], [Name], [CategoryId], [AuthorId]) VALUES (5, N'Wuthering Heights', 7, 2)
INSERT [dbo].[Books] ([Id], [Name], [CategoryId], [AuthorId]) VALUES (6, N'Animal Farm', 2, 3)
INSERT [dbo].[Books] ([Id], [Name], [CategoryId], [AuthorId]) VALUES (7, N'Great Expectations', 6, 5)
INSERT [dbo].[Books] ([Id], [Name], [CategoryId], [AuthorId]) VALUES (8, N'Sense and Sensibility', 5, 6)
INSERT [dbo].[Books] ([Id], [Name], [CategoryId], [AuthorId]) VALUES (9, N'Hamlet', 1, 7)
INSERT [dbo].[Books] ([Id], [Name], [CategoryId], [AuthorId]) VALUES (10, N'Romeo and Juliet', 12, 7)
SET IDENTITY_INSERT [dbo].[Books] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [Deleted]) VALUES (1, N'Drama', 0)
INSERT [dbo].[Categories] ([Id], [Name], [Deleted]) VALUES (2, N'Comedy', 0)
INSERT [dbo].[Categories] ([Id], [Name], [Deleted]) VALUES (3, N'Science fiction', 0)
INSERT [dbo].[Categories] ([Id], [Name], [Deleted]) VALUES (4, N'Action and Adventure', 0)
INSERT [dbo].[Categories] ([Id], [Name], [Deleted]) VALUES (5, N'Romance', 0)
INSERT [dbo].[Categories] ([Id], [Name], [Deleted]) VALUES (6, N'Mystery', 0)
INSERT [dbo].[Categories] ([Id], [Name], [Deleted]) VALUES (7, N'Horror', 0)
INSERT [dbo].[Categories] ([Id], [Name], [Deleted]) VALUES (8, N'Travel', 0)
INSERT [dbo].[Categories] ([Id], [Name], [Deleted]) VALUES (9, N'Children''s', 0)
INSERT [dbo].[Categories] ([Id], [Name], [Deleted]) VALUES (10, N'Religious', 0)
INSERT [dbo].[Categories] ([Id], [Name], [Deleted]) VALUES (11, N'Science', 0)
INSERT [dbo].[Categories] ([Id], [Name], [Deleted]) VALUES (12, N'History', 0)
SET IDENTITY_INSERT [dbo].[Categories] OFF
/****** Object:  Index [IX_FK_AuthorBook]    Script Date: 16/07/2015 8:46:30 ******/
CREATE NONCLUSTERED INDEX [IX_FK_AuthorBook] ON [dbo].[Books]
(
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_BookCategory]    Script Date: 16/07/2015 8:46:30 ******/
CREATE NONCLUSTERED INDEX [IX_FK_BookCategory] ON [dbo].[Books]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_AuthorBook] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Authors] ([Id])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_AuthorBook]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_BookCategory] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_BookCategory]
GO
USE [master]
GO
ALTER DATABASE [BookLibrary] SET  READ_WRITE 
GO
