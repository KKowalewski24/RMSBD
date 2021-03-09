INSERT INTO public.employees (id, firstname, lastname, salary)
VALUES (1, 'Kamil', 'Kowalewski', 2000);
INSERT INTO public.employees (id, firstname, lastname, salary)
VALUES (2, 'Jan', 'Karwowski', 5000);

INSERT INTO public.suppliers (id, name, grossvehicleweight, employeeid)
VALUES (1, 'First Supplier', 1000, 1);
INSERT INTO public.suppliers (id, name, grossvehicleweight, employeeid)
VALUES (2, 'Second Supplier', 1500, 2);

INSERT INTO public.groceries (id, address, supplierid)
VALUES (1, 'Wolczanska 215', 1);
INSERT INTO public.groceries (id, address, supplierid)
VALUES (2, 'Piotrkowska 69', 2);

INSERT INTO public.historicalproducts (id, name, amount, price, transactiondate,
                                       groceryid, supplierid)
VALUES (1, 'Carrot', 20, 2, '2021-03-08 19:45:16.968926', 2, 2);
INSERT INTO public.historicalproducts (id, name, amount, price, transactiondate,
                                       groceryid, supplierid)
VALUES (2, 'Apple', 10, 5, '2021-03-08 19:45:16.978793', 2, 2);
INSERT INTO public.historicalproducts (id, name, amount, price, transactiondate,
                                       groceryid, supplierid)
VALUES (3, 'Strawberry', 5, 10, '2021-03-08 19:45:16.978806', 2, 2);

INSERT INTO public.products (id, name, amount, groceryid, supplierid)
VALUES (1, 'Carrot', 20, 2, 2);
INSERT INTO public.products (id, name, amount, groceryid, supplierid)
VALUES (2, 'Apple', 10, 2, 2);
INSERT INTO public.products (id, name, amount, groceryid, supplierid)
VALUES (3, 'Strawberry', 5, 2, 2);

