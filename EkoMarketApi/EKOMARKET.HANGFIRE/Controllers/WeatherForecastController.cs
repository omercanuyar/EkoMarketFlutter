using Hangfire;
using Microsoft.AspNetCore.Mvc;

namespace EKOMARKET.HANGFIRE.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class WeatherForecastController : ControllerBase
    {
        private static readonly string[] Summaries = new[]
        {
        "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
    };

        private readonly ILogger<WeatherForecastController> _logger;

        public WeatherForecastController(ILogger<WeatherForecastController> logger)
        {
            _logger = logger;
        }

        [HttpGet(Name = "GetWeatherForecast")]
        [Obsolete]
        public void Get()
        {
            RecurringJob.AddOrUpdate(() => Console.WriteLine("Welcome user in Recurring Job Demo!"), Cron.Hourly);
        }
    }
}