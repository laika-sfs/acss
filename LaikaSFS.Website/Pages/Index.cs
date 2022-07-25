using LaikaSFS.Website.Data;
using LaikaSFS.Website.Models.Menu;
using LaikaSFS.Website.Models.Planet;
using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Components.Forms;
using Microsoft.JSInterop;
using System.IO.Compression;
using System.Net.Http.Headers;
using System.Text.Json;

namespace LaikaSFS.Website.Pages;

public partial class Index {
    public Menu Menu { get; set; }

    private bool _loading { get; set; }
    private bool _filesLoading { get; set; }

    [Inject]
    public SFSContext SFSContext { get; set; }
    [Inject]
    public IJSRuntime JS { get; set; }
    [Inject]
    public IConfiguration Configuration { get; set; }
    [Inject]
    public IHostEnvironment Environment { get; set; }

    protected override async Task OnAfterRenderAsync(bool firstRender) {
        if (firstRender || _loading) {
            Menu = await SFSContext.GetMenu();
            _loading = false;
            StateHasChanged();
        }
    }

    public void ToggleExpanded() {
        Menu.IsExpanded = !Menu.IsExpanded;
    }

    public void ToggleChecked() {
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

    private async Task LoadFiles(InputFileChangeEventArgs e) {
        _filesLoading = true;

        List<StreamContent?> contentList = new();

        foreach (var file in e.GetMultipleFiles(13).OrderBy(file => file.Name)) {
            var fileContent = new StreamContent(file.OpenReadStream());
            fileContent.Headers.Add("name", file.Name.Split('-')[1].Replace(".json", ""));
            contentList.Add(fileContent);

        }

        foreach (var content in contentList) {
            if (content != null) {
                string? name = content.Headers.GetValues("name").ToList().FirstOrDefault();
                PlanetData? planetData = await JsonSerializer.DeserializeAsync<PlanetData>(await content.ReadAsStreamAsync());

                if (name != null && planetData != null) {
                    SFSContext.CreatePlanetFromJson(planetData, name);
                }
            }
        }

        _filesLoading = false;
    }

    private List<string> GetMenuItemPlanetSelection(MenuItem menuItem, List<string> planets) {
        if (menuItem.IsChecked != false && menuItem.MenuType.Split('-')[0] == "PlanetData") {
            planets.Add(menuItem.MenuType.Split('-')[1]);
        }
        foreach (MenuItem subMenuItem in menuItem.Items) {
            planets = GetMenuItemPlanetSelection(subMenuItem, planets);
        }
        return planets;
    }

    public List<string> GetMenuPlanetSelection(Menu menu) {
        List<string> planets = new();
        foreach (MenuItem menuItem in menu.Items) {
            planets = GetMenuItemPlanetSelection(menuItem, planets);
        }
        return planets;
    }

    private async Task DownloadCustomZip() {
        using (MemoryStream zipStream = new()) {
            using (ZipArchive zip = new(zipStream, ZipArchiveMode.Create, true)) {
                List<string> planetsSelected = GetMenuPlanetSelection(Menu);

                foreach (string planet in planetsSelected) {
                    ZipArchiveEntry entry = zip.CreateEntry($"{planet}.txt");

                    using (var sw = new StreamWriter(entry.Open())) {
                        var planetData = SFSContext.Planet.Where(plnt => plnt.Title == planet).First();
                        if (planetData != null) {
                            var json = JsonSerializer.Serialize(planetData.ToJson(), new JsonSerializerOptions() { WriteIndented = true });
                            sw.Write(json);
                        }
                    }
                }
            }

            string fileName = "ACSS_Custom.zip";
            zipStream.Seek(0, SeekOrigin.Begin);

            using var streamRef = new DotNetStreamReference(zipStream);
            await JS.InvokeVoidAsync("downloadFileFromStream", fileName, streamRef);
        }
    }
}
