using Microsoft.AspNetCore.Mvc;
using Backend.Models;
using Backend.Services;

namespace Backend.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class OrdersController : ControllerBase
    {
        private readonly OrderService _orderService;

        public OrdersController(OrderService orderService)
        {
            _orderService = orderService;
        }

        [HttpGet]
        public IActionResult GetOrders()
        {
            var orders = _orderService.GetOrders();
            return Ok(orders);
        }

        [HttpPost]
        public IActionResult PlaceOrder([FromBody] Order order)
        {
            _orderService.PlaceOrder(order);
            return CreatedAtAction(nameof(GetOrders), new { id = order.Id }, order);
        }

        [HttpPut("{id}")]
        public IActionResult UpdateOrderStatus(int id, [FromBody] string status)
        {
            _orderService.UpdateOrderStatus(id, status);
            return NoContent();
        }
    }
}