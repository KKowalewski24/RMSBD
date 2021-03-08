using System.Collections.Generic;

namespace SchemaTask1Console.Models {

    public class Supplier : BaseEntity {

        /*------------------------ FIELDS REGION ------------------------*/
        public string Name { get; private set; }
        public Employee Employee { get; private set; }
        public float GrossVehicleWeight { get; private set; }
        public IEnumerable<Product> AvailableProducts { get; private set; }
        public IEnumerable<Product> AllBoughtProducts { get; private set; }
        public IEnumerable<Grocery> Groceries { get; private set; }

        /*------------------------ METHODS REGION ------------------------*/
        protected Supplier() {
        }

        public Supplier(string name, Employee employee, float grossVehicleWeight,
                        IEnumerable<Product> availableProducts,
                        IEnumerable<Product> allBoughtProducts, IEnumerable<Grocery> groceries) {
            Name = name;
            Employee = employee;
            GrossVehicleWeight = grossVehicleWeight;
            AvailableProducts = availableProducts;
            AllBoughtProducts = allBoughtProducts;
            Groceries = groceries;
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
