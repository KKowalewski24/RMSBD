using Microsoft.EntityFrameworkCore;
using SchemaTask1Console.EF;

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
            using (ApplicationContext context = new ApplicationContext(DbContextOptions)) {
                PrepareDatabase(context);
            }
        }

        private static void PrepareDatabase(DbContext context) {
            context.Database.EnsureDeleted();
            context.Database.EnsureCreated();
        }

    }

}
