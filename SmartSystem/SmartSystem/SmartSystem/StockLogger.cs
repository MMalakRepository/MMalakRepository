//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SmartSystem
{
    using System;
    using System.Collections.Generic;
    
    public partial class StockLogger
    {
        public int ID { get; set; }
        public int MaterialInStock { get; set; }
        public Nullable<decimal> OldStock { get; set; }
        public Nullable<decimal> NewStock { get; set; }
        public Nullable<decimal> OldReservedStock { get; set; }
        public Nullable<decimal> NewReservedStock { get; set; }
        public Nullable<decimal> OldSafetyStock { get; set; }
        public Nullable<decimal> newSafetyStock { get; set; }
        public Nullable<System.DateTime> ActionDate { get; set; }
        public string UserName { get; set; }
        public string Notes { get; set; }
    
        public virtual MaterialInStock MaterialInStock1 { get; set; }
    }
}
