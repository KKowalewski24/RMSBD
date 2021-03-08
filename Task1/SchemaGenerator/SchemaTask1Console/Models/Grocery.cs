using System.Collections.Generic;

namespace SchemaTask1Console.Models {

    public class Grocery : BaseEntity {

        /*------------------------ FIELDS REGION ------------------------*/
        public string Address { get; private set; }
        public IEnumerable<Product> AvailableProducts { get; private set; }
        public IEnumerable<HistoricalProduct> AllSoldProducts { get; private set; }
        public IEnumerable<Supplier> Suppliers { get; private set; } = new List<Supplier>();

        /*------------------------ METHODS REGION ------------------------*/
        protected Grocery() {
        }

        public Grocery(string address) {
            Address = address;
        }

        public Grocery(string address, IEnumerable<Product> availableProducts,
                       IEnumerable<HistoricalProduct> allSoldProducts) {
            Address = address;
            AvailableProducts = availableProducts;
            AllSoldProducts = allSoldProducts;
        }

        public override string ToString() {
            return $"{base.ToString()}, " +
                   $"{nameof(Address)}: {Address}, " +
                   $"{nameof(AvailableProducts)}: {AvailableProducts}, " +
                   $"{nameof(AllSoldProducts)}: {AllSoldProducts}, " +
                   $"{nameof(Suppliers)}: {Suppliers}";
        }

    }

}
