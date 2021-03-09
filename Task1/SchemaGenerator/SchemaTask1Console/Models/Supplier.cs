using System.Collections.Generic;

namespace SchemaTask1Console.Models {

    public class Supplier : BaseEntity {

        /*------------------------ FIELDS REGION ------------------------*/
        public string Name { get; private set; }
        public float GrossVehicleWeight { get; private set; }
        public Employee Employee { get; private set; }
        public List<Grocery> Groceries { get; private set; }
        public List<Product> AvailableProducts { get; private set; }
        public List<BoughtProduct> AllBoughtProducts { get; private set; }

        /*------------------------ METHODS REGION ------------------------*/
        protected Supplier() {
        }

        public Supplier(string name, float grossVehicleWeight) {
            Name = name;
            GrossVehicleWeight = grossVehicleWeight;
        }

        public Supplier(string name, float grossVehicleWeight, List<Grocery> groceries,
                        List<Product> availableProducts, List<BoughtProduct> allBoughtProducts) {
            Name = name;
            GrossVehicleWeight = grossVehicleWeight;
            Groceries = groceries;
            AvailableProducts = availableProducts;
            AllBoughtProducts = allBoughtProducts;
        }

        public Supplier(string name, float grossVehicleWeight, Employee employee) {
            Name = name;
            GrossVehicleWeight = grossVehicleWeight;
            Employee = employee;
        }

        public Supplier(string name, float grossVehicleWeight, Employee employee,
                        List<Grocery> groceries, List<Product> availableProducts,
                        List<BoughtProduct> allBoughtProducts) {
            Name = name;
            GrossVehicleWeight = grossVehicleWeight;
            Employee = employee;
            Groceries = groceries;
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
