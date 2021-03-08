using Microsoft.EntityFrameworkCore;
using SchemaTask1Console.EF;

namespace SchemaTask1Console {

    public class Program {

        /*------------------------ FIELDS REGION ------------------------*/
        /*TODO CHANGE FOR PROPER NAME*/
        private const string DbName = "Task1DB";

        private static readonly DbContextOptions<ApplicationContext> DbContextOptions =
            new DbContextOptionsBuilder<ApplicationContext>()
                .UseMySql($"server=localhost;database={DbName};user=root;password=admin")
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
