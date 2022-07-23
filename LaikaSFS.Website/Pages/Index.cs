using LaikaSFS.Website.Data;
using LaikaSFS.Website.Models.Menu;
using Microsoft.AspNetCore.Components;

namespace LaikaSFS.Website.Pages;

public partial class Index {
    public Menu Menu { get; set; }

    private bool _loading { get; set; }

    [Inject]
    public SFSContext SFSContext { get; set; }

    protected override async Task OnAfterRenderAsync(bool firstRender) {
        if (firstRender || _loading) {
            Menu = await SFSContext.GetMenu();
            _loading = false;
            StateHasChanged();
        }
    }

    public void ToggleExpanded()
    {
        Menu.IsExpanded = !Menu.IsExpanded;
    }

    public void ToggleChecked()
    {
        Menu.IsChecked = !Menu.IsChecked;
        Menu.SetChecked(Menu.IsChecked);
        if (Menu.IsChecked)
        {
            Menu.SetExpanded(Menu.IsChecked);
        }
    }
}
