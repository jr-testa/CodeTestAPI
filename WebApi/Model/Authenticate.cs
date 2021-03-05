using System.ComponentModel.DataAnnotations;

namespace WebApi.Model
{
    public class Authenticate
    {
        [Required]
        public string Username { get; set; }

        [Required]
        public string Password { get; set; }
    }
}
