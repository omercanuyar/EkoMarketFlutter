using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EKOMARKET.CORE.Models.RequestModels
{
    public class ProductRequestModel
    {
        public int Id { get; set; }

        public string Name { get; set; } = null!;

        public string? Explanation { get; set; }

        public string? Imageurl { get; set; }

    }
}
