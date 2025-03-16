# Define the project name and root folder
$projectName = "Backend"
$rootFolder = "$PSScriptRoot\$projectName"

# Create the root folder
New-Item -ItemType Directory -Path $rootFolder
Set-Location -Path $rootFolder

# Create a new .NET Web API project
dotnet new webapi -n $projectName

# Navigate to the project folder
Set-Location -Path "$rootFolder\$projectName"

# Create folders
$folders = @("Controllers", "Models", "Services", "Data", "Repositories", "DTOs", "Utilities")
foreach ($folder in $folders) {
    New-Item -ItemType Directory -Path $folder
}

# Create placeholder files
# Controllers
@"
using Microsoft.AspNetCore.Mvc;

namespace $projectName.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ProductsController : ControllerBase
    {
        [HttpGet]
        public IActionResult GetProducts()
        {
            return Ok(new string[] { "Product1", "Product2" });
        }
    }
}
"@ | Out-File -FilePath "Controllers\ProductsController.cs"

@"
using Microsoft.AspNetCore.Mvc;

namespace $projectName.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class InventoryController : ControllerBase
    {
        [HttpGet]
        public IActionResult GetInventory()
        {
            return Ok(new string[] { "Inventory1", "Inventory2" });
        }
    }
}
"@ | Out-File -FilePath "Controllers\InventoryController.cs"

@"
using Microsoft.AspNetCore.Mvc;

namespace $projectName.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class OrdersController : ControllerBase
    {
        [HttpGet]
        public IActionResult GetOrders()
        {
            return Ok(new string[] { "Order1", "Order2" });
        }
    }
}
"@ | Out-File -FilePath "Controllers\OrdersController.cs"

@"
using Microsoft.AspNetCore.Mvc;

namespace $projectName.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class UsersController : ControllerBase
    {
        [HttpGet]
        public IActionResult GetUsers()
        {
            return Ok(new string[] { "User1", "User2" });
        }
    }
}
"@ | Out-File -FilePath "Controllers\UsersController.cs"

# Models
@"
namespace $projectName.Models
{
    public class Product
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
        public int Quantity { get; set; }
    }
}
"@ | Out-File -FilePath "Models\Product.cs"

@"
namespace $projectName.Models
{
    public class Inventory
    {
        public int Id { get; set; }
        public int ProductId { get; set; }
        public int Quantity { get; set; }
    }
}
"@ | Out-File -FilePath "Models\Inventory.cs"

@"
namespace $projectName.Models
{
    public class Order
    {
        public int Id { get; set; }
        public int ProductId { get; set; }
        public int Quantity { get; set; }
        public DateTime OrderDate { get; set; }
    }
}
"@ | Out-File -FilePath "Models\Order.cs"

@"
namespace $projectName.Models
{
    public class User
    {
        public int Id { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Role { get; set; }
    }
}
"@ | Out-File -FilePath "Models\User.cs"

# Services
@"
namespace $projectName.Services
{
    public class ProductService
    {
        public List<string> GetProducts()
        {
            return new List<string> { "Product1", "Product2" };
        }
    }
}
"@ | Out-File -FilePath "Services\ProductService.cs"

@"
namespace $projectName.Services
{
    public class InventoryService
    {
        public List<string> GetInventory()
        {
            return new List<string> { "Inventory1", "Inventory2" };
        }
    }
}
"@ | Out-File -FilePath "Services\InventoryService.cs"

@"
namespace $projectName.Services
{
    public class OrderService
    {
        public List<string> GetOrders()
        {
            return new List<string> { "Order1", "Order2" };
        }
    }
}
"@ | Out-File -FilePath "Services\OrderService.cs"

@"
namespace $projectName.Services
{
    public class UserService
    {
        public List<string> GetUsers()
        {
            return new List<string> { "User1", "User2" };
        }
    }
}
"@ | Out-File -FilePath "Services\UserService.cs"

# Data (DbContext)
@"
using Microsoft.EntityFrameworkCore;
using $projectName.Models;

namespace $projectName.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

        public DbSet<Product> Products { get; set; }
        public DbSet<Inventory> Inventories { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<User> Users { get; set; }
    }
}
"@ | Out-File -FilePath "Data\AppDbContext.cs"

# Repositories
@"
namespace $projectName.Repositories
{
    public class ProductRepository
    {
        public List<string> GetProducts()
        {
            return new List<string> { "Product1", "Product2" };
        }
    }
}
"@ | Out-File -FilePath "Repositories\ProductRepository.cs"

@"
namespace $projectName.Repositories
{
    public class InventoryRepository
    {
        public List<string> GetInventory()
        {
            return new List<string> { "Inventory1", "Inventory2" };
        }
    }
}
"@ | Out-File -FilePath "Repositories\InventoryRepository.cs"

@"
namespace $projectName.Repositories
{
    public class OrderRepository
    {
        public List<string> GetOrders()
        {
            return new List<string> { "Order1", "Order2" };
        }
    }
}
"@ | Out-File -FilePath "Repositories\OrderRepository.cs"

@"
namespace $projectName.Repositories
{
    public class UserRepository
    {
        public List<string> GetUsers()
        {
            return new List<string> { "User1", "User2" };
        }
    }
}
"@ | Out-File -FilePath "Repositories\UserRepository.cs"

# DTOs
@"
namespace $projectName.DTOs
{
    public class ProductDTO
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
    }
}
"@ | Out-File -FilePath "DTOs\ProductDTO.cs"

@"
namespace $projectName.DTOs
{
    public class InventoryDTO
    {
        public int ProductId { get; set; }
        public int Quantity { get; set; }
    }
}
"@ | Out-File -FilePath "DTOs\InventoryDTO.cs"

@"
namespace $projectName.DTOs
{
    public class OrderDTO
    {
        public int ProductId { get; set; }
        public int Quantity { get; set; }
    }
}
"@ | Out-File -FilePath "DTOs\OrderDTO.cs"

@"
namespace $projectName.DTOs
{
    public class UserDTO
    {
        public string Username { get; set; }
        public string Password { get; set; }
    }
}
"@ | Out-File -FilePath "DTOs\UserDTO.cs"

# Utilities
@"
namespace $projectName.Utilities
{
    public static class JwtHelper
    {
        public static string GenerateToken()
        {
            return "SampleJwtToken";
        }
    }
}
"@ | Out-File -FilePath "Utilities\JwtHelper.cs"

@"
namespace $projectName.Utilities
{
    public static class ExceptionHandler
    {
        public static void HandleException(Exception ex)
        {
            // Handle exception
        }
    }
}
"@ | Out-File -FilePath "Utilities\ExceptionHandler.cs"

# Add Entity Framework Core
dotnet add package Microsoft.EntityFrameworkCore
dotnet add package Microsoft.EntityFrameworkCore.SqlServer
dotnet add package Microsoft.EntityFrameworkCore.Design

# Run the project
dotnet run