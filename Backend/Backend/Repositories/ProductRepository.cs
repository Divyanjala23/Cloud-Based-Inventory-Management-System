namespace Backend.Repositories
{
    public class ProductRepository
    {
        public List<string> GetProducts()
        {
            return new List<string> { "Product1", "Product2" };
        }
    }
}
