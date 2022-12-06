CREATE DATABASE nomnomnow_db;
-- CREATE ALL USER 'webapp'@'%' IDENTIFIED BY 'bnD50!9OH2f';
GRANT ALL PRIVILEGES ON nomnomnow_db.* TO 'webapp'@'%';
FLUSH PRIVILEGES;

USE nomnomnow_db;

create table Customer (
	customer_id INT AUTO_INCREMENT PRIMARY KEY,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	email VARCHAR(50) UNIQUE NOT NULL,
	phone_number VARCHAR(12) UNIQUE NOT NULL,
	billing_street TEXT NOT NULL,
	billing_city TEXT NOT NULL,
	billing_zip VARCHAR(5) NOT NULL,
	billing_country TEXT NOT NULL,
	billing_state TEXT NOT NULL
);

insert into Customer (customer_id, first_name, last_name, email, phone_number, billing_street, billing_city, billing_zip, billing_country, billing_state) values (1, 'Bonnie', 'McVeigh', 'bmcveigh0@dedecms.com', '617-107-0762', '959 Eagle Crest Hill', 'Newton', '02162', 'United States', 'Massachusetts');
insert into Customer (customer_id, first_name, last_name, email, phone_number, billing_street, billing_city, billing_zip, billing_country, billing_state) values (2, 'Georgina', 'Lowson', 'glowson1@de.vu', '413-752-4932', '06301 Melvin Court', 'Springfield', '01129', 'United States', 'Massachusetts');
insert into Customer (customer_id, first_name, last_name, email, phone_number, billing_street, billing_city, billing_zip, billing_country, billing_state) values (3, 'Stormy', 'Grzesiewicz', 'sgrzesiewicz2@pinterest.com', '617-565-0011', '656 Dapin Terrace', 'Lynn', '01905', 'United States', 'Massachusetts');
insert into Customer (customer_id, first_name, last_name, email, phone_number, billing_street, billing_city, billing_zip, billing_country, billing_state) values (4, 'Simone', 'Avery', 'savery3@goo.ne.jp', '413-691-9905', '95951 Village Alley', 'Springfield', '01105', 'United States', 'Massachusetts');
insert into Customer (customer_id, first_name, last_name, email, phone_number, billing_street, billing_city, billing_zip, billing_country, billing_state) values (5, 'Kristan', 'Ibotson', 'kibotson4@dyndns.org', '413-483-1997', '736 Thierer Road', 'Springfield', '01129', 'United States', 'Massachusetts');
insert into Customer (customer_id, first_name, last_name, email, phone_number, billing_street, billing_city, billing_zip, billing_country, billing_state) values (6, 'Durward', 'Leban', 'dleban5@addthis.com', '781-244-9916', '3 Londonderry Place', 'Springfield', '01114', 'United States', 'Massachusetts');
insert into Customer (customer_id, first_name, last_name, email, phone_number, billing_street, billing_city, billing_zip, billing_country, billing_state) values (7, 'Celine', 'Zapata', 'czapata6@apache.org', '508-617-0751', '4161 Clyde Gallagher Crossing', 'New Bedford', '02745', 'United States', 'Massachusetts');
insert into Customer (customer_id, first_name, last_name, email, phone_number, billing_street, billing_city, billing_zip, billing_country, billing_state) values (8, 'Zilvia', 'Humbey', 'zhumbey7@ucoz.com', '617-548-3159', '65994 Bunker Hill Street', 'Boston', '02298', 'United States', 'Massachusetts');
insert into Customer (customer_id, first_name, last_name, email, phone_number, billing_street, billing_city, billing_zip, billing_country, billing_state) values (9, 'Josephine', 'Chmarny', 'jchmarny8@google.es', '508-175-0155', '965 Cardinal Point', 'Boston', '02114', 'United States', 'Massachusetts');
insert into Customer (customer_id, first_name, last_name, email, phone_number, billing_street, billing_city, billing_zip, billing_country, billing_state) values (10, 'Mauricio', 'Le Grand', 'mlegrand9@youtube.com', '413-179-9664', '500 Melody Crossing', 'Springfield', '01129', 'United States', 'Massachusetts');



create table DeliveryDriver (
	driver_id INT AUTO_INCREMENT PRIMARY KEY,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	phone_number VARCHAR(12) UNIQUE NOT NULL, 
	delivery_range_in_miles INT NOT NULL,
	starting_hour INT NOT NULL,
	ending_hour INT NOT NULL,
	starting_date DATE NOT NULL,
	CHECK (0 <= starting_hour <= 24),
	CHECK (0 <= ending_hour <= 24)
);
insert into DeliveryDriver (driver_id, first_name, last_name, phone_number, delivery_range_in_miles, starting_hour, ending_hour, starting_date) values (1, 'Matthieu', 'Credland', '571-438-4983', 1, 1, 1, '2022-05-02');
insert into DeliveryDriver (driver_id, first_name, last_name, phone_number, delivery_range_in_miles, starting_hour, ending_hour, starting_date) values (2, 'Renate', 'Dutson', '409-952-7694', 2, 2, 2, '2022-05-09');
insert into DeliveryDriver (driver_id, first_name, last_name, phone_number, delivery_range_in_miles, starting_hour, ending_hour, starting_date) values (3, 'Estrellita', 'Lucas', '246-151-8890', 3, 3, 3, '2022-05-11');
insert into DeliveryDriver (driver_id, first_name, last_name, phone_number, delivery_range_in_miles, starting_hour, ending_hour, starting_date) values (4, 'Sigrid', 'Scotsbrook', '331-623-7952', 4, 4, 4, '2022-10-21');
insert into DeliveryDriver (driver_id, first_name, last_name, phone_number, delivery_range_in_miles, starting_hour, ending_hour, starting_date) values (5, 'Sada', 'Lishman', '813-706-5643', 5, 5, 5, '2022-08-05');
insert into DeliveryDriver (driver_id, first_name, last_name, phone_number, delivery_range_in_miles, starting_hour, ending_hour, starting_date) values (6, 'Naoma', 'Kemme', '466-695-8296', 6, 6, 6, '2022-10-13');
insert into DeliveryDriver (driver_id, first_name, last_name, phone_number, delivery_range_in_miles, starting_hour, ending_hour, starting_date) values (7, 'Leeanne', 'Ravens', '469-351-4582', 7, 7, 7, '2022-10-13');
insert into DeliveryDriver (driver_id, first_name, last_name, phone_number, delivery_range_in_miles, starting_hour, ending_hour, starting_date) values (8, 'Kristopher', 'Iglesia', '375-327-1827', 8, 8, 8, '2022-10-13');
insert into DeliveryDriver (driver_id, first_name, last_name, phone_number, delivery_range_in_miles, starting_hour, ending_hour, starting_date) values (9, 'Hans', 'Pellamont', '955-365-1244', 9, 9, 9, '2022-10-13');
insert into DeliveryDriver (driver_id, first_name, last_name, phone_number, delivery_range_in_miles, starting_hour, ending_hour, starting_date) values (10, 'Hamish', 'Wharf', '949-744-0308', 10, 10, 10, '2022-10-13');


create table Restaurant (
	rest_id INT PRIMARY KEY,
	rest_name VARCHAR(50) NOT NULL,
	country VARCHAR(50) NOT NULL,
	rest_state VARCHAR(50) NOT NULL,
	city VARCHAR(50) NOT NULL,
	street VARCHAR(50) NOT NULL,
	zip VARCHAR(5) NOT NULL,
	opening_hour INT NOT NULL,
	closing_hour INT NOT NULL,
	info VARCHAR(50) NOT NULL,
	CHECK (0 <= opening_hour <= 24),
	CHECK (0 <= closing_hour <= 24)
);
insert into Restaurant (rest_id, rest_name, country, rest_state, city, street, zip, opening_hour, closing_hour, info) values (1, 'Linkbuzz', 'United States', 'Massachusetts', 'Boston', '53758 Utah Street', '02298', 1, 1, 'Chinese Restaurant');
insert into Restaurant (rest_id, rest_name, country, rest_state, city, street, zip, opening_hour, closing_hour, info) values (2, 'Omba', 'United States', 'Massachusetts', 'Newton', '9358 Graceland Lane', '02162', 2, 2, 'Italian Restaurant');
insert into Restaurant (rest_id, rest_name, country, rest_state, city, street, zip, opening_hour, closing_hour, info) values (3, 'Tazzy', 'United States', 'Massachusetts', 'Springfield', '02 Daystar Plaza', '01129', 3, 3, 'Thai Restaurant');
insert into Restaurant (rest_id, rest_name, country, rest_state, city, street, zip, opening_hour, closing_hour, info) values (4, 'Skinte', 'United States', 'Massachusetts', 'Boston', '69589 Crowley Street', '02298', 4, 4, 'Japanese Restaurant');
insert into Restaurant (rest_id, rest_name, country, rest_state, city, street, zip, opening_hour, closing_hour, info) values (5, 'Livetube', 'United States', 'Massachusetts', 'Springfield', '99718 Melby Place', '01105', 5, 5, 'Korean Restaurant');
insert into Restaurant (rest_id, rest_name, country, rest_state, city, street, zip, opening_hour, closing_hour, info) values (6, 'Oloo', 'United States', 'Massachusetts', 'Springfield', '3950 Ronald Regan Alley', '01114', 6, 6, 'Mexican Restaurant');
insert into Restaurant (rest_id, rest_name, country, rest_state, city, street, zip, opening_hour, closing_hour, info) values (7, 'Bluezoom', 'United States', 'Massachusetts', 'Springfield', '8779 Harbort Alley', '01114', 7, 7, 'American Restaurant');
insert into Restaurant (rest_id, rest_name, country, rest_state, city, street, zip, opening_hour, closing_hour, info) values (8, 'Realcube', 'United States', 'Massachusetts', 'New Bedford', '0412 Towne Circle', '02745', 8, 8, 'Seafood Restaurant');
insert into Restaurant (rest_id, rest_name, country, rest_state, city, street, zip, opening_hour, closing_hour, info) values (9, 'Zoonder', 'United States', 'Massachusetts', 'Newton', '4 Moose Crossing', '02162', 9, 9, 'Vietnamese Restaurant');
insert into Restaurant (rest_id, rest_name, country, rest_state, city, street, zip, opening_hour, closing_hour, info) values (10, 'Yacero', 'United States', 'Massachusetts', 'Boston', '7277 Brown Pass', '02283', 10, 10, 'Thai Restaurant');

create table FoodOrder (
	order_id INT PRIMARY KEY,
	cust_id INT NOT NULL,
	driver_id INT NOT NULL,
	rest_id INT NOT NULL,
	food_total INT NOT NULL,
	delivery_fee INT NOT NULL,
	order_completed BOOLEAN NOT NULL,
	special_instructions VARCHAR(50) NOT NULL,
    FOREIGN KEY (cust_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (driver_id) REFERENCES DeliveryDriver(driver_id),
    FOREIGN KEY (rest_id) REFERENCES Restaurant(rest_id)
);


insert into FoodOrder (order_id, cust_id, driver_id, rest_id, food_total, delivery_fee, order_completed, special_instructions) values (1, 1, 1, 10, 65, 55, false, '');
insert into FoodOrder (order_id, cust_id, driver_id, rest_id, food_total, delivery_fee, order_completed, special_instructions) values (2, 2, 2, 9, 57, 14, true, '');
insert into FoodOrder (order_id, cust_id, driver_id, rest_id, food_total, delivery_fee, order_completed, special_instructions) values (3, 3, 3, 8, 69, 9, true, '');
insert into FoodOrder (order_id, cust_id, driver_id, rest_id, food_total, delivery_fee, order_completed, special_instructions) values (4, 4, 4, 7, 67, 20, false, '');
insert into FoodOrder (order_id, cust_id, driver_id, rest_id, food_total, delivery_fee, order_completed, special_instructions) values (5, 5, 5, 10, 6, 10, false, '');
insert into FoodOrder (order_id, cust_id, driver_id, rest_id, food_total, delivery_fee, order_completed, special_instructions) values (6, 6, 6, 1, 13, 32, false, '');
insert into FoodOrder (order_id, cust_id, driver_id, rest_id, food_total, delivery_fee, order_completed, special_instructions) values (7, 7, 7, 7, 79, 26, true, '');
insert into FoodOrder (order_id, cust_id, driver_id, rest_id, food_total, delivery_fee, order_completed, special_instructions) values (8, 8, 8, 8, 53, 42, false, '');
insert into FoodOrder (order_id, cust_id, driver_id, rest_id, food_total, delivery_fee, order_completed, special_instructions) values (9, 9, 9, 9, 87, 27, false, '');
insert into FoodOrder (order_id, cust_id, driver_id, rest_id, food_total, delivery_fee, order_completed, special_instructions) values (10, 10, 10, 10, 98, 61, false, '');

create table CustomerDriver (
	driver_id INT NOT NULL,
	customer_id INT NOT NULL,
	order_id INT NOT NULL,
	delivery_zip VARCHAR(5) NOT NULL,
	delivery_city TEXT NOT NULL,
	delivery_street TEXT NOT NULL,
	delivery_state TEXT NOT NULL,
	delivery_country TEXT NOT NULL,
	order_delivered TEXT NOT NULL,
	FOREIGN KEY (driver_id) REFERENCES DeliveryDriver(driver_id),
	FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
	FOREIGN KEY (order_id) REFERENCES FoodOrder(order_id)
);
insert into CustomerDriver (driver_id, customer_id, order_id, delivery_zip, delivery_city, delivery_street, delivery_state, delivery_country, order_delivered) values (1, 1, 1, '02162', 'Newton', '958 Reindahl Parkway', 'Massachusetts', 'United States', false);
insert into CustomerDriver (driver_id, customer_id, order_id, delivery_zip, delivery_city, delivery_street, delivery_state, delivery_country, order_delivered) values (2, 2, 2,  '02745', 'New Bedford', '50 Transport Hill', 'Massachusetts', 'United States', true);
insert into CustomerDriver (driver_id, customer_id, order_id, delivery_zip, delivery_city, delivery_street, delivery_state, delivery_country, order_delivered) values (3, 3, 3, '01105', 'Springfield', '515 Londonderry Circle', 'Massachusetts', 'United States', false);
insert into CustomerDriver (driver_id, customer_id, order_id, delivery_zip, delivery_city, delivery_street, delivery_state, delivery_country, order_delivered) values (4, 4, 4, '01105', 'Springfield', '45 Village Green Center', 'Massachusetts', 'United States', true);
insert into CustomerDriver (driver_id, customer_id, order_id, delivery_zip, delivery_city, delivery_street, delivery_state, delivery_country, order_delivered) values (5, 5, 5, '02203', 'Boston', '1 Moulton Parkway', 'Massachusetts', 'United States', true);
insert into CustomerDriver (driver_id, customer_id, order_id, delivery_zip, delivery_city, delivery_street, delivery_state, delivery_country, order_delivered) values (6, 6, 6, '02298', 'Boston', '7 Eastlawn Plaza', 'Massachusetts', 'United States', false);
insert into CustomerDriver (driver_id, customer_id, order_id, delivery_zip, delivery_city, delivery_street, delivery_state, delivery_country, order_delivered) values (7, 7, 7, '02298', 'Boston', '15276 Ryan Pass', 'Massachusetts', 'United States', false);
insert into CustomerDriver (driver_id, customer_id, order_id, delivery_zip, delivery_city, delivery_street, delivery_state, delivery_country, order_delivered) values (8, 8, 8, '02208', 'Boston', '697 Doe Crossing Drive', 'Massachusetts', 'United States', true);
insert into CustomerDriver (driver_id, customer_id, order_id, delivery_zip, delivery_city, delivery_street, delivery_state, delivery_country, order_delivered) values (9, 9, 9, '02216', 'Boston', '8060 Nevada Drive', 'Massachusetts', 'United States', true);
insert into CustomerDriver (driver_id, customer_id, order_id, delivery_zip, delivery_city, delivery_street, delivery_state, delivery_country, order_delivered) values (10, 10, 10, '02298', 'Boston', '403 Garrison Park', 'Massachusetts', 'United States', true);

create table Payment (
	order_id INT NOT NULL,
	amount DECIMAL(5,2) NOT NULL,
	method TEXT NOT NULL,
	paydate DATE NOT NULL,
	FOREIGN KEY (order_id) REFERENCES FoodOrder(order_id)
);
insert into Payment (order_id, amount, method, paydate) values (1, 17.81, 'visa', '2022-10-13');
insert into Payment (order_id, amount, method, paydate) values (2, 45.61, 'mastercard', '2022-10-13');
insert into Payment (order_id, amount, method, paydate) values (3, 15.22, 'amex', '2022-10-13');
insert into Payment (order_id, amount, method, paydate) values (4, 39.41, 'mastercard', '2022-10-13');
insert into Payment (order_id, amount, method, paydate) values (5, 38.31, 'mastercard', '2022-10-13');
insert into Payment (order_id, amount, method, paydate) values (6, 34.24, 'visa', '2022-10-13');
insert into Payment (order_id, amount, method, paydate) values (7, 55.16, 'amex', '2022-10-13');
insert into Payment (order_id, amount, method, paydate) values (8, 48.48, 'discover', '2022-10-13');
insert into Payment (order_id, amount, method, paydate) values (9, 33.35, 'mastercard', '2022-10-13');
insert into Payment (order_id, amount, method, paydate) values (10, 36.37, 'visa', '2022-10-13');



create table RestaurantCategory (
	category_id INT PRIMARY KEY,
	rest_id INT NOT NULL,
	cat_name TEXT NOT NULL,
	FOREIGN KEY (rest_id) REFERENCES Restaurant(rest_id)

);
insert into RestaurantCategory (category_id, rest_id, cat_name) values (8, 2, 'Chinese');
insert into RestaurantCategory (category_id, rest_id, cat_name) values (31, 5, 'American');
insert into RestaurantCategory (category_id, rest_id, cat_name) values (4, 2, 'Italian');
insert into RestaurantCategory (category_id, rest_id, cat_name) values (12, 6, 'Mexican');
insert into RestaurantCategory (category_id, rest_id, cat_name) values (49, 1, 'Japanese');
insert into RestaurantCategory (category_id, rest_id, cat_name) values (1, 5, 'Peruvian');
insert into RestaurantCategory (category_id, rest_id, cat_name) values (3, 3, 'French');
insert into RestaurantCategory (category_id, rest_id, cat_name) values (9, 3, 'Romanian');
insert into RestaurantCategory (category_id, rest_id, cat_name) values (22, 6, 'Turkish');
insert into RestaurantCategory (category_id, rest_id, cat_name) values (15, 2, 'Indonesian');

create table Menu (
	menu_id INT PRIMARY KEY,
	rest_id INT NOT NULL,
	FOREIGN KEY (rest_id) REFERENCES Restaurant(rest_id)
);
insert into Menu (menu_id, rest_id) values (1, 1);
insert into Menu (menu_id, rest_id) values (2, 2);
insert into Menu (menu_id, rest_id) values (3, 3);
insert into Menu (menu_id, rest_id) values (4, 4);
insert into Menu (menu_id, rest_id) values (5, 5);
insert into Menu (menu_id, rest_id) values (6, 6);
insert into Menu (menu_id, rest_id) values (7, 7);
insert into Menu (menu_id, rest_id) values (8, 8);
insert into Menu (menu_id, rest_id) values (9, 9);
insert into Menu (menu_id, rest_id) values (10, 10);

create table FoodCategory (
	name VARCHAR(50) NOT NULL,
	food_category_id INT PRIMARY KEY
);
insert into FoodCategory (name, food_category_id) values ('Breakfast', 1);
insert into FoodCategory (name, food_category_id) values ('Drinks', 2);
insert into FoodCategory (name, food_category_id) values ('Lunch', 3);
insert into FoodCategory (name, food_category_id) values ('Dinner', 4);
insert into FoodCategory (name, food_category_id) values ('Brunch', 5);
insert into FoodCategory (name, food_category_id) values ('Appetizer', 6);
insert into FoodCategory (name, food_category_id) values ('Cocktails', 7);
insert into FoodCategory (name, food_category_id) values ('Dessert', 8);



create table MenuItem (
	item_id INT AUTO_INCREMENT PRIMARY KEY,
	menu_id INT NOT NULL,
	food_category_id INT NOT NULL,
	item_name TEXT NOT NULL,
	item_description VARCHAR(50) NOT NULL,
	price DECIMAL(5,2) NOT NULL,
	availability BOOLEAN NOT NULL,
	FOREIGN KEY (menu_id) REFERENCES Menu(menu_id),
	FOREIGN KEY (food_category_id) REFERENCES FoodCategory(food_category_id)

);
insert into MenuItem (item_id, menu_id, food_category_id, item_name, item_description, price, availability) values (1, 1, 3, 'fried-chicken', 'chicken that is fried', 78, true);
insert into MenuItem (item_id, menu_id, food_category_id, item_name, item_description, price, availability) values (2, 1, 1, 'pancakes', '', 18, false);
insert into MenuItem (item_id, menu_id, food_category_id, item_name, item_description, price, availability) values (3, 1, 7, '', '', 28, false);
insert into MenuItem (item_id, menu_id, food_category_id, item_name, item_description, price, availability) values (4, 4, 4, 'spaghetti', '', 12, true);
insert into MenuItem (item_id, menu_id, food_category_id, item_name, item_description, price, availability) values (5, 3, 8, 'flan', 'custard dessert with a layer of clear caramel sauce', 56, false);
insert into MenuItem (item_id, menu_id, food_category_id, item_name, item_description, price, availability) values (6, 4, 7, '', '', 20, true);
insert into MenuItem (item_id, menu_id, food_category_id, item_name, item_description, price, availability) values (7, 3, 1, 'eggs sandwich', 'sandwich with eggs', 38, true);
insert into MenuItem (item_id, menu_id, food_category_id, item_name, item_description, price, availability) values (8, 1, 6, 'spring rolls', '', 52, true);
insert into MenuItem (item_id, menu_id, food_category_id, item_name, item_description, price, availability) values (9, 2, 5, 'chicken and waffles', 'chicken with waffles', 51, false);
insert into MenuItem (item_id, menu_id, food_category_id, item_name, item_description, price, availability) values (10, 2, 1, 'french toast', 'toast but french', 94, true);

create table DriverRating (
	rating_id INT AUTO_INCREMENT PRIMARY KEY,
	driver_id INT NOT NULL,
	cust_id INT NOT NULL,
	score INT NOT NULL,
	FOREIGN KEY (driver_id) REFERENCES DeliveryDriver(driver_id),
	FOREIGN KEY (cust_id) REFERENCES Customer(customer_id),
	CHECK (1 <= score <= 5)
);
insert into DriverRating (rating_id, driver_id, cust_id, score) values (1, 10, 10, 3);
insert into DriverRating (rating_id, driver_id, cust_id, score) values (2, 1, 1, 5);
insert into DriverRating (rating_id, driver_id, cust_id, score) values (3, 10, 1, 4);
insert into DriverRating (rating_id, driver_id, cust_id, score) values (4, 9, 8, 3);
insert into DriverRating (rating_id, driver_id, cust_id, score) values (5, 8, 6, 2);
insert into DriverRating (rating_id, driver_id, cust_id, score) values (6, 8, 10, 4);
insert into DriverRating (rating_id, driver_id, cust_id, score) values (7, 8, 8, 5);
insert into DriverRating (rating_id, driver_id, cust_id, score) values (8, 9, 8, 2);
insert into DriverRating (rating_id, driver_id, cust_id, score) values (9, 6, 9, 1);
insert into DriverRating (rating_id, driver_id, cust_id, score) values (10, 3, 7, 1);

create table RestaurantRating (
	rating_id INT PRIMARY KEY,
	rest_id INT NOT NULL,
	cust_id INT NOT NULL,
	score INT NOT NULL,
	FOREIGN KEY (rest_id) REFERENCES Restaurant(rest_id),
	FOREIGN KEY (cust_id) REFERENCES Customer(customer_id),
	CHECK (1 <= score <= 5)
);
insert into RestaurantRating (rating_id, rest_id, cust_id, score) values (1, 4, 2, 3);
insert into RestaurantRating (rating_id, rest_id, cust_id, score) values (2, 9, 5, 3);
insert into RestaurantRating (rating_id, rest_id, cust_id, score) values (3, 7, 3, 3);
insert into RestaurantRating (rating_id, rest_id, cust_id, score) values (4, 6, 3, 4);
insert into RestaurantRating (rating_id, rest_id, cust_id, score) values (5, 6, 3, 5);
insert into RestaurantRating (rating_id, rest_id, cust_id, score) values (6, 7, 5, 3);
insert into RestaurantRating (rating_id, rest_id, cust_id, score) values (7, 4, 4, 1);
insert into RestaurantRating (rating_id, rest_id, cust_id, score) values (8, 5, 5, 4);
insert into RestaurantRating (rating_id, rest_id, cust_id, score) values (9, 4, 9, 4);
insert into RestaurantRating (rating_id, rest_id, cust_id, score) values (10, 9, 1, 5);





create table OrderLine (
	order_line_id INT PRIMARY KEY,
	order_id INT NOT NULL,
	menu_item_id INT NOT NULL,
	item_price DECIMAL(5,2) NOT NULL,
	quantity INT NOT NULL,
	FOREIGN KEY (order_id) REFERENCES FoodOrder(order_id),
	FOREIGN KEY (menu_item_id) REFERENCES MenuItem(item_id)
);

insert into OrderLine (order_line_id, order_id, menu_item_id, item_price, quantity) values (1, 1, 1, 5.23, 1);
insert into OrderLine (order_line_id, order_id, menu_item_id, item_price, quantity) values (2, 2, 2, 73.43, 2);
insert into OrderLine (order_line_id, order_id, menu_item_id, item_price, quantity) values (3, 3, 3, 81.76, 3);
insert into OrderLine (order_line_id, order_id, menu_item_id, item_price, quantity) values (4, 4, 4, 54.98, 4);
insert into OrderLine (order_line_id, order_id, menu_item_id, item_price, quantity) values (5, 5, 5, 60.77, 5);
insert into OrderLine (order_line_id, order_id, menu_item_id, item_price, quantity) values (6, 6, 6, 22.32, 6);
insert into OrderLine (order_line_id, order_id, menu_item_id, item_price, quantity) values (7, 7, 7, 36.15, 7);
insert into OrderLine (order_line_id, order_id, menu_item_id, item_price, quantity) values (8, 8, 8, 68.74, 8);
insert into OrderLine (order_line_id, order_id, menu_item_id, item_price, quantity) values (9, 9, 9, 84.66, 9);
insert into OrderLine (order_line_id, order_id, menu_item_id, item_price, quantity) values (10, 10, 10.42, 97, 10);


