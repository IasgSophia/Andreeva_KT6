//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PetshopApp.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class Order
    {
        public int OrderId { get; set; }
        public System.DateTime FirstDate { get; set; }
        public System.DateTime LastDate { get; set; }
        public int Amount { get; set; }
        public int ProductId { get; set; }
        public Nullable<int> UserId { get; set; }
        public int PickPointId { get; set; }
        public int Code { get; set; }
        public string Status { get; set; }
    
        public virtual PickPoint PickPoint { get; set; }
        public virtual Product Product { get; set; }
        public virtual User User { get; set; }
    }
}
