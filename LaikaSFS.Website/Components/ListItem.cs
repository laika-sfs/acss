using LaikaSFS.Website.Models.Menu;
using Microsoft.AspNetCore.Components;

namespace LaikaSFS.Website.Components;

partial class ListItem {
    [Parameter]
    public MenuItem MenuItem { get; set; }

    public void ToggleExpanded()
    {
        MenuItem.IsExpanded = !MenuItem.IsExpanded;
    }

    public void ToggleChecked()
    {
        MenuItem.IsChecked = !MenuItem.IsChecked;
        MenuItem.SetChecked(MenuItem.IsChecked);
        if (MenuItem.IsChecked)
        {
            MenuItem.SetExpanded(MenuItem.IsChecked);
        }
    }
}
