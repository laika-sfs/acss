using LaikaSFS.Website.Data;
using LaikaSFS.Website.Models.Menu;
using LaikaSFS.Website.Services;
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
}
