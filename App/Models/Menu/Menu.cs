using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace ACSS.Web.Models.Menu;

public class Menu {
    [JsonPropertyName("items")]
    public List<MenuItem> Items { get; set; }
}
