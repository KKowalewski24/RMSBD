INSERT INTO public.employees (firstname, lastname, salary)
VALUES ('Kamil', 'Kowalewski', 2000);
INSERT INTO public.employees (firstname, lastname, salary)
VALUES ('Jan', 'Karwowski', 5000);

INSERT INTO public.suppliers (name, grossvehicleweight, employeeid)
VALUES ('First Supplier', 1000, 1);
INSERT INTO public.suppliers (name, grossvehicleweight, employeeid)
VALUES ('Second Supplier', 1500, 2);

INSERT INTO public.groceries (address, supplierid)
VALUES ('Wolczanska 215', 1);
INSERT INTO public.groceries (address, supplierid)
VALUES ('Piotrkowska 69', 2);

INSERT INTO public.historicalproducts (name, amount, price, transactiondate,
                                       groceryid, supplierid)
VALUES ('Carrot', 20, 2, '2021-03-08 19:45:16.968926', 2, 2);
INSERT INTO public.historicalproducts (name, amount, price, transactiondate,
                                       groceryid, supplierid)
VALUES ('Apple', 10, 5, '2021-03-08 19:45:16.978793', 2, 2);
INSERT INTO public.historicalproducts (name, amount, price, transactiondate,
                                       groceryid, supplierid)
VALUES ('Strawberry', 5, 10, '2021-03-08 19:45:16.978806', 2, 2);

INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Carrot', 20, 2, 2);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Apple', 10, 2, 2);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Strawberry', 5, 2, 2);

