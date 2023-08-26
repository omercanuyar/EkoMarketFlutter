using System;
using System.Collections.Generic;

namespace EKOMARKET.CORE.Models;

public partial class Transaction
{
    public int Id { get; set; }

    public int? Userid { get; set; }

    public double? Discountedvalue { get; set; }

    public int? Userrating { get; set; }

    public int? Marketid { get; set; }

    public double? Distance { get; set; }
}
