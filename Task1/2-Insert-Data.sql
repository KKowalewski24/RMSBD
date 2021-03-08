INSERT INTO public.Employees (Id, FirstName, LastName, Salary)
VALUES (1, 'Kamil', 'Kowalewski', 2000);
INSERT INTO public.Employees (Id, FirstName, LastName, Salary)
VALUES (2, 'Jan', 'Karwowski', 5000);

INSERT INTO public.Suppliers (Id, Name, GrossVehicleWeight, EmployeeId)
VALUES (1, 'First Supplier', 1000, 1);
INSERT INTO public.Suppliers (Id, Name, GrossVehicleWeight, EmployeeId)
VALUES (2, 'Second Supplier', 1500, 2);

INSERT INTO public.Groceries (Id, Address, SupplierId)
VALUES (1, 'Wolczanska 215', 1);
INSERT INTO public.Groceries (Id, Address, SupplierId)
VALUES (2, 'Piotrkowska 69', 2);

INSERT INTO public.HistoricalProducts (Id, Name, Amount, Price, TransactionDate,
                                         GroceryId, SupplierId)
VALUES (1, 'Carrot', 20, 2, '2021-03-08 19:45:16.968926', 2, 2);
INSERT INTO public.HistoricalProducts (Id, Name, Amount, Price, TransactionDate,
                                         GroceryId, SupplierId)
VALUES (2, 'Apple', 10, 5, '2021-03-08 19:45:16.978793', 2, 2);
INSERT INTO public.HistoricalProducts (Id, Name, Amount, Price, TransactionDate,
                                         GroceryId, SupplierId)
VALUES (3, 'Strawberry', 5, 10, '2021-03-08 19:45:16.978806', 2, 2);

INSERT INTO public.Products (Id, Name, Amount, GroceryId, SupplierId)
VALUES (1, 'Carrot', 20, 2, 2);
INSERT INTO public.Products (Id, Name, Amount, GroceryId, SupplierId)
VALUES (2, 'Apple', 10, 2, 2);
INSERT INTO public.Products (Id, Name, Amount, GroceryId, SupplierId)
VALUES (3, 'Strawberry', 5, 2, 2);

