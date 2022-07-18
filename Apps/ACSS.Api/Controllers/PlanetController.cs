using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ACSS.Api.Models.Planet;
using ACSS.Api.Data;
using ACSS.Lib.Models.Planet;

namespace ACSS.Api.Controllers;

[Route("api/[controller]")]
[ApiController]
public class PlanetController : ControllerBase {
    private readonly PlanetContext _context;

    public PlanetController(PlanetContext context) {
        _context = context;
    }

    // GET: api/Planets
    [HttpGet]
    public async Task<ActionResult<IEnumerable<Planet>>> GetPlanet() {
        if (_context.Planet == null) {
            return NotFound();
        }
        return await _context.Planet.ToListAsync();
    }

    // GET: api/Planets/json
    [HttpGet("json")]
    public async Task<ActionResult<IEnumerable<KeyValuePair<string, PlanetData>>>> GetPlanetJson() {
        if (_context.Planet == null) {
            return NotFound();
        }



        Dictionary<string, PlanetData> planetDataList = new();
        List<Planet> planetList = await _context.Planet.ToListAsync();

        foreach (var planet in planetList) {
            planetDataList[planet.Title] = planet.ToJson();
        }

        return planetDataList;
    }

    // GET: api/Planets/5
    [HttpGet("{id}")]
    public async Task<ActionResult<Planet>> GetPlanet(int id) {
        if (_context.Planet == null) {
            return NotFound();
        }
        var planet = await _context.Planet.FindAsync(id);

        if (planet == null) {
            return NotFound();
        }

        return planet;
    }

    // GET: api/Planets/5
    [HttpGet("{id}/json")]
    public async Task<ActionResult<PlanetData>> GetPlanetJson(int id) {
        if (_context.Planet == null) {
            return NotFound();
        }
        var planet = await _context.Planet.FindAsync(id);

        if (planet == null) {
            return NotFound();
        }

        return planet.ToJson();
    }

    // PUT: api/Planets/5
    // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
    [HttpPut("{id}")]
    public async Task<IActionResult> PutPlanet(int id, Planet planet) {
        if (id != planet.Id) {
            return BadRequest();
        }

        _context.Entry(planet).State = EntityState.Modified;

        try {
            await _context.SaveChangesAsync();
        }
        catch (DbUpdateConcurrencyException) {
            if (!PlanetExists(id)) {
                return NotFound();
            }
            else {
                throw;
            }
        }

        return NoContent();
    }

    // POST: api/Planets
    // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
    [HttpPost]
    public async Task<ActionResult<Planet>> PostPlanet(Planet planet) {
        if (_context.Planet == null) {
            return Problem("Entity set 'PlanetContext.Planet'  is null.");
        }
        _context.Planet.Add(planet);
        await _context.SaveChangesAsync();

        return CreatedAtAction("GetPlanet", new { id = planet.Id }, planet);
    }

    // POST: api/Planets
    // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
    [HttpPost("json")]
    public async Task<ActionResult<PlanetData>> PostPlanetJson(PlanetData planetData, string title) {
        Planet planet = _context.CreatePlanetFromJson(planetData, title);

        if (_context.Planet == null) {
            return Problem("Entity set 'PlanetContext.Planet'  is null.");
        }
        _context.Planet.Add(planet);
        await _context.SaveChangesAsync();

        return CreatedAtAction("GetPlanetJson", new { id = planet.Id }, planetData);
    }

    // DELETE: api/Planets/5
    [HttpDelete("{id}")]
    public async Task<IActionResult> DeletePlanet(int id) {
        if (_context.Planet == null) {
            return NotFound();
        }
        var planet = await _context.Planet.FindAsync(id);
        if (planet == null) {
            return NotFound();
        }

        _context.Planet.Remove(planet);
        await _context.SaveChangesAsync();

        return NoContent();
    }

    private bool PlanetExists(int id) {
        return (_context.Planet?.Any(e => e.Id == id)).GetValueOrDefault();
    }
}
