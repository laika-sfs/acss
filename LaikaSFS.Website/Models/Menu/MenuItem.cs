using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace LaikaSFS.Website.Models.Menu;

public class MenuItem {
    [JsonPropertyName("title")]
    public string Title { get; set; }
    [JsonPropertyName("items")]
    public List<MenuItem> Items { get; set; }
    public bool IsChecked { get; set; }
    public bool IsExpanded { get; set; }

    public void SetChecked(bool isChecked)
    {
        IsChecked = isChecked;

        foreach (MenuItem item in Items)
        {
            item.SetChecked(isChecked);
        }
    }

    public void SetExpanded(bool isExpanded)
    {
        IsExpanded = isExpanded;

        foreach (MenuItem item in Items)
        {
            item.SetExpanded(isExpanded);
        }
    }
}
