using Microsoft.AspNetCore.Mvc;
using Backend.Models;
using Backend.Services;

namespace Backend.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class InventoryController : ControllerBase
    {
        private readonly InventoryService _inventoryService;

        public InventoryController(InventoryService inventoryService)
        {
            _inventoryService = inventoryService;
        }

        [HttpGet]
        public IActionResult GetInventory()
        {
            var inventory = _inventoryService.GetInventory();
            return Ok(inventory);
        }

        [HttpPut("{productId}")]
        public IActionResult UpdateInventory(int productId, [FromBody] int quantity)
        {
            _inventoryService.UpdateInventory(productId, quantity);
            return NoContent();
        }
    }
}