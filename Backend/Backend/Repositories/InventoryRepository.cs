namespace Backend.Repositories
{
    public class InventoryRepository
    {
        public List<string> GetInventory()
        {
            return new List<string> { "Inventory1", "Inventory2" };
        }
    }
}
