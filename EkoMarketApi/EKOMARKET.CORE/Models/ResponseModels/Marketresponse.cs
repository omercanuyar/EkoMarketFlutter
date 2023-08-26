using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EKOMARKET.CORE.Models.ResponseModels
{
    public class Marketresponse
    {
        public int Id { get; set; }

        public string Name { get; set; } = null!;

        public double? Latitude { get; set; }

        public double? Longitude { get; set; }
    }
}
