namespace Backend.Repositories
{
    public class OrderRepository
    {
        public List<string> GetOrders()
        {
            return new List<string> { "Order1", "Order2" };
        }
    }
}
