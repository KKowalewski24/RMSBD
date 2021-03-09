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

        private static readonly List<Product> _productsGrocery = new List<Product>();
        private static readonly List<Product> _productsSupplier = new List<Product>();

        private static readonly List<BoughtProduct> _boughtProductsSupplier =
            new List<BoughtProduct>();

        private static readonly List<SoldProduct> _soldProductsGrocery = new List<SoldProduct>();
        private static readonly List<Employee> _employeesGrocery = new List<Employee>();
        private static readonly List<Employee> _employeesSupplier = new List<Employee>();
        private static readonly List<Grocery> _groceries = new List<Grocery>();
        private static readonly List<Supplier> _suppliers = new List<Supplier>();

        /*------------------------ METHODS REGION ------------------------*/
        public static void Main(string[] args) {
            _productsGrocery.AddRange(GenerateProducts(60));
            _productsSupplier.AddRange(GenerateProducts(60));
            _boughtProductsSupplier.AddRange(GenerateBoughtProducts(60));
            _soldProductsGrocery.AddRange(GenerateSoldProducts(60));
            _employeesGrocery.AddRange(GenerateEmployees(24));
            _employeesSupplier.AddRange(GenerateEmployees(2));

            _groceries.AddRange(GenerateGrocery(6));
            _suppliers.AddRange(GenerateSupplier(2));

            for (int i = 0; i < _groceries.Count; i++) {
                _groceries[i].AvailableProducts.AddRange(_productsGrocery.GetRange(i * 10, 10));
                _groceries[i].AllSoldProducts.AddRange(_soldProductsGrocery.GetRange(i * 10, 10));
                _groceries[i].Employees.AddRange(_employeesGrocery.GetRange(i * 4, 4));
            }

            for (int i = 0; i < _suppliers.Count; i++) {
                _suppliers[i].Employee = _employeesSupplier.GetRange(i, 1)[0];
                _suppliers[i].Groceries.AddRange(_groceries.GetRange(i * 3, 3));
                _suppliers[i].AvailableProducts
                    .AddRange(_productsSupplier.GetRange(i * 30, 30));
                _suppliers[i].AllBoughtProducts
                    .AddRange(_boughtProductsSupplier.GetRange(i * 30, 30));
            }

            using (ApplicationContext context = new ApplicationContext(DbContextOptions)) {
                PrepareDatabase(context);

                context.Suppliers.AddRange(_suppliers);
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
                (int index, int amount, _, _, _, _, _) = GenerateRandomValues(names.Length);
                yield return new Product(names[index], amount);
            }
        }

        private static IEnumerable<BoughtProduct> GenerateBoughtProducts(int numberOfProducts) {
            string[] names = File.ReadAllLines(ProductNamesPath);

            for (int i = 0; i < numberOfProducts; i++) {
                (int index, int amount, int price, DateTime dateTime, _, _, _) =
                    GenerateRandomValues(names.Length);
                yield return new BoughtProduct(names[index], amount, price, dateTime);
            }
        }

        private static IEnumerable<SoldProduct> GenerateSoldProducts(int numberOfProducts) {
            string[] names = File.ReadAllLines(ProductNamesPath);

            for (int i = 0; i < numberOfProducts; i++) {
                (int index, int amount, int price, DateTime dateTime, _, _, _) =
                    GenerateRandomValues(names.Length);
                yield return new SoldProduct(names[index], amount, price, dateTime);
            }
        }

        private static IEnumerable<Employee> GenerateEmployees(int numberOfEmployees) {
            string[] firstNames = File.ReadAllLines(FirstNamesPath);
            string[] LastNames = File.ReadAllLines(LastNamesPath);

            for (int i = 0; i < numberOfEmployees; i++) {
                (int index, _, _, _, int salary, DateTime dateTimeEmployee, _) =
                    GenerateRandomValues(firstNames.Length);
                yield return new Employee(
                    firstNames[index], LastNames[index], salary, dateTimeEmployee
                );
            }
        }

        private static IEnumerable<Grocery> GenerateGrocery(int numberOfGroceries) {
            string[] addresses = File.ReadAllLines(AddressesPath);

            for (int i = 0; i < numberOfGroceries; i++) {
                (int index, _, _, _, _, _, _) = GenerateRandomValues(addresses.Length);
                yield return new Grocery(addresses[index]);
            }
        }

        private static IEnumerable<Supplier> GenerateSupplier(int numberOfSupplier) {
            for (int i = 0; i < numberOfSupplier; i++) {
                (_, _, _, _, _, _, int grossVehicleWeight) = GenerateRandomValues();
                yield return new Supplier($"Supplier{i + 1}", grossVehicleWeight);
            }
        }

        private static (int, int, int, DateTime, int, DateTime, int)
            GenerateRandomValues(int arrayLength = 0) {
            int index = _random.Next(0, arrayLength);
            int amount = _random.Next(1, 25);
            int price = _random.Next(1, 20);
            DateTime dateTimeProduct = new RandomDateTime(2019, 2021).Next();
            DateTime dateTimeEmployee = new RandomDateTime(2010, 2021).Next();
            int salary = _random.Next(1000, 8000);
            int grossVehicleWeight = _random.Next(300, 1500);

            return (index, amount, price, dateTimeProduct, salary, dateTimeEmployee,
                    grossVehicleWeight);
        }

    }

}
