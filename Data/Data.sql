USE [BookLibrary]
GO
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
