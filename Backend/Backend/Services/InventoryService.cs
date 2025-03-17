using Backend.Models;
using Backend.Repositories;

namespace Backend.Services
{
    public class InventoryService
    {
        private readonly InventoryRepository _inventoryRepository;

        public InventoryService(InventoryRepository inventoryRepository)
        {
            _inventoryRepository = inventoryRepository;
        }

        public List<Inventory> GetInventory()
        {
            return _inventoryRepository.GetInventory();
        }

        public void UpdateInventory(int productId, int quantity)
        {
            _inventoryRepository.UpdateInventory(productId, quantity);
        }
    }
}