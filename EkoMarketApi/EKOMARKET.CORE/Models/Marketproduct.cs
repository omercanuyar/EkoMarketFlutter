using System;
using System.Collections.Generic;

namespace EKOMARKET.CORE.Models;

public partial class Marketproduct
{
    public int Marketid { get; set; }

    public int Productid { get; set; }

    public double Price { get; set; }

    public virtual Market Market { get; set; } = null!;

    public virtual Product Product { get; set; } = null!;
}
