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

    private Stream GetFileStream() {
        return File.OpenRead(@".\wwwroot\ACSS.zip");
    }

    private async Task DownloadFileFromStream() {
        Stream fileStream = GetFileStream();
        string fileName = "ACSS.zip";

        using DotNetStreamReference? streamRef = new DotNetStreamReference(stream: fileStream);

        await JS.InvokeVoidAsync("downloadFileFromStream", fileName, streamRef);
    }

    private async Task DownloadFileFromURL() {
        string fileName = "ACSS.zip";
        string fileURL = "https://laikasfs.azurewebsites.net/ACSS.zip";
        await JS.InvokeVoidAsync("triggerFileDownload", fileName, fileURL);
    }
}
