using System;
using System.Collections.Generic;

namespace iMarket.Models
{
    public partial class Account
    {
        public Account()
        {
            Posts = new HashSet<Post>();
        }

        public int AccountId { get; set; }
        public string? PhoneNumber { get; set; }
        public string? Email { get; set; }
        public string? Password { get; set; }
        public string? Salt { get; set; }
        public bool? Active { get; set; }
        public string? FullName { get; set; }
        public DateTime? LastLogin { get; set; }
        public DateTime? DateCreated { get; set; }
        public int? RoleId { get; set; }

        public virtual Role? Role { get; set; }
        public virtual ICollection<Post> Posts { get; set; }
    }
}
