using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace iMarket.Models
{
    public partial class Product
    {
        public Product()
        {
            OrderDetails = new HashSet<OrderDetail>();
        }

        public int ProductId { get; set; }

        [Required(ErrorMessage = "Tên sản phẩm không được để trống!")]
        public string? ProductName { get; set; }
        public string? ShortDesc { get; set; }
        public string? Description { get; set; }

        [Required(ErrorMessage = "Giá sản phẩm không được để trống.")]
        [Range(0.01, double.MaxValue, ErrorMessage = "Giá sản phẩm phải lớn hơn 0!")]
        [RegularExpression(@"^\d+$", ErrorMessage = "Giá sản phẩm phải là một số nguyên hợp lệ!")]
        public decimal? UnitPrice { get; set; }

        [Range(0, int.MaxValue, ErrorMessage = "Tồn kho phải là số không âm!")]
        public int? Discount { get; set; }
        public string? Thumbnail { get; set; }
        public string? Video { get; set; }
        public DateTime? DateCreated { get; set; }
        public DateTime? DateModified { get; set; }
        public bool BestSellers { get; set; }
        public bool HomeFlag { get; set; }
        public bool Active { get; set; }
        public string? Tags { get; set; }
        public string? Title { get; set; }
        public string? Alias { get; set; }
        public string? MetaDesc { get; set; }
        public string? MetaKey { get; set; }

        [Range(0, int.MaxValue, ErrorMessage = "Tồn kho phải là số không âm!")]
        public int? UnitsInStock { get; set; }

        [Required(ErrorMessage = "Vui lòng chọn danh mục hợp lệ!")]
        public int? CategoryId { get; set; }
        public virtual Category? Category { get; set; }
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}
