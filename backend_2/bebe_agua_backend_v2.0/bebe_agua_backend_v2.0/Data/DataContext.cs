using Microsoft.EntityFrameworkCore;
using System.Security.Principal;
using bebe_agua_backend.Models;

namespace bebe_agua_backend.Data
{
    public class DataContext : DbContext
    {
        public DataContext()
        {
            //Database.EnsureDeleted();
            Database.EnsureCreated();
        }


        public DbSet<Regist> Regists { get; set; }


        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {

            optionsBuilder.EnableSensitiveDataLogging();
            object value = optionsBuilder.UseSqlServer("Server=localhost,1433;Database=drinkWatter;User=sa;Password=l1n0x3Me#da;TrustServerCertificate=True;");

        }
    }
}

