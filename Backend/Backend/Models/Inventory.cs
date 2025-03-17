namespace Backend.Models
{
    public class Inventory
    {
        public int Id { get; set; }
        public int ProductId { get; set; }
        public Product Product { get; set; } // Navigation property
        public int Quantity { get; set; }
    }
}