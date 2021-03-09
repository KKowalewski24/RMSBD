using System;

namespace SchemaTask1Console.Models {

    public class Employee : BaseEntity {

        /*------------------------ FIELDS REGION ------------------------*/
        public string FirstName { get; private set; }
        public string LastName { get; private set; }
        public decimal Salary { get; private set; }
        public DateTime EmploymentDate { get; private set; }

        /*------------------------ METHODS REGION ------------------------*/
        protected Employee() {
        }

        public Employee(string firstName, string lastName,
                        decimal salary, DateTime employmentDate) {
            FirstName = firstName;
            LastName = lastName;
            Salary = salary;
            EmploymentDate = employmentDate;
        }

        public override string ToString() {
            return $"{base.ToString()}, " +
                   $"{nameof(FirstName)}: {FirstName}, " +
                   $"{nameof(LastName)}: {LastName}, " +
                   $"{nameof(Salary)}: {Salary} " +
                   $"{nameof(EmploymentDate)}: {EmploymentDate}";
        }

    }

}
