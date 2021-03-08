namespace SchemaTask1Console.Models {

    public class Product : BaseEntity {

        /*------------------------ FIELDS REGION ------------------------*/
        public string Name { get; private set; }
        public float Amount { get; private set; }

        /*------------------------ METHODS REGION ------------------------*/
        protected Product() {
        }

        public Product(string name, float amount) {
            Name = name;
            Amount = amount;
        }

        public override string ToString() {
            return $"{base.ToString()}, " +
                   $"{nameof(Name)}: {Name}, " +
                   $"{nameof(Amount)}: {Amount}";
        }

    }

}
