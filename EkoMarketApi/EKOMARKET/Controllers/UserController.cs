using Microsoft.AspNetCore.Mvc;

namespace EKOMARKET.Controllers
{
    public class UserController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
