using Microsoft.AspNetCore.Mvc;
using Backend.Models;
using Backend.Services;
using Backend.Utilities;

namespace Backend.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class UsersController : ControllerBase
    {
        private readonly UserService _userService;

        public UsersController(UserService userService)
        {
            _userService = userService;
        }

        [HttpPost("register")]
        public IActionResult Register([FromBody] User user)
        {
            _userService.Register(user);
            return Ok(new { message = "User registered successfully" });
        }

        [HttpPost("login")]
        public IActionResult Login([FromBody] User user)
        {
            var loggedInUser = _userService.Login(user.Username, user.Password);
            if (loggedInUser == null)
            {
                return Unauthorized();
            }

            var token = JwtHelper.GenerateToken(loggedInUser.Username, loggedInUser.Role, "your-secret-key");
            return Ok(new { token });
        }
    }
}