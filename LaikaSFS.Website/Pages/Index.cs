using LaikaSFS.Website.Data;
using LaikaSFS.Website.Models.Menu;
using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;

namespace LaikaSFS.Website.Pages;

public partial class Index {
    public Menu Menu { get; set; }

    private bool _loading { get; set; }

    [Inject]
    public SFSContext SFSContext { get; set; }
    [Inject]
    public IJSRuntime JS { get; set; }
    [Inject]
    public IConfiguration Configuration { get; set; }

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
        switch (Menu.IsChecked) {
            case true:
                Menu.IsChecked = false;
                break;
            case null:
                Menu.IsChecked = false;
                break;
            default:
                Menu.IsChecked = true;
                break;
        }
        Menu.SetChecked(Menu.IsChecked);
        if (Menu.IsChecked == true) {
            Menu.SetExpanded(true);
        }
    }

    private async Task DownloadFileFromURL() {
        string fileName = "ACSS.zip";
        string fileURL = $"{Configuration.GetValue<string>("SiteURL")}/ACSS.zip";
        await JS.InvokeVoidAsync("triggerFileDownload", fileName, fileURL);
    }
}
