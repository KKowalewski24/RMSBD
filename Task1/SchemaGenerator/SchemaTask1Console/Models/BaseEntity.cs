using System.ComponentModel.DataAnnotations;

namespace SchemaTask1Console.Models {

    public abstract class BaseEntity {

        /*------------------------ FIELDS REGION ------------------------*/
        [Key]
        public int Id { get; private set; }

        /*------------------------ METHODS REGION ------------------------*/
        protected BaseEntity() {
        }

        public override string ToString() {
            return $"{nameof(Id)}: {Id}";
        }

    }

}
