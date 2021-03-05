CREATE TABLE [dbo].[PaymentStatus] (
    [PaymentStatusID]   INT           IDENTITY (1, 1) NOT NULL,
    [PaymentStatusName] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_PaymentStatus] PRIMARY KEY CLUSTERED ([PaymentStatusID] ASC)
);

