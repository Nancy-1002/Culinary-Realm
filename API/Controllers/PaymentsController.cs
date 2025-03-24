using Core.Entities;
using Core.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Cryptography;
using System.Text;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using Core.Entities.OrderAggregate;
using Core.Specifications;

namespace API.Controllers
{
    public class PaymentsController(IPaymentService paymentService,
        IUnitOfWork unit, IConfiguration _configuration, ILogger<PaymentsController> logger) : BaseApiController
    {
        private readonly string _whSecret = "";
        [Authorize]
        [HttpPost("{cartId}")]
        public async Task<ActionResult<ShoppingCart>> CreateOrUpdatePaymentIntent(string cartId)
        {
            var cart = await paymentService.CreateOrUpdatePaymentIntent(cartId);
            if (cart == null) return BadRequest("Problem with your cart");

            return Ok(cart);
        }

        [HttpGet("deliveryMethods")]
        public async Task<ActionResult<IReadOnlyList<DeliveryMethod>>> GetDeliveryMethods()
        {
            return Ok(await unit.Repository<DeliveryMethod>().ListAllAsync());
        }
        [HttpPost("verify")]
        public IActionResult VerifyPayment([FromBody] RazorpayPaymentResponse paymentResponse)
        {
            string secret = _configuration["RazorPaySettings:SecretKey"]; // from appsettings.json or user secrets

            string payload = $"{paymentResponse.razorpay_order_id}|{paymentResponse.razorpay_payment_id}";
            string generatedSignature;
            using (var hmac = new HMACSHA256(Encoding.UTF8.GetBytes(secret)))
            {
                var hash = hmac.ComputeHash(Encoding.UTF8.GetBytes(payload));
                generatedSignature = BitConverter.ToString(hash).Replace("-", "").ToLower();
            }

            if (generatedSignature == paymentResponse.razorpay_signature)
            {
                // ✅ Signature matches – mark order as paid
                // Save to DB, update order status, etc.
                return Ok(new { success = true, message = "Payment verified successfully" });
            }
            else
            {
                // ❌ Signature mismatch – possible fraud
                return BadRequest(new { success = false, message = "Payment verification failed" });
            }
        }
        [HttpGet("card-details/{paymentId}")]
        public ActionResult<CardDetails> GetCardDetails(string paymentId)
        {
            var cardDetails = paymentService.GetCardDetails(paymentId);
            if (cardDetails == null)
            {
                return BadRequest("Unable to fetch card details.");
            }

            return Ok(cardDetails);
        }
        [HttpPost("webhook")]
        public async Task<IActionResult> RazorpayWebhook()
        {
            var json = await new StreamReader(Request.Body).ReadToEndAsync();

            try
            {
                var razorpayEvent = ConstructRazorpayEvent(json);

                // Optional: Add logic based on event type
                switch (razorpayEvent.EventType)
                {
                    case "payment.captured":
                        string paymentId = razorpayEvent.Payload["payment"]["entity"]["id"]?.ToString();
                        logger.LogInformation("Payment captured: {PaymentId}", paymentId);
                        await HandlePaymentIntentSucceeded(paymentId);
                        break;

                    case "order.paid":
                        string orderId = razorpayEvent.Payload["order"]["entity"]["id"]?.ToString();
                        logger.LogInformation("Order paid: {OrderId}", orderId);
                        break;
                    default:
                        logger.LogInformation("Unhandled event type: " + razorpayEvent.EventType);
                        break;
                }
             
                return Ok();
            }
            catch (Exception ex)
            {
                logger.LogError(ex, "Error processing Razorpay webhook");
                return BadRequest("Webhook error");
            }
        }
        private async Task HandlePaymentIntentSucceeded(string paymentIntentId)
        {
            var spec = new OrdersSpecification(paymentIntentId, isPaymentIntent: true);

            var order = await unit.Repository<Order>().GetEntityWithSpec(spec);
            if (order == null)
            {
                logger.LogWarning("Order not found for PaymentIntentId: {PaymentIntentId}", paymentIntentId);
                return;
            }
            
            order.Status = OrderStatus.PaymentRecevied;

            unit.Repository<Order>().Update(order);
            await unit.Complete(); 

            logger.LogInformation("Order updated to PaymentReceived for PaymentIntentId: {PaymentIntentId}", paymentIntentId);
        }

        private RazorpayEvent ConstructRazorpayEvent(string json)
        {
            try
            {
                var razorpayEvent = JsonConvert.DeserializeObject<RazorpayEvent>(json);
                if (razorpayEvent == null)
                    throw new Exception("Invalid webhook event");

                return razorpayEvent;
            }
            catch (JsonException ex)
            {
                throw new Exception("Failed to parse webhook JSON", ex);
            }
        }
    }
}
