using System;
using System.Collections.Generic;
using bebe_agua_backend.Data;
using bebe_agua_backend.Models;

namespace bebe_agua_backend
{
    public class Seed
    {
        private readonly DataContext _context;

        public Seed()
        {
        }

        public Seed(DataContext context)
        {
            _context = context;
        }

        public void GenerateTestData()
        {
            using (var context = new DataContext())
            {

                Random random = new Random();

                // Generate 20 test data entries
                for (int i = 0; i < 5; i++)
                {
                    // Generate a random water amount between 0 and 100
                    float waterAmount = (float)random.NextDouble() * 100;

                    // Generate a random date within the last month
                    DateTime date = DateTime.Now.AddDays(-random.Next(1, 30));

                    // Create a new Regist object with the generated data
                    Regist entry = new Regist
                    {
                        WatterDrunk = waterAmount,
                        Date = date
                    };

                    // Add the entry to the Regists DbSet
                    context.Regists.Add(entry);
                }

                // Save changes to the database
                context.SaveChanges();
            }
        }

    }
}
