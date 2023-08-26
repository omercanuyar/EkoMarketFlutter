using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EKOMARKET.CORE.Models.ResponseModels
{
    public class CategoryResponse
    {
        public int Id { get; set; }

        public string Name { get; set; } = null!;

        public string Imageurl { get; set; } = null!;
    }
}
