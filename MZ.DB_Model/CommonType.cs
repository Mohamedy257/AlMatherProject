//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MZ.DB_Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class CommonType
    {
        public CommonType()
        {
            this.CommonItems = new HashSet<CommonItem>();
        }
    
        public decimal ID { get; set; }
        public string Name { get; set; }
        public Nullable<decimal> CatogeryID { get; set; }
    
        public virtual Catogery Catogery { get; set; }
        public virtual ICollection<CommonItem> CommonItems { get; set; }
    }
}
