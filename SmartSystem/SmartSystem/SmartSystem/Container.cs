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
    
    public partial class Container
    {
        public Container()
        {
            this.ContainerDatas = new HashSet<ContainerData>();
        }
    
        public int ID { get; set; }
        public Nullable<int> CNumber { get; set; }
        public string CDescription { get; set; }
        public Nullable<System.DateTime> CDate { get; set; }
        public string CUser { get; set; }
        public string Notes { get; set; }
    
        public virtual ICollection<ContainerData> ContainerDatas { get; set; }
    }
}
