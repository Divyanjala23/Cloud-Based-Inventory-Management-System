namespace Backend.Repositories
{
    public class UserRepository
    {
        public List<string> GetUsers()
        {
            return new List<string> { "User1", "User2" };
        }
    }
}
