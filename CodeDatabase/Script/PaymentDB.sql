USE [master]
GO
/****** Object:  Database [Payment]    Script Date: 3/3/2021 7:33:39 PM ******/
CREATE DATABASE [Payment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Payment', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Payment.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Payment_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Payment_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Payment] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Payment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Payment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Payment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Payment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Payment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Payment] SET ARITHABORT OFF 
GO
ALTER DATABASE [Payment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Payment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Payment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Payment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Payment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Payment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Payment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Payment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Payment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Payment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Payment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Payment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Payment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Payment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Payment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Payment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Payment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Payment] SET RECOVERY FULL 
GO
ALTER DATABASE [Payment] SET  MULTI_USER 
GO
ALTER DATABASE [Payment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Payment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Payment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Payment] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Payment] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Payment', N'ON'
GO
USE [Payment]
GO
/****** Object:  User [testuser]    Script Date: 3/3/2021 7:33:40 PM ******/
CREATE USER [testuser] FOR LOGIN [testuser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [testuser]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/3/2021 7:33:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[AccountTypeID] [int] NOT NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[CreatedUser] [int] NOT NULL,
	[UpdatedDateTime] [datetime] NOT NULL,
	[UpdatedUser] [int] NOT NULL,
	[AccountBalance] [decimal](18, 2) NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AccountType]    Script Date: 3/3/2021 7:33:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountType](
	[AccountTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AccountType] PRIMARY KEY CLUSTERED 
(
	[AccountTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payment]    Script Date: 3/3/2021 7:33:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentDate] [datetime] NOT NULL,
	[UserID] [int] NOT NULL,
	[AccountID] [int] NOT NULL,
	[Amount] [decimal](18, 5) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[PaymentStatusID] [int] NOT NULL,
	[CurrentBalance] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[AfterBalance] [decimal](18, 2) NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PaymentStatus]    Script Date: 3/3/2021 7:33:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentStatus](
	[PaymentStatusID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentStatusName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PaymentStatus] PRIMARY KEY CLUSTERED 
(
	[PaymentStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 3/3/2021 7:33:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 3/3/2021 7:33:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[PasswordNeverExpire] [bit] NOT NULL CONSTRAINT [DF_User_PasswordExpire]  DEFAULT ((0)),
	[DaysPasswordExpire] [int] NULL CONSTRAINT [DF_User_DaysPasswordExpire]  DEFAULT ((75)),
	[Password] [nvarchar](100) NOT NULL DEFAULT ('password'),
 CONSTRAINT [PK_dbo.User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 3/3/2021 7:33:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserRoleID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[UserRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Account] ON 

GO
INSERT [dbo].[Account] ([AccountID], [UserID], [AccountTypeID], [CreatedDateTime], [CreatedUser], [UpdatedDateTime], [UpdatedUser], [AccountBalance]) VALUES (1, 4, 1, CAST(N'2021-03-03 00:00:00.000' AS DateTime), 2, CAST(N'2021-03-03 00:00:00.000' AS DateTime), 2, CAST(9950.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Account] ([AccountID], [UserID], [AccountTypeID], [CreatedDateTime], [CreatedUser], [UpdatedDateTime], [UpdatedUser], [AccountBalance]) VALUES (2, 4, 2, CAST(N'2021-03-03 00:00:00.000' AS DateTime), 2, CAST(N'2021-03-03 00:00:00.000' AS DateTime), 2, CAST(100000.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[AccountType] ON 

GO
INSERT [dbo].[AccountType] ([AccountTypeID], [Type]) VALUES (1, N'Debit')
GO
INSERT [dbo].[AccountType] ([AccountTypeID], [Type]) VALUES (2, N'Credit')
GO
INSERT [dbo].[AccountType] ([AccountTypeID], [Type]) VALUES (3, N'Checking')
GO
SET IDENTITY_INSERT [dbo].[AccountType] OFF
GO
SET IDENTITY_INSERT [dbo].[Payment] ON 

GO
INSERT [dbo].[Payment] ([PaymentID], [PaymentDate], [UserID], [AccountID], [Amount], [Description], [PaymentStatusID], [CurrentBalance], [AfterBalance]) VALUES (1, CAST(N'2021-03-03 00:00:00.000' AS DateTime), 4, 1, CAST(100.00000 AS Decimal(18, 5)), N'Mercalco Payment', 3, CAST(10000.00 AS Decimal(18, 2)), CAST(10000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Payment] ([PaymentID], [PaymentDate], [UserID], [AccountID], [Amount], [Description], [PaymentStatusID], [CurrentBalance], [AfterBalance]) VALUES (3, CAST(N'2021-03-03 08:00:00.000' AS DateTime), 4, 1, CAST(50.00000 AS Decimal(18, 5)), N'food', 2, CAST(10000.00 AS Decimal(18, 2)), CAST(9950.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Payment] ([PaymentID], [PaymentDate], [UserID], [AccountID], [Amount], [Description], [PaymentStatusID], [CurrentBalance], [AfterBalance]) VALUES (4, CAST(N'2021-03-03 00:00:00.000' AS DateTime), 4, 1, CAST(30.50000 AS Decimal(18, 5)), N'Water Bill', 1, CAST(9950.00 AS Decimal(18, 2)), CAST(9950.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[Payment] OFF
GO
SET IDENTITY_INSERT [dbo].[PaymentStatus] ON 

GO
INSERT [dbo].[PaymentStatus] ([PaymentStatusID], [PaymentStatusName]) VALUES (1, N'Pending')
GO
INSERT [dbo].[PaymentStatus] ([PaymentStatusID], [PaymentStatusName]) VALUES (2, N'Success')
GO
INSERT [dbo].[PaymentStatus] ([PaymentStatusID], [PaymentStatusName]) VALUES (3, N'Cancelled')
GO
INSERT [dbo].[PaymentStatus] ([PaymentStatusID], [PaymentStatusName]) VALUES (4, N'On-hold')
GO
SET IDENTITY_INSERT [dbo].[PaymentStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

GO
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Admin')
GO
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'User')
GO
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

GO
INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [Email], [UserName], [PasswordNeverExpire], [DaysPasswordExpire], [Password]) VALUES (1, N'user', N'test', N'test@test.com', N'test', 0, 75, N'password')
GO
INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [Email], [UserName], [PasswordNeverExpire], [DaysPasswordExpire], [Password]) VALUES (2, N'admin', N'admin', N'admin@test.com', N'admin', 1, 0, N'password')
GO
INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [Email], [UserName], [PasswordNeverExpire], [DaysPasswordExpire], [Password]) VALUES (4, N'Athena', N'Cruz', N'Athen.Cruz@test.com', N'acruz', 0, 75, N'password')
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRole] ON 

GO
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (1, 1, 2)
GO
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (2, 2, 1)
GO
SET IDENTITY_INSERT [dbo].[UserRole] OFF
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_AccountType] FOREIGN KEY([AccountTypeID])
REFERENCES [dbo].[AccountType] ([AccountTypeID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_AccountType]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_User]
GO
ALTER TABLE [dbo].[AccountType]  WITH CHECK ADD  CONSTRAINT [FK_AccountType_AccountType] FOREIGN KEY([AccountTypeID])
REFERENCES [dbo].[AccountType] ([AccountTypeID])
GO
ALTER TABLE [dbo].[AccountType] CHECK CONSTRAINT [FK_AccountType_AccountType]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Account]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_PaymentStatus] FOREIGN KEY([PaymentStatusID])
REFERENCES [dbo].[PaymentStatus] ([PaymentStatusID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_PaymentStatus]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_User]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Role]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_User]
GO
/****** Object:  StoredProcedure [dbo].[GetPayments]    Script Date: 3/3/2021 7:33:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===================================================
-- Author:		Joy Rimando
-- Create date: 03-03-2021
-- Description:	Get list of Payments
-- ===================================================
CREATE PROCEDURE [dbo].[GetPayments]
AS
BEGIN
	SELECT 
		PaymentID,
		PaymentDate,
		p.UserID,
		u.FirstName + ' ' + u.LastName AS Name,
		p.AccountID,
		at.Type AS AccountType,
		Amount,
		[Description],
		p.PaymentStatusID,
		ps.PaymentStatusName,
		p.AfterBalance AS AccountBalance

	FROM Payment p
		INNER JOIN Account a ON p.AccountID = a.AccountID
		INNER JOIN AccountType at ON a.AccountTypeID = at.AccountTypeID
		INNER JOIN [User] u ON p.UserID = u.UserID
		INNER JOIN PaymentStatus ps ON ps.PaymentStatusID = p.PaymentStatusID

	ORDER BY p.PaymentDate desc
END


GO
USE [master]
GO
ALTER DATABASE [Payment] SET  READ_WRITE 
GO
