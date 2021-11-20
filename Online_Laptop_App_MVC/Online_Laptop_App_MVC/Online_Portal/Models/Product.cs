using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Online_Portal.Models
{
    public class Product
    {
        public int ProductId { set; get; }
        public string ProductName { set; get; }
        public bool IsAvaliable { set; get; }
        public string BrandName { set; get; }
        public string CategoryName { set; get; }
    }
}