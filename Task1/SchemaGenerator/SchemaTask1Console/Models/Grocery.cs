using System.Collections.Generic;

namespace SchemaTask1Console.Models {

    public class Grocery : BaseEntity {

        /*------------------------ FIELDS REGION ------------------------*/
        public string Address { get; private set; }
        public IEnumerable<Product> AvailableProducts { get; private set; } = new List<Product>();

        public IEnumerable<SoldProduct> AllSoldProducts { get; private set; } =
            new List<SoldProduct>();

        public IEnumerable<Employee> Employees { get; private set; } = new List<Employee>();
        public Supplier Supplier { get; set; }

        /*------------------------ METHODS REGION ------------------------*/
        protected Grocery() {
        }

        public Grocery(string address) {
            Address = address;
        }

        public Grocery(string address, Supplier supplier) {
            Address = address;
            Supplier = supplier;
        }

        public override string ToString() {
            return $"{base.ToString()}, " +
                   $"{nameof(Address)}: {Address}, " +
                   $"{nameof(AvailableProducts)}: {AvailableProducts}, " +
                   $"{nameof(AllSoldProducts)}: {AllSoldProducts}, " +
                   $"{nameof(Supplier)}: {Supplier}, " +
                   $"{nameof(Employees)}: {Employees}";
        }

    }

}
