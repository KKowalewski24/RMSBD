using System;

namespace SchemaTask1Console.Models {

    public class HistoricalProduct : Product {

        /*------------------------ FIELDS REGION ------------------------*/
        /*todo change for price type*/
        public float Price { get; private set; }

        /*TODO CHANGE FOR PROPER TYPE - ONLY DATE*/
        public DateTime TransactionDate { get; private set; }

        /*------------------------ METHODS REGION ------------------------*/
        protected HistoricalProduct() {
        }

        public HistoricalProduct(string name, float amount, float price, DateTime transactionDate)
            : base(name, amount) {
            Price = price;
            TransactionDate = transactionDate;
        }

        public override string ToString() {
            return $"{base.ToString()}, " +
                   $"{nameof(Price)}: {Price}, " +
                   $"{nameof(TransactionDate)}: {TransactionDate}";
        }

    }

}
