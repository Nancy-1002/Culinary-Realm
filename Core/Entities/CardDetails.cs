using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Entities
{
    public class CardDetails
    {
        public required string CardId { get; set; }
        public required string Last4 { get; set; }
        public required string CardType { get; set; }
        public required string NameOnCard { get; set; }
        public required string AuthCode { get; set; }
    }
}
