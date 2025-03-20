using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Entities.OrderAggregate
{
    [Owned]
    public class PaymentSummary 
    {
        public int Last4 { get; set; }
        public string? Brand { get; set; }
        public int ExpMonth { get; set; }
        public int Year { get; set; }

    }
}
