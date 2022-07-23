using Microsoft.AspNetCore.Mvc;
using LaikaSFS.Website.Models.Planet;
using LaikaSFS.Website.Data;
using LaikaSFS.Website.Models.Menu;
using Microsoft.EntityFrameworkCore;

namespace LaikaSFS.Website.Services;

public class SFSService {
    private readonly SFSContext _context;

    public SFSService(SFSContext context) {
        _context = context;
    }

    private MenuItem GetMenuItems(Tree? tree) {
        MenuItem menuItem = new();
        if (tree != null) {
            menuItem.Title = tree.Title;
            menuItem.Items = new();

            if (tree.InverseParent.Any()) {
                foreach (Tree subTree in tree.InverseParent.OrderBy(tr => tr.OrderBy)) {
                    menuItem.Items.Add(GetMenuItems(subTree));
                }
            }
        }
        return menuItem;
    }

    [HttpGet("menu")]
    public async Task<Menu> GetMenu() {
        if (_context.Tree == null) {
            return new();
        }
        Tree? tree = await _context.Tree.FindAsync(1);

        if (tree == null) {
            return new();
        }
        Menu menu = new() {
            Items = new()
        };
        
        foreach (Tree subTree in tree.InverseParent.OrderBy(tr => tr.OrderBy)) {
            menu.Items.Add(GetMenuItems(subTree));
        }
        return menu;
    }

    //// GET: api/Planets
    //[HttpGet]
    //public async Task<ActionResult<IEnumerable<Planet>>> GetPlanet() {
    //    if (_context.Planet == null) {
    //        return new();
    //    }
    //    return await _context.Planet.ToListAsync();
    //}

    //// GET: api/Planets/json
    //[HttpGet("json")]
    //public async Task<ActionResult<IEnumerable<KeyValuePair<string, PlanetData>>>> GetPlanetJson() {
    //    if (_context.Planet == null) {
    //        return NotFound();
    //    }



    //    Dictionary<string, PlanetData> planetDataList = new();
    //    List<Planet> planetList = await _context.Planet.ToListAsync();

    //    foreach (var planet in planetList) {
    //        planetDataList[planet.Title] = planet.ToJson();
    //    }

    //    return planetDataList;
    //}

    //// GET: api/Planets/5
    //[HttpGet("{id}")]
    //public async Task<ActionResult<Planet>> GetPlanet(int id) {
    //    if (_context.Planet == null) {
    //        return NotFound();
    //    }
    //    var planet = await _context.Planet.FindAsync(id);

    //    if (planet == null) {
    //        return NotFound();
    //    }

    //    return planet;
    //}

    //// GET: api/Planets/5
    //[HttpGet("{id}/json")]
    //public async Task<ActionResult<PlanetData>> GetPlanetJson(int id) {
    //    if (_context.Planet == null) {
    //        return NotFound();
    //    }
    //    var planet = await _context.Planet.FindAsync(id);

    //    if (planet == null) {
    //        return NotFound();
    //    }

    //    return planet.ToJson();
    //}

    //// PUT: api/Planets/5
    //// To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
    //[HttpPut("{id}")]
    //public async Task<IActionResult> PutPlanet(int id, Planet planet) {
    //    if (id != planet.Id) {
    //        return BadRequest();
    //    }

    //    _context.Entry(planet).State = EntityState.Modified;

    //    try {
    //        await _context.SaveChangesAsync();
    //    }
    //    catch (DbUpdateConcurrencyException) {
    //        if (!PlanetExists(id)) {
    //            return NotFound();
    //        }
    //        else {
    //            throw;
    //        }
    //    }

    //    return NoContent();
    //}

    //// POST: api/Planets
    //// To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
    //[HttpPost]
    //public async Task<ActionResult<Planet>> PostPlanet(Planet planet) {
    //    if (_context.Planet == null) {
    //        return Problem("Entity set 'PlanetContext.Planet'  is null.");
    //    }
    //    _context.Planet.Add(planet);
    //    await _context.SaveChangesAsync();

    //    return CreatedAtAction("GetPlanet", new { id = planet.Id }, planet);
    //}

    //// POST: api/Planets
    //// To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
    //[HttpPost("json")]
    //public async Task<ActionResult<PlanetData>> PostPlanetJson(PlanetData planetData, string title) {
    //    Planet planet = _context.CreatePlanetFromJson(planetData, title);

    //    if (_context.Planet == null) {
    //        return Problem("Entity set 'PlanetContext.Planet'  is null.");
    //    }
    //    _context.Planet.Add(planet);
    //    await _context.SaveChangesAsync();

    //    return CreatedAtAction("GetPlanetJson", new { id = planet.Id }, planetData);
    //}

    //// DELETE: api/Planets/5
    //[HttpDelete("{id}")]
    //public async Task<IActionResult> DeletePlanet(int id) {
    //    if (_context.Planet == null) {
    //        return NotFound();
    //    }
    //    var planet = await _context.Planet.FindAsync(id);
    //    if (planet == null) {
    //        return NotFound();
    //    }

    //    _context.Planet.Remove(planet);
    //    await _context.SaveChangesAsync();

    //    return NoContent();
    //}

    //private bool PlanetExists(int id) {
    //    return (_context.Planet?.Any(e => e.Id == id)).GetValueOrDefault();
    //}
}
