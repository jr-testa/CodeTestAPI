CREATE TABLE [dbo].[Payment] (
    [PaymentID]       INT             IDENTITY (1, 1) NOT NULL,
    [PaymentDate]     DATETIME        NOT NULL,
    [UserID]          INT             NOT NULL,
    [AccountID]       INT             NOT NULL,
    [Amount]          DECIMAL (18, 5) NOT NULL,
    [Description]     NVARCHAR (100)  NULL,
    [PaymentStatusID] INT             NOT NULL,
    [CurrentBalance]  DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [AfterBalance]    DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED ([PaymentID] ASC),
    CONSTRAINT [FK_Payment_Account] FOREIGN KEY ([AccountID]) REFERENCES [dbo].[Account] ([AccountID]),
    CONSTRAINT [FK_Payment_PaymentStatus] FOREIGN KEY ([PaymentStatusID]) REFERENCES [dbo].[PaymentStatus] ([PaymentStatusID]),
    CONSTRAINT [FK_Payment_User] FOREIGN KEY ([UserID]) REFERENCES [dbo].[User] ([UserID])
);

