﻿using System;

namespace SchemaTask1Console.Models {

    public class SoldProduct : BaseEntity {

        /*------------------------ FIELDS REGION ------------------------*/
        public string Name { get; private set; }
        public float Amount { get; private set; }
        public decimal Price { get; private set; }
        public DateTime TransactionDate { get; private set; }
        public Employee Employee { get; set; }
        public Grocery Grocery { get; set; }

        /*------------------------ METHODS REGION ------------------------*/
        protected SoldProduct() {
        }

        public SoldProduct(string name, float amount, decimal price,
                           DateTime transactionDate) {
            Name = name;
            Amount = amount;
            Price = price;
            TransactionDate = transactionDate;
        }

        public SoldProduct(string name, float amount, decimal price, DateTime transactionDate,
                           Employee employee, Grocery grocery) {
            Name = name;
            Amount = amount;
            Price = price;
            TransactionDate = transactionDate;
            Employee = employee;
            Grocery = grocery;
        }

        public override string ToString() {
            return $"{base.ToString()}, " +
                   $"{nameof(Name)}: {Name}, " +
                   $"{nameof(Amount)}: {Amount}, " +
                   $"{nameof(Price)}: {Price}, " +
                   $"{nameof(TransactionDate)}: {TransactionDate}";
        }

    }

}