using Backend.Models;
using Backend.Data;
using System.Collections.Generic;
using System.Linq;

namespace Backend.Repositories
{
    public class InventoryRepository
    {
        private readonly AppDbContext _context;

        public InventoryRepository(AppDbContext context)
        {
            _context = context;
        }

        public List<Inventory> GetInventory()
        {
            return _context.Inventories.ToList();
        }

        public void UpdateInventory(int productId, int quantity)
        {
            var inventory = _context.Inventories.FirstOrDefault(i => i.ProductId == productId);
            if (inventory != null)
            {
                inventory.Quantity = quantity;
                _context.SaveChanges();
            }
        }
    }
}