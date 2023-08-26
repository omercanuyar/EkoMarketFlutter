using EKOMARKET.CORE.Models;
using EKOMARKET.CORE.Models.ResponseModels;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace EKOMARKET.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ProductController : ControllerBase
    {
        private readonly EkomarketContext _context;
        public ProductController(EkomarketContext context)
        {
            _context = context;
        }

        JsonSerializerOptions options = new JsonSerializerOptions()
        {
            Encoder = System.Text.Encodings.Web.JavaScriptEncoder.UnsafeRelaxedJsonEscaping,
            WriteIndented = true,
            PropertyNamingPolicy = JsonNamingPolicy.CamelCase,
            DefaultIgnoreCondition = JsonIgnoreCondition.WhenWritingNull
        };

        [HttpGet("GetAllProducts")]
        public async Task<String> GetProducts()
        {
            List<Product> products =await _context.Products.ToListAsync();
            List<ProductResponse> productResponses = products.Select(p => MapToProductResponse(p)).ToList();
            return JsonSerializer.Serialize(productResponses);
        }

        private ProductResponse MapToProductResponse(Product product)
        {
            return new ProductResponse
            {
                Id = product.Id,
                Name = product.Name,
                Explanation = product.Explanation,
                Imageurl = product.Imageurl
            };
        }
        [HttpGet("product/{categoryId}")]
        public String GetProductsByCategory(int categoryId)
        {
            // Category id'ye göre Category nesnesini getir.
            var category =  _context.Categories.FirstOrDefault(c => c.Id == categoryId);

            if (category == null)
            {
                return "Category not found";
            }

            // Product listesini getir.
            var products =  _context.Products
                .Where(p => p.Categories.Any(c => c.Id == category.Id))
                .ToList();
            var a = JsonSerializer.Serialize(products,options);
            return a;
        }
        [HttpGet("product/update")]
        public void AdjustProductPrices()
        {
            var marketProducts = _context.Marketproducts.ToList();
            var random = new Random();

            foreach (var marketProduct in marketProducts)
            {
                var currentPrice = marketProduct.Price;
                var percentChange = random.NextDouble() * 0.2 - 0.1; // -0.1 ile 0.1 arasında rastgele bir yüzde değişiklik

                var newPrice = currentPrice + (currentPrice * percentChange);
                newPrice = Math.Round(newPrice, 2); // İki ondalık basamağa yuvarlama

                marketProduct.Price = newPrice;
            }

            _context.SaveChanges();
        }


    }
}
