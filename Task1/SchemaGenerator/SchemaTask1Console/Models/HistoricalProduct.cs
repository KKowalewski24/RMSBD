using System;

namespace SchemaTask1Console.Models {

    public class HistoricalProduct : Product {

        /*------------------------ FIELDS REGION ------------------------*/
        public decimal Price { get; private set; }
        public DateTime TransactionDate { get; private set; }

        /*------------------------ METHODS REGION ------------------------*/
        protected HistoricalProduct() {
        }

        public HistoricalProduct(string name, float amount, decimal price, DateTime transactionDate)
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
