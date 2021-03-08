using Microsoft.EntityFrameworkCore;
using SchemaTask1Console.Models;

namespace SchemaTask1Console.EF {

    public class ApplicationContext : DbContext {

        /*------------------------ FIELDS REGION ------------------------*/
        public DbSet<Employee> Employees { get; private set; }
        public DbSet<Grocery> Groceries { get; private set; }
        public DbSet<Product> Products { get; private set; }
        public DbSet<HistoricalProduct> HistoricalProducts { get; private set; }
        public DbSet<Supplier> Suppliers { get; private set; }

        /*------------------------ METHODS REGION ------------------------*/
        public ApplicationContext(DbContextOptions<ApplicationContext> options)
            : base(options) {
        }

    }

}
