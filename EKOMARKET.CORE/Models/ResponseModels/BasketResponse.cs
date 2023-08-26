using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EKOMARKET.CORE.Models.ResponseModels
{
    public class BasketResponse
    {
       public Marketresponse Market { get; set; }
        public double Price { get; set; }
        public double AvgPrice { get; set; }
    }
}
