using System;
using System.Collections.Generic;
using System.IO;
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

        private static readonly Random _random = new Random();

        private static readonly DbContextOptions<ApplicationContext> DbContextOptions =
            new DbContextOptionsBuilder<ApplicationContext>()
                .UseNpgsql($"Host=localhost;Database={DbName};Username=postgres;Password=admin")
                .Options;

        private static readonly List<Product> _products = new List<Product>();
        private static readonly List<BoughtProduct> _boughtProducts = new List<BoughtProduct>();
        private static readonly List<SoldProduct> _soldProducts = new List<SoldProduct>();
        private static readonly List<Employee> _employees = new List<Employee>();
        private static readonly List<Supplier> _suppliers = new List<Supplier>();
        private static readonly List<Grocery> _groceries = new List<Grocery>();

        /*------------------------ METHODS REGION ------------------------*/
        public static void Main(string[] args) {
            _products.AddRange(GenerateProducts(50));
            _boughtProducts.AddRange(GenerateBoughtProducts(50));
            _soldProducts.AddRange(GenerateSoldProducts(50));
            _employees.AddRange(GenerateEmployees(20));
            
            using (ApplicationContext context = new ApplicationContext(DbContextOptions)) {
                PrepareDatabase(context);

                context.Groceries.AddRange(_groceries);
                context.SaveChanges();
            }
        }

        private static void PrepareDatabase(DbContext context) {
            context.Database.EnsureDeleted();
            context.Database.EnsureCreated();
        }

        private static IEnumerable<Product> GenerateProducts(int numberOfProducts) {
            string[] names = File.ReadAllLines(ProductNamesPath);

            for (int i = 0; i < numberOfProducts; i++) {
                (int index, int amount, _, _, _, _) = GenerateRandomValues(names.Length);
                yield return new Product(names[index], amount);
            }
        }

        private static IEnumerable<BoughtProduct> GenerateBoughtProducts(int numberOfProducts) {
            string[] names = File.ReadAllLines(ProductNamesPath);

            for (int i = 0; i < numberOfProducts; i++) {
                (int index, int amount, int price, DateTime dateTime, _, _) =
                    GenerateRandomValues(names.Length);
                yield return new BoughtProduct(names[index], amount, price, dateTime);
            }
        }

        private static IEnumerable<SoldProduct> GenerateSoldProducts(int numberOfProducts) {
            string[] names = File.ReadAllLines(ProductNamesPath);

            for (int i = 0; i < numberOfProducts; i++) {
                (int index, int amount, int price, DateTime dateTime, _, _) =
                    GenerateRandomValues(names.Length);
                yield return new SoldProduct(names[index], amount, price, dateTime);
            }
        }

        private static IEnumerable<Employee> GenerateEmployees(int numberOfEmployees) {
            string[] firstNames = File.ReadAllLines(FirstNamesPath);
            string[] LastNames = File.ReadAllLines(LastNamesPath);

            for (int i = 0; i < numberOfEmployees; i++) {
                (int index, _, _, _, int salary, DateTime dateTimeEmployee) =
                    GenerateRandomValues(firstNames.Length);
                yield return new Employee(
                    firstNames[index], LastNames[index], salary, dateTimeEmployee
                );
            }
        }

        private static (int, int, int, DateTime, int, DateTime) GenerateRandomValues(
            int arrayLength) {
            int index = _random.Next(0, arrayLength);
            int amount = _random.Next(1, 25);
            int price = _random.Next(1, 20);
            DateTime dateTimeProduct = new RandomDateTime(2019, 2021).Next();
            DateTime dateTimeEmployee = new RandomDateTime(2010, 2021).Next();
            int salary = _random.Next(1000, 8000);

            return (index, amount, price, dateTimeProduct, salary, dateTimeEmployee);
        }

    }

}
