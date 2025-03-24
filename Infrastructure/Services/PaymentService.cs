using CloudinaryDotNet.Core;
using Core.Entities;
using Core.Interfaces;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json.Linq;
using Razorpay.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;


namespace Infrastructure.Services
{
    public class PaymentService(ICartService cartService,
            IUnitOfWork unit, RazorpayClient razorpayClient) : IPaymentService
    {


        public async Task<ShoppingCart?> CreateOrUpdatePaymentIntent(string cartId)
        {
            try
            {
                var cart = await cartService.GetCartAsync(cartId);
                if (cart == null) return null;

                var shippingPrice = 0m;
                if (cart.DeliveryMethodId.HasValue)
                {
                    var deliveryMethod = await unit.Repository<DeliveryMethod>().GetByIdAsync((int)cart.DeliveryMethodId);
                    if (deliveryMethod == null) return null;
                    shippingPrice = deliveryMethod.Price;
                }
                foreach (var item in cart.Items)
                {
                    var productItem = await unit.Repository<Product>().GetByIdAsync(item.ProductId);
                    if (productItem == null) return null;
                    if (item.Price != productItem.Price)
                    {
                        item.Price = productItem.Price;
                    }
                }
                long amount = (long)(cart.Items.Sum(i => i.Quantity * i.Price * 100) + (shippingPrice * 100));

                if (amount < 100)
                {
                    amount = 100; 
                }

                var notes = new Dictionary<string, string>();
                for (int i = 0; i < cart.Items.Count; i++)
                {
                    var item = cart.Items[i];
                    notes[$"product_{i + 1}_name"] = item.ProductName;
                    notes[$"product_{i + 1}_quantity"] = item.Quantity.ToString();
                    notes[$"product_{i + 1}_price"] = item.Price.ToString();
                }
                var options = new Dictionary<string, object>
                {
                    { "amount", amount },
                    { "currency", "INR" },
                    { "receipt", cart.Id },
                    { "payment_capture", 1 },
                    { "notes", notes }
                };

                Order order = razorpayClient.Order.Create(options);
                cart.PaymentIntentId = order["id"].ToString();
                cart.ClientSecret = order["id"].ToString();

                await cartService.SetCartAsync(cart);
                return cart;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Razorpay payment creation failed: {ex.Message}");
                return null;
            }
        }
        public CardDetails? GetCardDetails(string razorpayPaymentId)
        {
            try
            {
                var payment = razorpayClient.Payment.Fetch(razorpayPaymentId);

                var card = payment["card"] as JObject;
                var acquirerData = payment["acquirer_data"] as JObject;

                if (card == null || acquirerData == null) return null;

                var cardDetails = new CardDetails
                {
                    CardId = card.ContainsKey("id") ? card["id"]?.ToString() : null,
                    Last4 = card.ContainsKey("last4") ? card["last4"]?.ToString() : null,
                    CardType = card.ContainsKey("network") ? card["network"]?.ToString() : null,
                    NameOnCard = card.ContainsKey("name") ? card["name"]?.ToString() : "--",
                    AuthCode = acquirerData.ContainsKey("auth_code") ? acquirerData["auth_code"]?.ToString() : ""
                };


                return cardDetails;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error fetching card details: {ex.Message}");
                return null;
            }
        }


    }
}
