using System;
using System.Collections.Generic;

namespace iMarket.Models
{
    public partial class Post
    {
        public int PostId { get; set; }
        public string? Title { get; set; }
        public string? ShortContents { get; set; }
        public string? Contents { get; set; }
        public string? Thumbnail { get; set; }
        public bool? Published { get; set; }
        public string? Alias { get; set; }
        public DateTime? CreatedDate { get; set; }
        public string? Author { get; set; }
        public int? AccountId { get; set; }
        public string? Tags { get; set; }
        public int? CategoryId { get; set; }
        public bool? IsHot { get; set; }
        public bool? IsNewFeed { get; set; }
        public string? MetaDecs { get; set; }
        public string? MetaKey { get; set; }
        public int? Views { get; set; }

        public virtual Account? Account { get; set; }
        public virtual Category? Category { get; set; }
    }
}
