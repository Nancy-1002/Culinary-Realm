using API.DTOs;
using Core.Entities.OrderAggregate;
using Core.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Core.Entities;
using API.Extensions;
using Core.Specifications;
namespace API.Controllers
{
    [Authorize]
    public class OrdersController(ICartService cartService, IUnitOfWork unit) : BaseApiController
    {
        [HttpPost]
        public async Task<ActionResult<Order>> CreateOrder(CreateOrderDto orderDto)
        {
            var email = User.GetEmail();
            var cart = await cartService.GetCartAsync(orderDto.CartId);
            if (cart == null)
            {
                return BadRequest("Cart not found");
            }
            if (cart.PaymentIntentId == null)
            {
                return BadRequest("Payment intent not found");
            }
            var items = new List<OrderItem>();
            foreach (var item in cart.Items)
            {
                var productItem = await unit.Repository<Product>().GetByIdAsync(item.ProductId);
                if(productItem == null)
                {
                    return BadRequest("Product not found");
                }
                var itemOrdered = new ProductItemOrdered
                {
                    ProductId = item.ProductId,
                    Name = item.ProductName,
                    PictureUrl = item.PictureUrl
                };
                var orderItem = new OrderItem
                {
                    ItemOrdered = itemOrdered,
                    Price = productItem.Price,
                    Quantity = item.Quantity
                };
                items.Add(orderItem);
            }

            var deliveryMethod = await unit.Repository<DeliveryMethod>().GetByIdAsync(orderDto.DeliveryMethodId);
            if(deliveryMethod == null)
            {
                return BadRequest("Delivery method not found");
            }
            var order = new Order
            {
                OrderItems = items,
                DeliveryMethod = deliveryMethod,
                ShippingAddress = orderDto.ShippingAddress,
                Subtotal = items.Sum(x => x.Price * x.Quantity),
                PaymentSummary = orderDto.PaymentSummary,
                PaymentIntentId = cart.PaymentIntentId,
                BuyerEmail = email
            };
            unit.Repository<Order>().Add(order);

            if(await unit.Complete())
            {
                return order;
            }

            return BadRequest("Problem creating order");
        }

        [HttpGet]
        public async Task<ActionResult<IReadOnlyList<OrderDto>>> GetOrdersForUser()
        {
            var spec = new OrdersSpecification(User.GetEmail());
            var orders = await unit.Repository<Order>().ListAsync(spec);
            var ordersToReturn = orders.Select(order => order.ToDto()).ToList();
            return Ok(ordersToReturn);
        }

        [HttpGet("{id:int}")]
        public async Task<ActionResult<OrderDto>> GetOrderById(int id)
        {
            var spec = new OrdersSpecification(User.GetEmail(), id);
            var order = await unit.Repository<Order>().GetEntityWithSpec(spec);
            if (order == null)
            {
                return NotFound();
            }
            return order.ToDto();
        }
    }
}
