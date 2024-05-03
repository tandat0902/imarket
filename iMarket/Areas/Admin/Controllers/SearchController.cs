using iMarket.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace iMarket.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class SearchController : Controller
    {
        private readonly iMarketDBContext _dbContext;
        public SearchController(iMarketDBContext dbContext)
        {
            _dbContext = dbContext;
        }

        //GET: Search/FindProduct
        [HttpPost]
        public IActionResult FindProduct(string keyword)
        {
            List<Product> ProductList = new List<Product>();
            if(string.IsNullOrEmpty(keyword) || keyword.Length < 1) 
            {
                ProductList = _dbContext.Products
                    .AsNoTracking()
                    .Include(a => a.Category)
                    .OrderByDescending(x => x.DateCreated)
                    .ToList();
            }
            else
            {
                ProductList = _dbContext.Products
                    .AsNoTracking()
                    .Include(a => a.Category)
                    .Where(x => x.ProductName.Contains(keyword))
                    .OrderByDescending(x => x.ProductName)
                    .Take(10)
                    .ToList();
            }
            return PartialView("ListProductsSearchPartial", ProductList);
        }
    }
}
