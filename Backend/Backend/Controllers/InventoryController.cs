using Microsoft.AspNetCore.Mvc;

namespace Backend.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class InventoryController : ControllerBase
    {
        [HttpGet]
        public IActionResult GetInventory()
        {
            return Ok(new string[] { "Inventory1", "Inventory2" });
        }
    }
}
