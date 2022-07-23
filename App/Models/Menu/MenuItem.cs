using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace ACSS.Web.Models.Menu;

public class MenuItem {
    [JsonPropertyName("title")]
    public string Title { get; set; }
    [JsonPropertyName("items")]
    public List<MenuItem> Items { get; set; }
    public bool IsChecked { get; set; }
    public bool IsExpanded { get; set; }
}
