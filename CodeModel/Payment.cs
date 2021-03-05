//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CodeModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class Payment
    {
        public int PaymentID { get; set; }
        public System.DateTime PaymentDate { get; set; }
        public int UserID { get; set; }
        public int AccountID { get; set; }
        public decimal Amount { get; set; }
        public string Description { get; set; }
        public int PaymentStatusID { get; set; }
        public decimal CurrentBalance { get; set; }
        public decimal AfterBalance { get; set; }
    
        public virtual Account Account { get; set; }
        public virtual PaymentStatu PaymentStatu { get; set; }
        public virtual User User { get; set; }
    }
}
