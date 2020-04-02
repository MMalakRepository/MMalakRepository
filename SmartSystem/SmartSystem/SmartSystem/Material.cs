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
    
    public partial class Material
    {
        public Material()
        {
            this.DeadMaterials = new HashSet<DeadMaterial>();
            this.CuttingListsMaterials = new HashSet<CuttingListsMaterial>();
            this.MaterialInStocks = new HashSet<MaterialInStock>();
            this.OrderDetails = new HashSet<OrderDetail>();
            this.TransferDetails = new HashSet<TransferDetail>();
            this.MaterialHistories = new HashSet<MaterialHistory>();
            this.ContainerDatas = new HashSet<ContainerData>();
        }
    
        public string MaterialNo { get; set; }
        public string MaterialName { get; set; }
        public string Description { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<int> TypeID { get; set; }
        public int ID { get; set; }
        public Nullable<int> SupplierID { get; set; }
        public Nullable<int> UnitID { get; set; }
        public Nullable<decimal> Height { get; set; }
        public Nullable<decimal> Width { get; set; }
        public string imagepath { get; set; }
    
        public virtual ICollection<DeadMaterial> DeadMaterials { get; set; }
        public virtual Material Materials1 { get; set; }
        public virtual Material Material1 { get; set; }
        public virtual Supplier Supplier { get; set; }
        public virtual Unit Unit { get; set; }
        public virtual ICollection<CuttingListsMaterial> CuttingListsMaterials { get; set; }
        public virtual ICollection<MaterialInStock> MaterialInStocks { get; set; }
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
        public virtual ICollection<TransferDetail> TransferDetails { get; set; }
        public virtual SubCategory SubCategory { get; set; }
        public virtual ICollection<MaterialHistory> MaterialHistories { get; set; }
        public virtual ICollection<ContainerData> ContainerDatas { get; set; }
    }
}
