using Backend.Models;
using Backend.Repositories;

namespace Backend.Services
{
    public class OrderService
    {
        private readonly OrderRepository _orderRepository;

        public OrderService(OrderRepository orderRepository)
        {
            _orderRepository = orderRepository;
        }

        public List<Order> GetOrders()
        {
            return _orderRepository.GetOrders();
        }

        public void PlaceOrder(Order order)
        {
            _orderRepository.PlaceOrder(order);
        }

        public void UpdateOrderStatus(int id, string status)
        {
            _orderRepository.UpdateOrderStatus(id, status);
        }
    }
}