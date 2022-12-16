CREATE TABLE IF NOT EXISTS clients(
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	lastname TEXT NOT NULL,
	phone TEXT NOT NULL,
	email TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS tours(
	id SERIAL PRIMARY KEY,
	title TEXT NOT NULL,
	description TEXT NOT NULL,
	price REAL NOT NULL
);
CREATE TABLE IF NOT EXISTS contracts(
	id SERIAL PRIMARY KEY,
	client_id INT REFERENCES clients(id),
	tour_id INT REFERENCES tours(id),
	contract_price REAL NOT NULL,
	is_payed BOOL DEFAULT FALSE
);
CREATE TABLE IF NOT EXISTS excursions(
	id SERIAL PRIMARY KEY,
	title TEXT NOT NULL,
	details TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS tour_excursion(
	tour_id INT REFERENCES tours(id),
	excursion_id INT REFERENCES excursions(id),
	PRIMARY KEY(tour_id, excursion_id)
);
CREATE TABLE IF NOT EXISTS optional_services(
	id SERIAL PRIMARY KEY,
	title TEXT NOT NULL,
	price REAL NOT NULL
);
CREATE TABLE IF NOT EXISTS tour_service(
	tour_id INT REFERENCES tours(id),
	service_id INT REFERENCEs optional_services(id),
	PRIMARY KEY(tour_id, service_id)
);