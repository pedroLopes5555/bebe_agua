using System.ComponentModel.DataAnnotations;

namespace bebe_agua_backend.Models
{
    public class Regist
    {
       
        public Regist() { }
        [Key]
        public int Id { get; set; }
        public float WatterDrunk { get; set; }
        public DateTime Date { get; set; }
    }
}
