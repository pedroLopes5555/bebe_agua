using bebe_agua_backend.Data;
using bebe_agua_backend.Interfaces;
using bebe_agua_backend.Models;
using System.Diagnostics;

namespace bebe_agua_backend.Repository
{
    public class DrinkWatterRepository : IDrinkWatterRepository
    {
        public DataContext _context { get; set; }

        public DrinkWatterRepository(DataContext contex)
        {
            _context = contex;
        }


        public ICollection<Regist> GetRegists()
        {
            return _context.Regists.OrderBy(a => a.Id).ToList();
        }


        public bool saveRegist(Regist regist)
        {
            _context.Regists.Add(regist);
            _context.SaveChanges();
            return true;
        }
    }
}
