CREATE TABLE [dbo].[Account] (
    [AccountID]       INT             IDENTITY (1, 1) NOT NULL,
    [UserID]          INT             NOT NULL,
    [AccountTypeID]   INT             NOT NULL,
    [CreatedDateTime] DATETIME        NOT NULL,
    [CreatedUser]     INT             NOT NULL,
    [UpdatedDateTime] DATETIME        NOT NULL,
    [UpdatedUser]     INT             NOT NULL,
    [AccountBalance]  DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED ([AccountID] ASC),
    CONSTRAINT [FK_Account_AccountType] FOREIGN KEY ([AccountTypeID]) REFERENCES [dbo].[AccountType] ([AccountTypeID]),
    CONSTRAINT [FK_Account_User] FOREIGN KEY ([UserID]) REFERENCES [dbo].[User] ([UserID])
);

