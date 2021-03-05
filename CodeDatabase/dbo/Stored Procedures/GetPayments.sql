-- ===================================================
-- Author:		Joy Rimando
-- Create date: 03-03-2021
-- Description:	Get list of Payments
-- ===================================================
CREATE PROCEDURE GetPayments
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