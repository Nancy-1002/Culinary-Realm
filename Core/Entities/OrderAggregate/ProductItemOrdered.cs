using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Entities.OrderAggregate
{
    [Owned]
    public class ProductItemOrdered 
    {
        public int ProductId { get; set; } 
        public required string Name { get; set; }
        public required string PictureUrl { get; set; }

    }
}
