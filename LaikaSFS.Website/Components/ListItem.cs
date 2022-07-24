using LaikaSFS.Website.Models.Menu;
using Microsoft.AspNetCore.Components;

namespace LaikaSFS.Website.Components;

partial class ListItem {
    [Parameter]
    public MenuItem MenuItem { get; set; }
    [Parameter]
    public EventCallback<MenuItem> ChildEventCallback { get; set; }

    public void ToggleExpanded()
    {
        MenuItem.IsExpanded = !MenuItem.IsExpanded;
    }

    public void ToggleChecked()
    {
        switch (MenuItem.IsChecked) {
            case true:
                MenuItem.IsChecked = false;
                break;
            case null:
                MenuItem.IsChecked = false;
                break;
            default:
                MenuItem.IsChecked = true;
                break;
        }
        MenuItem.SetChecked(MenuItem.IsChecked);
        if (MenuItem.IsChecked == true)
        {
            MenuItem.SetExpanded(true);
        }
        ChildEventCallback.InvokeAsync(MenuItem.Parent);
    }

    public async void UpdateData(MenuItem menuItem) {
        MenuItem = menuItem;
        if (menuItem.Parent != null) {
            await ChildEventCallback.InvokeAsync(menuItem.Parent);
        }
        StateHasChanged();
    }
}
