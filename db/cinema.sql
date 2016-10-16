DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS films;
DROP TABLE IF EXISTS customers; 

CREATE TABLE customers (
  id serial4 PRIMARY KEY,
  name VARCHAR(255),
  funds INT2
); 

CREATE TABLE films (
  id serial4 PRIMARY KEY, 
  title VARCHAR(255),
  price INT2
);

CREATE TABLE tickets (
  id serial4 PRIMARY KEY, 
  customer_id INT4 REFERENCES customers(id) ON DELETE CASCADE,
  film_id INT4 REFERENCES films(id) ON DELETE CASCADE,
  start_time VARCHAR(255)
);