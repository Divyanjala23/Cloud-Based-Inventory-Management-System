namespace Backend.DTOs
{
    public class OrderDTO
    {
        public int ProductId { get; set; }
        public int Quantity { get; set; }
        public string Status { get; set; }
    }
}