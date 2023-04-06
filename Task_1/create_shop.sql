CREATE TABLE IF NOT EXISTS clients(
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	lastname TEXT NOT NULL,
	phone TEXT NOT NULL,
	email TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS orders(
	id SERIAL PRIMARY KEY,
	client_id INT REFERENCES clients(id) NOT NULL,
	is_payed BOOL DEFAULT FALSE
);
CREATE TABLE IF NOT EXISTS goods(
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	description TEXT NOT NULL,
	buy_price REAL NOT NULL,
	margin REAL NOT NULL,
	amount INT NOT NULL
);
CREATE TABLE IF NOT EXISTS order_good(
	order_id INT REFERENCES orders(id),
	good_id INT REFERENCES goods(id),
	buy_amount INT NOT NULL,
	sell_price REAL NOT NULL,
	PRIMARY KEY(order_id, good_id)
);
CREATE TABLE IF NOT EXISTS category(
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS good_category(
	good_id INT REFERENCES goods(id),
	category_id INT REFERENCES category(id),
	PRIMARY KEY(good_id, category_id)
);