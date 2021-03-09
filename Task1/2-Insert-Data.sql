INSERT INTO public.suppliers (name, grossvehicleweight, employeeid)
VALUES ('Supplier1', 965, NULL);
INSERT INTO public.suppliers (name, grossvehicleweight, employeeid)
VALUES ('Supplier2', 625, NULL);

INSERT INTO public.groceries (address, supplierid)
VALUES ('137 Teaticket Hwy, East Falmouth MA 2536', 2);
INSERT INTO public.groceries (address, supplierid)
VALUES ('297 Grant Avenue, Auburn NY 13021', 2);
INSERT INTO public.groceries (address, supplierid)
VALUES ('650 Main Ave, Norwalk CT 6851', 1);
INSERT INTO public.groceries (address, supplierid)
VALUES ('1400 Farmington Ave, Bristol CT 6010', 1);
INSERT INTO public.groceries (address, supplierid)
VALUES ('5033 Transit Road, Clarence NY 14031', 1);
INSERT INTO public.groceries (address, supplierid)
VALUES ('5560 Mcclellan Blvd, Anniston AL 36206', 2);

INSERT INTO public.employees (firstname, lastname, salary, employmentdate, groceryid)
VALUES ('Benjamin', 'Parker', 3584, '2019-01-29 05:50:49.000000', NULL);
INSERT INTO public.employees (firstname, lastname, salary, employmentdate, groceryid)
VALUES ('Zoe', 'Flores', 6520, '2020-07-07 19:04:06.000000', NULL);
INSERT INTO public.employees (firstname, lastname, salary, employmentdate, groceryid)
VALUES ('Daniel', 'Cook', 6254, '2020-05-11 18:02:01.000000', 3);
INSERT INTO public.employees (firstname, lastname, salary, employmentdate, groceryid)
VALUES ('Avery', 'Thomas', 5102, '2020-02-26 17:13:46.000000', 5);
INSERT INTO public.employees (firstname, lastname, salary, employmentdate, groceryid)
VALUES ('Sophia', 'Jones', 1671, '2019-05-04 16:39:03.000000', 5);
INSERT INTO public.employees (firstname, lastname, salary, employmentdate, groceryid)
VALUES ('Jack', 'Cox', 2204, '2019-10-27 10:07:14.000000', 5);
INSERT INTO public.employees (firstname, lastname, salary, employmentdate, groceryid)
VALUES ('Audrey', 'Rivera', 3048, '2019-11-18 22:24:29.000000', 5);
INSERT INTO public.employees (firstname, lastname, salary, employmentdate, groceryid)
VALUES ('Anthony', 'Mendoza', 6391, '2020-11-13 20:35:28.000000', 3);
INSERT INTO public.employees (firstname, lastname, salary, employmentdate, groceryid)
VALUES ('Elijah', 'Cruz', 1149, '2020-01-12 10:08:32.000000', 3);
INSERT INTO public.employees (firstname, lastname, salary, employmentdate, groceryid)
VALUES ('Ava', 'Williams', 5330, '2020-04-11 19:28:14.000000', 3);
INSERT INTO public.employees (firstname, lastname, salary, employmentdate, groceryid)
VALUES ('Mia', 'Miller', 7559, '2019-11-10 19:20:11.000000', 6);
INSERT INTO public.employees (firstname, lastname, salary, employmentdate, groceryid)
VALUES ('Bella', 'Mitchell', 6564, '2020-12-31 16:31:02.000000', 4);
INSERT INTO public.employees (firstname, lastname, salary, employmentdate, groceryid)
VALUES ('Sebastian', 'Ortiz', 5251, '2020-02-19 09:35:20.000000', 1);
INSERT INTO public.employees (firstname, lastname, salary, employmentdate, groceryid)
VALUES ('Eleanor', 'Young', 4165, '2020-10-09 06:02:09.000000', 1);
INSERT INTO public.employees (firstname, lastname, salary, employmentdate, groceryid)
VALUES ('Savannah', 'Hall', 2659, '2020-05-19 04:50:32.000000', 1);
INSERT INTO public.employees (firstname, lastname, salary, employmentdate, groceryid)
VALUES ('Julian', 'Bennet', 3312, '2019-03-13 18:09:26.000000', 2);
INSERT INTO public.employees (firstname, lastname, salary, employmentdate, groceryid)
VALUES ('Sebastian', 'Ortiz', 4463, '2020-03-31 11:03:31.000000', 2);
INSERT INTO public.employees (firstname, lastname, salary, employmentdate, groceryid)
VALUES ('Madison', 'Perez', 6491, '2019-12-30 12:58:20.000000', 2);
INSERT INTO public.employees (firstname, lastname, salary, employmentdate, groceryid)
VALUES ('Oliver', 'Diaz', 5312, '2019-09-10 20:15:37.000000', 2);
INSERT INTO public.employees (firstname, lastname, salary, employmentdate, groceryid)
VALUES ('Mia', 'Miller', 4185, '2020-12-11 15:21:48.000000', 6);
INSERT INTO public.employees (firstname, lastname, salary, employmentdate, groceryid)
VALUES ('Logan', 'Reyes', 3065, '2020-07-11 17:08:39.000000', 6);
INSERT INTO public.employees (firstname, lastname, salary, employmentdate, groceryid)
VALUES ('Grace', 'White', 1175, '2020-02-24 10:06:52.000000', 1);
INSERT INTO public.employees (firstname, lastname, salary, employmentdate, groceryid)
VALUES ('Lily', 'Walker', 3251, '2020-10-19 03:53:28.000000', 4);
INSERT INTO public.employees (firstname, lastname, salary, employmentdate, groceryid)
VALUES ('Eleanor', 'Young', 3466, '2020-03-09 03:02:50.000000', 6);
INSERT INTO public.employees (firstname, lastname, salary, employmentdate, groceryid)
VALUES ('Zoe', 'Flores', 1887, '2019-05-16 06:04:47.000000', 4);
INSERT INTO public.employees (firstname, lastname, salary, employmentdate, groceryid)
VALUES ('Addison', 'Wright', 7214, '2019-10-03 11:49:33.000000', 4);

UPDATE public.suppliers
SET employeeid =1
WHERE id = 1;

UPDATE public.suppliers
SET employeeid =2
WHERE id = 2;

INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Purple Asparagus', 22, 13, '2019-08-29 20:38:18.000000', 1);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Yellow Winter Squash', 5, 16, '2020-10-13 23:59:26.000000', 2);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Jicama', 15, 12, '2019-06-28 03:53:55.000000', 2);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Raisins', 23, 2, '2019-01-22 14:55:37.000000', 2);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Yellow Watermelon', 7, 8, '2020-09-03 04:40:45.000000', 2);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Broccoli', 24, 7, '2020-05-27 17:10:18.000000', 2);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Chinese Cabbage', 4, 18, '2020-09-24 16:08:59.000000', 2);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Green Peppers', 13, 6, '2020-11-21 01:21:02.000000', 2);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Strawberries', 11, 14, '2019-09-07 20:04:05.000000', 2);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Snow Peas', 10, 3, '2019-09-01 03:57:14.000000', 2);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Yellow Tomatoes', 8, 2, '2019-09-18 20:13:46.000000', 2);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Raisins', 11, 2, '2020-04-15 21:23:40.000000', 2);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Blueberries', 22, 12, '2020-06-24 14:25:00.000000', 2);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Yellow Winter Squash', 4, 5, '2020-06-29 16:23:36.000000', 2);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Elderberries', 18, 10, '2019-05-13 01:15:51.000000', 2);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Lettuce', 9, 2, '2020-01-08 04:34:31.000000', 2);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Turnips', 14, 18, '2020-01-31 02:34:31.000000', 2);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Dates', 17, 1, '2020-05-11 09:00:49.000000', 2);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Watercress', 22, 5, '2020-02-01 01:46:17.000000', 2);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('White Nectarines', 13, 12, '2020-08-11 21:44:46.000000', 2);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Yellow Potatoes', 8, 16, '2019-12-11 18:05:48.000000', 2);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Pomegranates', 8, 11, '2019-10-11 01:16:45.000000', 2);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Zucchini', 18, 5, '2020-07-29 04:42:07.000000', 2);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Yellow Summer Squash', 12, 3, '2020-04-28 07:01:03.000000', 2);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Yellow Figs', 14, 18, '2020-12-30 05:53:20.000000', 2);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Turnips', 14, 2, '2020-12-24 19:20:39.000000', 2);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Garlic', 14, 14, '2020-04-29 00:58:43.000000', 2);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Lemons', 1, 8, '2019-05-15 02:08:55.000000', 2);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Yellow Tomatoes', 24, 10, '2020-10-02 07:35:27.000000', 2);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Blood Oranges', 6, 19, '2019-07-21 21:52:27.000000', 1);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Red Pears', 11, 16, '2019-03-12 05:03:24.000000', 1);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Purple Belgian Endive', 7, 5, '2019-10-03 21:34:13.000000', 1);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Green Grapes', 9, 14, '2019-08-26 12:10:51.000000', 1);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Black Currants', 3, 16, '2020-06-12 06:29:34.000000', 1);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('White Corn', 22, 10, '2019-11-21 05:41:59.000000', 1);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Lettuce', 17, 19, '2019-04-02 21:49:29.000000', 1);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Raspberries', 2, 9, '2019-09-16 02:40:46.000000', 1);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Radishes', 15, 14, '2020-02-23 22:20:01.000000', 1);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Zucchini', 10, 11, '2019-06-29 05:40:01.000000', 1);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Butternut Squash', 20, 13, '2020-12-04 02:36:29.000000', 1);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Grape Juice (100%)', 18, 4, '2020-08-01 11:33:54.000000', 1);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Red Grapes', 11, 18, '2019-11-24 05:53:01.000000', 1);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Peaches', 7, 1, '2020-08-15 08:26:13.000000', 1);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Mushrooms', 23, 11, '2019-03-10 00:14:47.000000', 1);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Peaches', 10, 10, '2019-09-05 23:24:55.000000', 1);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Tomatoes', 9, 15, '2020-11-26 12:33:40.000000', 1);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Purple Asparagus', 1, 3, '2019-03-29 17:43:58.000000', 1);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Carrots', 22, 10, '2020-12-30 20:00:13.000000', 1);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Green Beans', 16, 18, '2020-06-06 19:58:02.000000', 1);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Shallots', 9, 3, '2020-07-26 15:09:36.000000', 1);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Yellow Winter Squash', 7, 7, '2020-12-14 13:43:40.000000', 1);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Mushrooms', 7, 9, '2020-10-16 23:43:41.000000', 1);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Green Cabbage', 17, 9, '2020-03-02 05:46:39.000000', 1);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Nectarines', 4, 8, '2020-04-20 01:06:02.000000', 1);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Artichokes', 10, 13, '2020-11-07 15:13:13.000000', 1);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Kiwifruit', 12, 11, '2020-01-14 04:34:25.000000', 1);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Green Peppers', 6, 2, '2020-09-25 09:59:00.000000', 1);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Broccoli Rabe', 17, 11, '2020-07-30 18:16:42.000000', 1);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Cranberries', 18, 3, '2019-06-16 09:19:38.000000', 2);
INSERT INTO public.boughtproduct (name, amount, price, transactiondate, supplierid)
VALUES ('Black Salsify', 15, 7, '2019-04-03 21:15:05.000000', 2);

INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Cranberries', 12, NULL, 1);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Dried Plums', 8, NULL, 2);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Peas', 21, NULL, 2);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Limes', 8, NULL, 2);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Cucumbers', 9, NULL, 2);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Green Beans', 7, NULL, 2);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Turnips', 9, NULL, 2);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Brussels Sprouts', 17, NULL, 2);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Honeydew', 5, NULL, 2);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Cauliflower', 15, NULL, 2);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Green Grapes', 8, NULL, 2);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Persimmons', 14, NULL, 2);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Kiwifruit', 10, NULL, 2);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Artichokes', 12, NULL, 2);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('White Peaches', 5, NULL, 2);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Shallots', 7, NULL, 2);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Watermelon', 12, NULL, 2);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Oranges', 19, NULL, 2);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Red Onions', 23, NULL, 2);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Apricots', 15, NULL, 2);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Peaches', 3, NULL, 2);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Asparagus', 17, NULL, 2);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Blood Oranges', 7, NULL, 2);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Radishes', 15, NULL, 2);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Brussels Sprouts', 13, NULL, 2);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Red Apples', 14, NULL, 2);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Brussels Sprouts', 23, NULL, 1);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Raisins', 23, NULL, 2);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Purple Grapes', 17, NULL, 2);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Yellow Watermelon', 1, NULL, 2);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Lemons', 21, NULL, 1);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Sweet Corn', 15, NULL, 1);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Artichokes', 3, NULL, 1);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Apricots', 14, NULL, 1);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Red Peppers', 18, NULL, 1);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Mushrooms', 6, NULL, 1);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Yellow Winter Squash', 23, NULL, 1);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Cauliflower', 6, NULL, 1);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Dried Plums', 8, NULL, 1);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Brown Pears', 23, NULL, 1);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Broccoflower', 21, NULL, 1);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Oranges', 24, NULL, 1);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Green Beans', 1, NULL, 1);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Shallots', 12, NULL, 1);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Red Apples', 11, NULL, 1);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Watermelon', 3, NULL, 1);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Parsnips', 2, NULL, 1);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Concord Grapes', 1, NULL, 1);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Elderberries', 14, NULL, 1);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Eggplant', 2, NULL, 1);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Mushrooms', 10, NULL, 1);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Brussels Sprouts', 7, NULL, 1);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Sugar Snap Peas', 16, NULL, 1);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Endive', 4, NULL, 1);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Black Olives', 22, NULL, 1);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Persimmons', 5, NULL, 1);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Chayote Squash', 23, NULL, 1);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Tomatoes', 19, NULL, 2);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Celery', 8, NULL, 1);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Plums', 8, NULL, 2);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Cucumbers', 13, 1, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Kohlrabi', 9, 1, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Yellow Tomatoes', 14, 1, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Cherries', 9, 1, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Sweet Potatoes', 2, 1, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Strawberries', 22, 1, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Oranges', 21, 1, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Yellow Winter Squash', 11, 1, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Oranges', 19, 1, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Rutabagas', 23, 4, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Chayote Squash', 7, 4, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Green Cabbage', 18, 4, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Chayote Squash', 17, 4, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Artichokes', 24, 3, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Rhubarb', 12, 3, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Pineapples', 2, 3, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Brussels Sprouts', 3, 4, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Green Peppers', 6, 3, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Leeks', 24, 2, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Cape Gooseberries', 8, 2, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Lettuce', 3, 6, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Pomegranates', 16, 6, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Elderberries', 7, 6, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('White Nectarines', 2, 6, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Snow Peas', 2, 6, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Ginger', 18, 6, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Black Salsify', 13, 6, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Blood Oranges', 6, 6, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Pumpkin', 1, 6, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('White Peaches', 24, 6, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Cape Gooseberries', 7, 2, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Potatoes (purple fleshed)', 22, 2, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Pomegranates', 14, 2, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Concord Grapes', 5, 2, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Cucumbers', 3, 2, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Celery', 10, 2, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Pink/Red Grapefruit', 7, 2, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Red Peppers', 10, 2, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Red Apples', 7, 3, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Purple Peppers', 10, 1, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Rhubarb', 16, 3, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Red Apples', 22, 5, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Cauliflower', 9, 5, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Yellow Summer Squash', 18, 5, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Okra', 24, 5, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Dried Plums', 6, 3, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Lettuce', 6, 5, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Purple Peppers', 18, 5, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Sweet Corn', 13, 5, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Asparagus', 5, 5, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Dried Plums', 19, 4, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Grapefruit', 8, 4, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Onions', 23, 4, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Peas', 15, 4, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Watercress', 15, 5, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Purple Carrots', 13, 5, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Garlic', 20, 3, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Broccoli', 21, 3, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('Cauliflower', 13, 3, NULL);
INSERT INTO public.products (name, amount, groceryid, supplierid)
VALUES ('White Nectarines', 23, 4, NULL);

INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Blackberries', 16, 4, '2020-10-03 11:28:38.000000', 6);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Zucchini', 1, 18, '2020-06-13 10:32:41.000000', 4);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Green Peppers', 1, 18, '2019-07-29 23:17:26.000000', 4);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Purple Cabbage', 2, 1, '2020-06-24 06:34:19.000000', 5);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Green Cabbage', 5, 9, '2019-03-22 11:58:53.000000', 5);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Kiwifruit', 7, 3, '2019-09-12 00:47:04.000000', 5);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Rhubarb', 1, 16, '2020-05-16 14:24:31.000000', 4);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Garlic', 4, 4, '2020-02-10 04:48:08.000000', 4);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Strawberries', 14, 5, '2020-07-28 01:27:40.000000', 4);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Blackberries', 12, 2, '2020-07-28 14:34:32.000000', 4);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Arugula', 15, 8, '2019-03-01 21:21:45.000000', 6);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Avocados', 6, 18, '2019-04-19 04:01:20.000000', 6);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Chinese Cabbage', 21, 8, '2019-03-26 20:41:36.000000', 5);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Green Onions', 6, 10, '2019-09-23 07:20:40.000000', 5);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Asparagus', 7, 1, '2020-05-04 21:56:38.000000', 5);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Yellow Winter Squash', 7, 13, '2020-08-28 23:14:10.000000', 5);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Cape Gooseberries', 18, 10, '2020-10-21 15:15:19.000000', 5);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Jicama', 8, 7, '2020-01-15 03:22:32.000000', 6);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Watermelon', 1, 15, '2020-01-07 00:32:36.000000', 5);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Red Onions', 7, 4, '2020-03-24 15:36:52.000000', 6);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Yellow Winter Squash', 7, 15, '2020-09-28 16:13:41.000000', 6);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Shallots', 1, 10, '2019-07-21 17:24:32.000000', 6);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Butternut Squash', 19, 2, '2020-07-03 08:29:45.000000', 6);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Cherries', 3, 12, '2020-12-05 20:53:01.000000', 6);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Rutabagas', 18, 8, '2020-09-29 10:43:49.000000', 5);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Raisins', 20, 11, '2019-06-28 12:06:17.000000', 6);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Peaches', 24, 13, '2020-11-01 08:07:55.000000', 2);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Yellow Apples', 24, 13, '2020-09-20 14:22:58.000000', 2);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Dried Plums', 7, 5, '2019-03-15 08:35:21.000000', 3);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Red Grapes', 12, 17, '2020-11-04 18:09:17.000000', 3);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Bananas', 14, 14, '2019-02-16 14:21:40.000000', 3);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Radishes', 4, 3, '2019-03-14 03:00:24.000000', 3);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Lemons', 15, 5, '2019-11-05 10:35:03.000000', 1);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Green Cabbage', 7, 7, '2019-07-07 19:34:31.000000', 1);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Green Onions', 12, 2, '2019-11-01 16:30:59.000000', 1);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Tangerines', 10, 18, '2019-01-12 12:41:10.000000', 1);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Sweet Corn', 16, 5, '2019-07-21 10:20:10.000000', 1);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Tangerines', 15, 8, '2020-01-12 00:02:07.000000', 1);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Arugula', 16, 11, '2020-06-24 10:11:22.000000', 1);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Potatoes (White Fleshed)', 22, 9, '2019-05-15 13:48:37.000000', 1);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Red Onions', 6, 11, '2019-12-07 04:33:52.000000', 1);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Turnips', 9, 9, '2020-05-31 15:56:12.000000', 1);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Mangoes', 16, 2, '2019-06-08 19:11:48.000000', 2);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Plums', 22, 11, '2020-01-13 01:40:48.000000', 3);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Purple Cabbage', 9, 14, '2020-02-05 14:19:15.000000', 3);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Dates', 12, 9, '2019-06-05 21:33:25.000000', 3);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Brussels Sprouts', 2, 11, '2020-06-20 03:55:20.000000', 3);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Tomatoes', 19, 4, '2020-11-21 08:27:09.000000', 3);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Sweet Corn', 7, 8, '2020-04-06 01:05:09.000000', 4);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Brown Pears', 17, 6, '2020-03-13 22:04:36.000000', 4);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Potatoes (White Fleshed)', 5, 4, '2020-04-28 10:52:42.000000', 4);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Jicama', 9, 13, '2020-03-01 17:23:33.000000', 2);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Green Grapes', 9, 18, '2019-03-15 10:45:51.000000', 2);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Strawberries', 22, 12, '2019-07-28 23:18:26.000000', 2);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Radicchio', 23, 15, '2020-12-26 00:34:22.000000', 2);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Yellow Tomatoes', 23, 3, '2020-05-03 20:14:45.000000', 2);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Yellow Apples', 3, 1, '2020-02-14 13:57:25.000000', 2);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Raisins', 4, 2, '2019-05-29 17:30:27.000000', 2);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Lettuce', 12, 10, '2020-08-07 07:27:29.000000', 3);
INSERT INTO public.soldproduct (name, amount, price, transactiondate, groceryid)
VALUES ('Oranges', 10, 15, '2019-09-18 18:58:05.000000', 4);
