//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MZ.DataModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class CommonItem
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public CommonItem()
        {
            this.Complaints = new HashSet<Complaint>();
        }
    
        public decimal ID { get; set; }
        public string Name { get; set; }
        public Nullable<decimal> TypeId { get; set; }
    
        public virtual CommonType CommonType { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Complaint> Complaints { get; set; }
    }
}
