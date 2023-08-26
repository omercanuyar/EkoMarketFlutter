using EKOMARKET.CORE.Models;
using EKOMARKET.CORE.Models.RequestModels;
using EKOMARKET.CORE.Models.ResponseModels;
using Microsoft.AspNetCore.Mvc;

namespace EKOMARKET.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class MarketController : ControllerBase
    {
        private readonly EkomarketContext _context;

        public MarketController(EkomarketContext context)
        {
            _context = context;
        }

        [HttpPost]
        public ActionResult<BasketResponse> GetCheapestMarket([FromBody] Basket basket)
        {
            if (basket == null || basket.BasketObjects == null || basket.BasketObjects.Count == 0)
            {
                return BadRequest("Basket is empty.");
            }

            var basketResponse = new BasketResponse();
            var cheapestMarket = GetCheapestMarket(basket, out double? totalPrice);

            if (cheapestMarket == null)
            {
                return NotFound("No market found.");
            }

            basketResponse.Market = cheapestMarket;
            basketResponse.Price = totalPrice ?? 0;

            var avgPrice = CalculateAveragePrice(basket);
            basketResponse.AvgPrice = avgPrice;

            return Ok(basketResponse);
        }

        private Marketresponse GetCheapestMarket(Basket basket, out double? totalPrice)
        {
            var markets = _context.Markets.ToList();

            totalPrice = double.MaxValue;
            Marketresponse cheapestMarket = null;

            foreach (var market in markets)
            {
                double? marketTotalPrice = CalculateMarketTotalPrice(basket, market);

                if (marketTotalPrice.HasValue && marketTotalPrice < totalPrice)
                {
                    totalPrice = marketTotalPrice;
                    cheapestMarket = new Marketresponse() { Id = market.Id, Name = market.Name, Latitude = market.Latitude, Longitude = market.Longitude };
                }
            }

            return cheapestMarket;
        }

        private double? CalculateMarketTotalPrice(Basket basket, Market market)
        {
            double totalPrice = 0;

            foreach (var basketObject in basket.BasketObjects)
            {
                var productId = basketObject.ProductId;
                var quantity = basketObject.Quantity;

                var marketProduct = _context.Marketproducts
                    .FirstOrDefault(mp => mp.Marketid == market.Id && mp.Productid == productId);

                if (marketProduct != null)
                {
                    totalPrice += marketProduct.Price * quantity;
                }
            }

            return totalPrice == 0 ? null : totalPrice;
        }

        private double CalculateAveragePrice(Basket request)
        {
            var marketIds = _context.Markets.Select(m => m.Id).ToList();
            var totalPrice = 0.0;
            var totalCount = 0;

            foreach (var marketId in marketIds)
            {
                var marketPrice = 0.0;
                var productCount = 0;

                foreach (var basketObject in request.BasketObjects)
                {
                    var product = _context.Products.FirstOrDefault(p => p.Id == basketObject.ProductId);

                    if (product != null)
                    {
                        var marketProduct = _context.Marketproducts.FirstOrDefault(mp => mp.Marketid == marketId && mp.Productid == product.Id);

                        if (marketProduct != null)
                        {
                            marketPrice += marketProduct.Price * basketObject.Quantity;
                            productCount++;
                        }
                    }
                }

                if (productCount > 0)
                {
                    totalPrice += marketPrice;
                    totalCount++;
                }
            }

            if (totalCount > 0)
            {
                return totalPrice / totalCount;
            }

            return 0.0;
        }

    }

}
