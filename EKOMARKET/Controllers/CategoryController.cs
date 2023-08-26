using EKOMARKET.CORE.Models;
using EKOMARKET.CORE.Models.ResponseModels;
using Microsoft.AspNetCore.Mvc;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace EKOMARKET.Controllers
{
    [ApiController]
    [Route("[controller]")]


    public class CategoryController : ControllerBase
    {
        JsonSerializerOptions options = new JsonSerializerOptions()
        {
            Encoder = System.Text.Encodings.Web.JavaScriptEncoder.UnsafeRelaxedJsonEscaping,
            WriteIndented = true,
            PropertyNamingPolicy = JsonNamingPolicy.CamelCase,
            DefaultIgnoreCondition = JsonIgnoreCondition.WhenWritingNull
        };

        private readonly EkomarketContext _context;
        public CategoryController(EkomarketContext context)
        {
            _context = context;
        }
        [HttpGet(Name = "GetAllCategories")]
        public async Task<String> GetAllCategories()
        {
            var list =  _context.Categories.ToList();
            var categories = new List<CategoryResponse>();
            foreach (var item in list)
            {
                var a = new CategoryResponse() { Id = item.Id, Name = item.Name,Imageurl=item.Imageurl};
                categories.Add(a);
            }
            return JsonSerializer.Serialize(categories,options);
        }
    }
}
