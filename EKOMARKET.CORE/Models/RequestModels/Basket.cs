using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EKOMARKET.CORE.Models.RequestModels
{
    public class Basket
    {
        public List<BasketObject> BasketObjects { get; set; }
    }

    public class BasketObject
    {
        public int ProductId { get; set; }  
        public int Quantity { get; set; }
    }
}
