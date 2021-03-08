using Microsoft.EntityFrameworkCore;

namespace SchemaTask1Console.EF {

    public class ApplicationContext : DbContext {

        /*------------------------ FIELDS REGION ------------------------*/
        /*TODO ADD DbSets*/

        /*------------------------ METHODS REGION ------------------------*/
        public ApplicationContext(DbContextOptions<ApplicationContext> options)
            : base(options) {
        }

    }

}
