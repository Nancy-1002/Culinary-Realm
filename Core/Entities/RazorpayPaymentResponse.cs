using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Entities
{
    public class RazorpayPaymentResponse
    {
        public required string razorpay_order_id { get; set; }
        public required string razorpay_payment_id { get; set; }
        public required string razorpay_signature { get; set; }
    }

}
