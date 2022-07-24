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
    [JsonPropertyName("parent")]
    public MenuItem? Parent { get; set; }
    [JsonPropertyName("menu")]
    public Menu Menu { get; set; }
    public bool? IsChecked { get; set; } = false;
    public bool IsExpanded { get; set; }

    public void ChildChecked() {
        bool firstChild = true;
        bool? state = null;

        foreach (MenuItem item in Items) {
            if (firstChild) {
                firstChild = false;
                state = item.IsChecked;
            }
            else if (state != item.IsChecked) {
                state = null;
                break;
            }
        }

        IsChecked = state;

        if (Parent != null) {
            Parent.ChildChecked();
        }
        else {
            Menu.ChildChecked();
        }
    }

    public void SetChecked(bool? isChecked)
    {
        IsChecked = isChecked;

        Parent?.ChildChecked();

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
