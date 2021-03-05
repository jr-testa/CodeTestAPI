using System;

namespace WebApi
{
    public class Payment
    {
    }

    public class PaymentViewModel
    {
        public int PaymentID { get; set; }
        public DateTime PaymentDate { get; set; }
        public int UserID { get; set; }
        public string Name { get; set; }
        public int AccountID { get; set; }
        public string AccountType { get; set; }
        public decimal Amount { get; set; }
        public string Description { get; set; }
        public int PaymentStatusID { get; set; }
        public string PaymentStatusName { get; set; }
        public decimal AccountBalance { get; set; }
    }

    public class PaymentItemModel
    {
        public int PaymentID { get; set; }
        public DateTime PaymentDate { get; set; }
        public string AccountType { get; set; }
        public decimal Amount { get; set; }
        public string Description { get; set; }
        public string PaymentStatus { get; set; }
        public decimal AccountBalance { get; set; }

    }
}
