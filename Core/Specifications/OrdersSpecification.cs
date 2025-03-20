using Core.Entities.OrderAggregate;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Specifications
{
    public class OrdersSpecification : BaseSpecification<Order>
    {
        public OrdersSpecification(string email) : base(o => o.BuyerEmail == email)
        {
            AddInclude(x => x.OrderItems);
            AddInclude(x => x.DeliveryMethod);
            AddOrderByDesc(x => x.OrderDate);
        }

        public OrdersSpecification(string email, int id): base(o => o.Id == id && o.BuyerEmail == email)
        {
            AddInclude("OrderItems");
            AddInclude("DeliveryMethod");

        }
    }
}
