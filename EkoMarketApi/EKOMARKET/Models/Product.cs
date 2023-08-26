using System;
using System.Collections.Generic;

namespace EKOMARKET.Models;

public partial class Product
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string? Explanation { get; set; }

    public string? Imageurl { get; set; }

    public virtual ICollection<Marketproduct> Marketproducts { get; set; } = new List<Marketproduct>();

    public virtual ICollection<Category> Categories { get; set; } = new List<Category>();
}
