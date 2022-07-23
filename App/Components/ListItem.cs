using LaikaSFS.Website.Models.Menu;
using Microsoft.AspNetCore.Components;

namespace LaikaSFS.Website.Components;

partial class ListItem {
    [Parameter]
    public MenuItem MenuItem { get; set; }

    public void ToggleExpanded() {
        MenuItem.IsExpanded = !MenuItem.IsExpanded;
    }
}
