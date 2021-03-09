using System.Collections.Generic;

namespace SchemaTask1Console.Models {

    public class Supplier : BaseEntity {

        /*------------------------ FIELDS REGION ------------------------*/
        public string Name { get; private set; }
        public float GrossVehicleWeight { get; private set; }

        public Employee Employee { get; set; }
        public List<Grocery> Groceries { get; private set; } = new List<Grocery>();
        public List<Product> AvailableProducts { get; private set; } = new List<Product>();

        public List<BoughtProduct> AllBoughtProducts { get; private set; } =
            new List<BoughtProduct>();

        /*------------------------ METHODS REGION ------------------------*/
        protected Supplier() {
        }

        public Supplier(string name, float grossVehicleWeight) {
            Name = name;
            GrossVehicleWeight = grossVehicleWeight;
        }

        public override string ToString() {
            return $"{base.ToString()}, " +
                   $"{nameof(Name)}: {Name}, " +
                   $"{nameof(Employee)}: {Employee}, " +
                   $"{nameof(GrossVehicleWeight)}: {GrossVehicleWeight}, " +
                   $"{nameof(AvailableProducts)}: {AvailableProducts}, " +
                   $"{nameof(AllBoughtProducts)}: {AllBoughtProducts}, " +
                   $"{nameof(Groceries)}: {Groceries}";
        }

    }

}
