using System;

namespace SchemaTask1Console {

    public class RandomDateTime {

        /*------------------------ FIELDS REGION ------------------------*/
        private readonly Random _gen = new Random();
        private readonly DateTime _start;
        private readonly int _range;

        /*------------------------ METHODS REGION ------------------------*/
        public RandomDateTime(int yearBegin, int yearEnd) {
            _start = new DateTime(yearBegin, 1, 1);
            _range = (new DateTime(yearEnd, 1, 1) - _start).Days;
        }

        public DateTime Next() {
            return _start
                .AddDays(_gen.Next(_range))
                .AddHours(_gen.Next(0, 24))
                .AddMinutes(_gen.Next(0, 60))
                .AddSeconds(_gen.Next(0, 60));
        }

    }

}
