using Backend.Models;
using Backend.Repositories;

namespace Backend.Services
{
    public class UserService
    {
        private readonly UserRepository _userRepository;

        public UserService(UserRepository userRepository)
        {
            _userRepository = userRepository;
        }

        public void Register(User user)
        {
            _userRepository.Register(user);
        }

        public User Login(string username, string password)
        {
            return _userRepository.Login(username, password);
        }
    }
}