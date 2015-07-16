USE [BookLibrary]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N'Drama')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (2, N'Comedy')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (3, N'Science fiction')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (4, N'Action and Adventure')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (5, N'Romance')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (6, N'Mystery')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (7, N'Horror')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (8, N'Travel')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (9, N'Children''s')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (10, N'Religious')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (11, N'Science')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (12, N'History')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Authors] ON 

INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (1, N' Charlotte ', N'Brontë')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (2, N'Emily', N' Brontë')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (3, N'George', N' Orwell')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (4, N'Oscar', N' Wilde')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (5, N'Charles', N' Dickens')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (6, N'Jane', N'Austen')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (7, N'William', N'Shakespeare')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (8, N'Mary', N'Mary Shelley')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (9, N'William', N'William Golding ')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (10, N'Thomas', N'Hardy')
SET IDENTITY_INSERT [dbo].[Authors] OFF
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([Id], [Name], [CategoryId], [AuthorId]) VALUES (1, N'Jane Eyre', 1, 1)
INSERT [dbo].[Books] ([Id], [Name], [CategoryId], [AuthorId]) VALUES (2, N'Wuthering Heights', 4, 2)
INSERT [dbo].[Books] ([Id], [Name], [CategoryId], [AuthorId]) VALUES (3, N'Animal Farm', 6, 3)
INSERT [dbo].[Books] ([Id], [Name], [CategoryId], [AuthorId]) VALUES (4, N'The Picture of Dorian Gray', 11, 4)
SET IDENTITY_INSERT [dbo].[Books] OFF
