using bebe_agua_backend.Data;
using bebe_agua_backend.Interfaces;
using bebe_agua_backend.Models;
using bebe_agua_backend_v2._0.Models.JsonContents;
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


        public void saveRegist(SaveRegistJsonContent content)
        {
            if(content == null)
            {
                throw new ArgumentNullException(nameof(content), "json content null");
            }

            if(content.waterDrunk == null)
            {
                throw new ArgumentNullException("water drunk null");
            }


            _context.Regists.Add(new Regist()
            {
                Date = (DateTime)(content.Date != null ? content.Date : DateTime.Now),
                WatterDrunk = content.waterDrunk
            });

            _context.SaveChanges();

        }
    }
}
