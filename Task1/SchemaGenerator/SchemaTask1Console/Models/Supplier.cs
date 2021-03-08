using System.Collections.Generic;

namespace SchemaTask1Console.Models {

    public class Supplier : BaseEntity {

        /*------------------------ FIELDS REGION ------------------------*/
        public string Name { get; private set; }
        public float GrossVehicleWeight { get; private set; }
        public Employee Employee { get; private set; }
        public IEnumerable<Product> AvailableProducts { get; private set; }
        public IEnumerable<HistoricalProduct> AllBoughtProducts { get; private set; }
        public IEnumerable<Grocery> Groceries { get; private set; } = new List<Grocery>();

        /*------------------------ METHODS REGION ------------------------*/
        protected Supplier() {
        }

        public Supplier(string name, float grossVehicleWeight) {
            Name = name;
            GrossVehicleWeight = grossVehicleWeight;
        }

        public Supplier(string name, float grossVehicleWeight, Employee employee,
                        IEnumerable<Product> availableProducts,
                        IEnumerable<HistoricalProduct> allBoughtProducts) {
            Name = name;
            GrossVehicleWeight = grossVehicleWeight;
            Employee = employee;
            AvailableProducts = availableProducts;
            AllBoughtProducts = allBoughtProducts;
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
