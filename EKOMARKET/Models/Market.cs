using System;
using System.Collections.Generic;

namespace EKOMARKET.Models;

public partial class Market
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public double? Latitude { get; set; }

    public double? Longitude { get; set; }

    public virtual ICollection<Marketproduct> Marketproducts { get; set; } = new List<Marketproduct>();
}
