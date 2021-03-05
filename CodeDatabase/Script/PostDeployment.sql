/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
--Insert into Role
GO
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Admin')
GO
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'User')
GO

--insert into Account Type
INSERT [dbo].[AccountType] ([AccountTypeID], [Type]) VALUES (1, N'Debit')
GO
INSERT [dbo].[AccountType] ([AccountTypeID], [Type]) VALUES (2, N'Credit')
GO
INSERT [dbo].[AccountType] ([AccountTypeID], [Type]) VALUES (3, N'Checking')
GO

--insert into PaymentStatus
INSERT [dbo].[PaymentStatus] ([PaymentStatusID], [PaymentStatusName]) VALUES (1, N'Pending')
GO
INSERT [dbo].[PaymentStatus] ([PaymentStatusID], [PaymentStatusName]) VALUES (2, N'Success')
GO
INSERT [dbo].[PaymentStatus] ([PaymentStatusID], [PaymentStatusName]) VALUES (3, N'Cancelled')
GO
INSERT [dbo].[PaymentStatus] ([PaymentStatusID], [PaymentStatusName]) VALUES (4, N'On-hold')
GO

--insert into User
GO
INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [Email], [UserName], [PasswordNeverExpire], [DaysPasswordExpire], [Password]) VALUES (1, N'user', N'test', N'test@test.com', N'test', 0, 75, N'password')
GO
INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [Email], [UserName], [PasswordNeverExpire], [DaysPasswordExpire], [Password]) VALUES (2, N'admin', N'admin', N'admin@test.com', N'admin', 1, 0, N'password')
GO
INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [Email], [UserName], [PasswordNeverExpire], [DaysPasswordExpire], [Password]) VALUES (4, N'Athena', N'Cruz', N'Athen.Cruz@test.com', N'acruz', 0, 75, N'password')
GO

--insert into userRole
GO
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (1, 1, 2)
GO
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (2, 2, 1)
GO

--insert into Account
INSERT [dbo].[Account] ([AccountID], [UserID], [AccountTypeID], [CreatedDateTime], [CreatedUser], [UpdatedDateTime], [UpdatedUser], [AccountBalance]) VALUES (1, 4, 1, CAST(N'2021-03-03 00:00:00.000' AS DateTime), 2, CAST(N'2021-03-03 00:00:00.000' AS DateTime), 2, CAST(9950.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Account] ([AccountID], [UserID], [AccountTypeID], [CreatedDateTime], [CreatedUser], [UpdatedDateTime], [UpdatedUser], [AccountBalance]) VALUES (2, 4, 2, CAST(N'2021-03-03 00:00:00.000' AS DateTime), 2, CAST(N'2021-03-03 00:00:00.000' AS DateTime), 2, CAST(100000.00 AS Decimal(18, 2)))
GO

--insert into Payment
INSERT [dbo].[Payment] ([PaymentID], [PaymentDate], [UserID], [AccountID], [Amount], [Description], [PaymentStatusID], [CurrentBalance], [AfterBalance]) VALUES (1, CAST(N'2021-03-03 00:00:00.000' AS DateTime), 4, 1, CAST(100.00000 AS Decimal(18, 5)), N'Mercalco Payment', 3, CAST(10000.00 AS Decimal(18, 2)), CAST(10000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Payment] ([PaymentID], [PaymentDate], [UserID], [AccountID], [Amount], [Description], [PaymentStatusID], [CurrentBalance], [AfterBalance]) VALUES (3, CAST(N'2021-03-03 08:00:00.000' AS DateTime), 4, 1, CAST(50.00000 AS Decimal(18, 5)), N'food', 2, CAST(10000.00 AS Decimal(18, 2)), CAST(9950.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Payment] ([PaymentID], [PaymentDate], [UserID], [AccountID], [Amount], [Description], [PaymentStatusID], [CurrentBalance], [AfterBalance]) VALUES (4, CAST(N'2021-03-03 00:00:00.000' AS DateTime), 4, 1, CAST(30.50000 AS Decimal(18, 5)), N'Water Bill', 1, CAST(9950.00 AS Decimal(18, 2)), CAST(9950.00 AS Decimal(18, 2)))
GO

