CREATE TABLE [dbo].[AccountType] (
    [AccountTypeID] INT           IDENTITY (1, 1) NOT NULL,
    [Type]          NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_AccountType] PRIMARY KEY CLUSTERED ([AccountTypeID] ASC),
    CONSTRAINT [FK_AccountType_AccountType] FOREIGN KEY ([AccountTypeID]) REFERENCES [dbo].[AccountType] ([AccountTypeID])
);

