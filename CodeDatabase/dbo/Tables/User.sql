CREATE TABLE [dbo].[User] (
    [UserID]              INT            IDENTITY (1, 1) NOT NULL,
    [FirstName]           NVARCHAR (50)  NOT NULL,
    [LastName]            NVARCHAR (50)  NOT NULL,
    [Email]               NVARCHAR (50)  NOT NULL,
    [UserName]            NVARCHAR (50)  NOT NULL,
    [PasswordNeverExpire] BIT            CONSTRAINT [DF_User_PasswordExpire] DEFAULT ((0)) NOT NULL,
    [DaysPasswordExpire]  INT            CONSTRAINT [DF_User_DaysPasswordExpire] DEFAULT ((75)) NULL,
    [Password]            NVARCHAR (100) DEFAULT ('password') NOT NULL,
    CONSTRAINT [PK_dbo.User] PRIMARY KEY CLUSTERED ([UserID] ASC)
);

