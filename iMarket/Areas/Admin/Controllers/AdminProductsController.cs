using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using iMarket.Models;
using PagedList.Core;
using System.Dynamic;
using MessagePack;
using iMarket.Helper;
using AspNetCoreHero.ToastNotification.Abstractions;
using System.Drawing.Printing;

namespace iMarket.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class AdminProductsController : Controller
    {
        private readonly iMarketDBContext _context;

        public INotyfService _notyfService { get; }

        public AdminProductsController(iMarketDBContext context, INotyfService notyfService)
        {
            _context = context;
            _notyfService = notyfService;
        }

        // GET: Admin/AdminProducts
        public IActionResult Index(int? page, int catId = 0)
        {
            var pageNumber = page == null || page < 0 ? 1 : page.Value;
            List<Product> ProductList = new List<Product>();

            if(catId != 0)
            {
                ProductList = _context.Products.AsNoTracking().Where(x => x.CategoryId == catId).Include(x => x.Category).OrderByDescending(x => x.DateCreated).ToList();
            }
            else
            {
                ProductList = _context.Products.AsNoTracking().Include(x => x.Category).OrderByDescending(x => x.DateCreated).ToList();
            }
            PagedList<Product> models = new PagedList<Product>(ProductList.AsQueryable(), pageNumber, Utilities.PAGE_SIZE);

            ViewBag.CurrentCatID = catId;
            ViewBag.CurrentPage = pageNumber;
            ViewData["CategoryList"] = new SelectList(_context.Categories, "CategoryId", "CategoryName", catId);
            return View(models);
        }

        public IActionResult Filter(int catId = 0)
        {
            var url = $"/Admin/AdminProducts?catId={catId}";

            if (catId == 0)
            {
                url = $"/Admin/AdminProducts";
            }

            return Json(new {status = "success", redirectUrl = url});
        }

        // GET: Admin/AdminProducts/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Products == null)
            {
                return NotFound();
            }

            var product = await _context.Products
                .Include(p => p.Category)
                .FirstOrDefaultAsync(m => m.ProductId == id);
            if (product == null)
            {
                return NotFound();
            }

            return View(product);
        }

        // GET: Admin/AdminProducts/Create
        public IActionResult Create()
        {
            ViewData["CategoryList"] = new SelectList(_context.Categories, "CategoryId", "CategoryName");
            return View();
        }

        // POST: Admin/AdminProducts/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("ProductId,ProductName,ShortDesc,Description,UnitPrice,Discount,Thumbnail,Video,DateCreated,DateModified,BestSellers,HomeFlag,Active,Tags,Title,Alias,MetaDesc,MetaKey,UnitsInStock,CategoryId")] Product product, Microsoft.AspNetCore.Http.IFormFile fThumb)
        {
            if (fThumb == null)
            {
                ModelState.Remove(nameof(fThumb));
            }
            if (ModelState.IsValid)
            {
                product.ProductName = Utilities.toTitleCase(product.ProductName);
                if(fThumb != null)
                {
                    string extension = Path.GetExtension(fThumb.FileName);
                    string image = Utilities.seoUrl(product.ProductName) + extension;
                    product.Thumbnail = await Utilities.uploadFile(fThumb, @"products", image.ToLower());
                }
                if (string.IsNullOrEmpty(product.Thumbnail))
                {
                    product.Thumbnail = "default.jpg";
                }
                if (string.IsNullOrEmpty(product.UnitsInStock.ToString()))
                {
                    product.UnitsInStock = 0;
                }
                if (string.IsNullOrEmpty(product.Discount.ToString()))
                {
                    product.Discount = 0;
                }
                product.Alias = Utilities.seoUrl(product.ProductName);
                product.DateCreated = DateTime.Now;
                product.DateModified = DateTime.Now;

                _context.Add(product);
                await _context.SaveChangesAsync();
                _notyfService.Success("Thêm mới thành công!");
                return RedirectToAction(nameof(Index));
            }
            ViewData["CategoryList"] = new SelectList(_context.Categories, "CategoryId", "CategoryName", product.CategoryId);
            _notyfService.Error("Vui lòng kiểm tra lại!");
            return View(product);
        }

        // GET: Admin/AdminProducts/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Products == null)
            {
                return NotFound();
            }

            var product = await _context.Products.FindAsync(id);
            if (product == null)
            {
                return NotFound();
            }
            ViewData["CategoryList"] = new SelectList(_context.Categories, "CategoryId", "CategoryName", product.CategoryId);
            return View(product);
        }

        // POST: Admin/AdminProducts/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("ProductId,ProductName,ShortDesc,Description,UnitPrice,Discount,Thumbnail,Video,DateCreated,DateModified,BestSellers,HomeFlag,Active,Tags,Title,Alias,MetaDesc,MetaKey,UnitsInStock,CategoryId")] Product product, Microsoft.AspNetCore.Http.IFormFile fThumb)
        {
            if (id != product.ProductId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    product.ProductName = Utilities.toTitleCase(product.ProductName);
                    if (fThumb != null)
                    {
                        string extension = Path.GetExtension(fThumb.FileName);
                        string image = Utilities.seoUrl(product.ProductName) + extension;
                        product.Thumbnail = await Utilities.uploadFile(fThumb, @"products", image.ToLower());
                    }
                    if (string.IsNullOrEmpty(product.Thumbnail))
                    {
                        product.Thumbnail = "default.jpg";
                    }
                    product.Alias = Utilities.seoUrl(product.ProductName);
                    product.DateModified = DateTime.Now;

                    _context.Update(product);
                    await _context.SaveChangesAsync();
                    _notyfService.Success("Cập nhật thành công!");
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ProductExists(product.ProductId))
                    {
                        _notyfService.Error("Có lỗi xảy ra!");
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["CategoryList"] = new SelectList(_context.Categories, "CategoryId", "CategoryName", product.CategoryId);
            return View(product);
        }

        // GET: Admin/AdminProducts/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Products == null)
            {
                return NotFound();
            }

            var product = await _context.Products
                .Include(p => p.Category)
                .FirstOrDefaultAsync(m => m.ProductId == id);
            if (product == null)
            {
                return NotFound();
            }

            return View(product);
        }

        // POST: Admin/AdminProducts/Delete/5
        [HttpDelete]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Products == null)
            {
                _notyfService.Error("Có lỗi xảy ra!");
                return Json(new { success = false });
            }

            try
            {
                var product = await _context.Products.FindAsync(id);
                if (product != null)
                {
                    _context.Products.Remove(product);
                    await _context.SaveChangesAsync();
                    _notyfService.Success("Xóa thành công!");
                    return Json(new { success = true, redirectUrl = Url.Action("Index", "AdminProducts", new { Area = "Admin" }) });
                }
                else
                {
                    _notyfService.Error("Có lỗi xảy ra!");
                    return Json(new { success = false });
                }
            }
            catch (Exception ex)
            {
                // Log exception details here if needed
                return Json(new { success = false, message = "An error occurred while deleting the product: " + ex.Message });
            }
        }


        public async Task<IActionResult> DeleteAll()
        {
            if (_context.Products == null)
            {
                return Problem("Entity set 'iMarketDBContext.Products' is null.");
            }

            var products = await _context.Products.ToListAsync();
            if (products.Any())
            {
                _context.Products.RemoveRange(products);
                await _context.SaveChangesAsync();
                _notyfService.Success("Xóa tất cả sản phẩm thành công!");
            }
            else
            {
                _notyfService.Warning("Không có sản phẩm nào để xóa.");
            }

            return RedirectToAction(nameof(Index));
        }

        private bool ProductExists(int id)
        {
          return (_context.Products?.Any(e => e.ProductId == id)).GetValueOrDefault();
        }
    }
}
