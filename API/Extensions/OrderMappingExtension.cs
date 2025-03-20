using API.DTOs;
using Core.Entities.OrderAggregate;

namespace API.Extensions
{
    public static class OrderMappingExtension
    {
        public static OrderDto ToDto(this Order order)
        {
            return new OrderDto
            {
                Id = order.Id,
                OrderDate = order.OrderDate,
                BuyerEmail = order.BuyerEmail,
                ShippingAddress = order.ShippingAddress,
                DeliveryMethod = order.DeliveryMethod.Description,
                PaymentSummary = order.PaymentSummary,
                ShippingPrice = order.DeliveryMethod.Price,
                OrderItems = order.OrderItems.Select(x => x.ToDto()).ToList(),
                Subtotal = order.Subtotal,
                Total = order.GetTotal(),
                Status = order.Status.ToString(),
                PaymentIntentId = order.PaymentIntentId
            };
        }

        public static OrderItemDto ToDto(this OrderItem item)
        {
            return new OrderItemDto
            {
                ProductId = item.ItemOrdered.ProductId,
                ProductName = item.ItemOrdered.Name,
                PictureUrl = item.ItemOrdered.PictureUrl,
                Price = item.Price,
                Quantity = item.Quantity
            };
        }
    }
}
