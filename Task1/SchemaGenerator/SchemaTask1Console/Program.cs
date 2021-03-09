using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using SchemaTask1Console.EF;
using SchemaTask1Console.Models;

namespace SchemaTask1Console {

    public class Program {

        /*------------------------ FIELDS REGION ------------------------*/
        private const string DbName = "GroceryShopsDB";
        public const string AddressesPath = "./Data/Addresses.txt";
        public const string FirstNamesPath = "./Data/FirstNames.txt";
        public const string LastNamesPath = "./Data/LastNames.txt";
        public const string ProductNamesPath = "./Data/ProductNames.txt";

        private static readonly Random Random = new Random();

        private static readonly DbContextOptions<ApplicationContext> DbContextOptions =
            new DbContextOptionsBuilder<ApplicationContext>()
                .UseNpgsql($"Host=localhost;Database={DbName};Username=postgres;Password=admin")
                .Options;

        /*------------------------ METHODS REGION ------------------------*/
        public static void Main(string[] args) {
            List<Product> products = GenerateProducts(100).ToList();
            
            // using (ApplicationContext context = new ApplicationContext(DbContextOptions)) {
            // PrepareDatabase(context);

            // context.SaveChanges();
            // }
        }

        private static void PrepareDatabase(DbContext context) {
            context.Database.EnsureDeleted();
            context.Database.EnsureCreated();
        }

        private static IEnumerable<Product> GenerateProducts(int numberOfProducts) {
            string[] lines = File.ReadAllLines(ProductNamesPath);

            for (int i = 0; i < numberOfProducts; i++) {
                int randomValue = Random.Next(0, lines.Length);
                yield return new Product(lines[randomValue], randomValue);
            }
        }

    }

}
