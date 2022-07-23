using ACSS.Web.Models.Menu;
using Microsoft.AspNetCore.Components;

namespace ACSS.Web.Components;

partial class ListItem {
    [Parameter]
    public MenuItem MenuItem { get; set; }

    public void ToggleExpanded() {
        MenuItem.IsExpanded = !MenuItem.IsExpanded;
    }
}
