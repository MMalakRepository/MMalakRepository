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
    
    public partial class MaterialInStock
    {
        public MaterialInStock()
        {
            this.ReservedMaterials = new HashSet<ReservedMaterial>();
            this.StockLoggers = new HashSet<StockLogger>();
        }
    
        public int ID { get; set; }
        public Nullable<int> MaterialID { get; set; }
        public Nullable<int> StoreID { get; set; }
        public Nullable<int> CurrencyID { get; set; }
        public Nullable<decimal> StockOnHand { get; set; }
        public Nullable<decimal> SafetyStock { get; set; }
        public Nullable<System.DateTime> CreationDate { get; set; }
        public string CreationUser { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<System.DateTime> LastReceiptDate { get; set; }
        public Nullable<System.DateTime> LastSalesDate { get; set; }
        public Nullable<decimal> OpeningStock { get; set; }
        public string Location { get; set; }
        public Nullable<decimal> ReservedStock { get; set; }
        public Nullable<System.DateTime> LastOrderDate { get; set; }
        public Nullable<int> UnitID { get; set; }
        public Nullable<int> Supplier { get; set; }
    
        public virtual Currency Currency { get; set; }
        public virtual Material Material { get; set; }
        public virtual Store Store { get; set; }
        public virtual Supplier Supplier1 { get; set; }
        public virtual Unit Unit { get; set; }
        public virtual ICollection<ReservedMaterial> ReservedMaterials { get; set; }
        public virtual ICollection<StockLogger> StockLoggers { get; set; }
    }
}
