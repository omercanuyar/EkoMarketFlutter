using EKOMARKET.CORE.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.ML;
using Microsoft.ML.Data;

namespace EKOMARKET.Controllers
{

    [ApiController]
    [Route("api/[controller]")]

    public class PredictionController : ControllerBase
    {

        private readonly EkomarketContext _context;
        public PredictionController(EkomarketContext context)
        {
            _context = context;
        }
        public class TransactionML
        {
            [LoadColumn(0)]
            public float DiscountedValue { get; set; }

            [LoadColumn(1)]
            public float UserRating { get; set; }

            [LoadColumn(2)]
            public float MarketId { get; set; }

            [LoadColumn(3)]
            public float Distance { get; set; }

            [LoadColumn(4)]
            public float UserId { get; set; }
        }

        public class TransactionPrediction
        {
            [ColumnName("Score")]
            public float PredictedValue;
        }

        [HttpGet("PredictUserPreference")]
        public void PredictUserPreference()
        {
            var context = new MLContext();
            var data1 = _context.Transactions.ToList();
            var transactionsML = new List<TransactionML>();

            // Transaction'ları TransactionML'ye eşleyin
            foreach (var transaction in data1)
            {
                transactionsML.Add(new TransactionML
                {
                    DiscountedValue = (float)(transaction.Discountedvalue ?? 0),
                    UserRating = (float)(transaction.Userrating ?? 0),
                    MarketId = (float)(transaction.Marketid ?? 0),
                    Distance = (float)(transaction.Distance ?? 0),
                    UserId = (float)(transaction.Userid ?? 0)
                });
            }
           
            

            var pipeline = context.Transforms.CopyColumns(outputColumnName: "Label", inputColumnName: nameof(TransactionML.DiscountedValue))
                .Append(context.Transforms.Categorical.OneHotEncoding(outputColumnName: "CategoricalMarketId", inputColumnName: nameof(TransactionML.MarketId)))
                .Append(context.Transforms.NormalizeMinMax(outputColumnName: nameof(TransactionML.UserRating)))
                .Append(context.Transforms.NormalizeMinMax(outputColumnName: nameof(TransactionML.Distance)))
                .Append(context.Transforms.Concatenate("Features", "CategoricalMarketId", nameof(TransactionML.UserRating), nameof(Transaction.Distance)))
                .Append(context.Regression.Trainers.Sdca())
                .Append(context.Transforms.CopyColumns(outputColumnName: "Score", inputColumnName: nameof(TransactionML.DiscountedValue)));
            var data = context.Data.LoadFromEnumerable(transactionsML);
            var model = pipeline.Fit(data);

            var prediction = model.Transform(data);
            var metrics = context.Regression.Evaluate(prediction);

            Console.WriteLine($"R^2: {metrics.RSquared}");
        }
    }
}
