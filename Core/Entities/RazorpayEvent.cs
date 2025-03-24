using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Entities
{
    public class RazorpayEvent
    {
        [JsonProperty("event")]
        public string EventType { get; set; }

        [JsonProperty("payload")]
        public Dictionary<string, dynamic> Payload { get; set; }
    }
}
