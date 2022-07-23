using ACSS.Web.Data;
using ACSS.Web.Models.Menu;
using ACSS.Web.Services;
using Microsoft.AspNetCore.Components;

namespace ACSS.Web.Pages;

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
