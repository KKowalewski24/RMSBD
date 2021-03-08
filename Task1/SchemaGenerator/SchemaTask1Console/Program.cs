using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using SchemaTask1Console.EF;
using SchemaTask1Console.Models;

namespace SchemaTask1Console {

    public class Program {

        /*------------------------ FIELDS REGION ------------------------*/
        private const string DbName = "GroceryShopsDB";

        private static readonly DbContextOptions<ApplicationContext> DbContextOptions =
            new DbContextOptionsBuilder<ApplicationContext>()
                .UseNpgsql($"Host=localhost;Database={DbName};Username=postgres;Password=admin")
                .Options;

        /*------------------------ METHODS REGION ------------------------*/
        public static void Main(string[] args) {
            Product product1 = new Product("Carrot", 20);
            Product product2 = new Product("Apple", 10);
            Product product3 = new Product("Strawberry", 5);

            HistoricalProduct historicalProduct1 =
                new HistoricalProduct("Carrot", 20, 2, DateTime.Now);
            HistoricalProduct historicalProduct2 =
                new HistoricalProduct("Apple", 10, 5, DateTime.Now);
            HistoricalProduct historicalProduct3 =
                new HistoricalProduct("Strawberry", 5, 10, DateTime.Now);

            Employee employee1 = new Employee("Kamil", "Kowalewski", 2000M);
            Employee employee2 = new Employee("Jan", "Karwowski", 5000M);

            Supplier supplier1 = new Supplier(
                "First Supplier", 1000, employee1,
                new List<Product> { product1, product2, product3 },
                new List<HistoricalProduct> {
                    historicalProduct1, historicalProduct2, historicalProduct3
                }
            );

            Supplier supplier2 = new Supplier(
                "Second Supplier", 1500, employee2,
                new List<Product> { product1, product2, product3 },
                new List<HistoricalProduct> {
                    historicalProduct1, historicalProduct2, historicalProduct3
                }
            );

            Grocery grocery1 = new Grocery(
                "Wolczanska 215",
                new List<Product> { product1, product2, product3 },
                new List<HistoricalProduct> {
                    historicalProduct1, historicalProduct2, historicalProduct3
                }
            );

            Grocery grocery2 = new Grocery(
                "Piotrkowska 69",
                new List<Product> { product1, product2, product3 },
                new List<HistoricalProduct> {
                    historicalProduct1, historicalProduct2, historicalProduct3
                }
            );

            grocery1.Supplier = supplier1;
            grocery2.Supplier = supplier2;

            using (ApplicationContext context = new ApplicationContext(DbContextOptions)) {
                PrepareDatabase(context);

                context.Groceries.AddRange(new List<Grocery> {
                    grocery1, grocery2
                });

                context.SaveChanges();
            }
        }

        private static void PrepareDatabase(DbContext context) {
            context.Database.EnsureDeleted();
            context.Database.EnsureCreated();
        }

    }

}
