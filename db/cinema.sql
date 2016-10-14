DROP TABLE Tickets;
DROP TABLE Films;
DROP TABLE Customers; 

CREATE TABLE customers (
  id serial4 PRIMARY KEY,
  name VARCHAR(255),
  funds INT3, 
); 

CREATE TABLE films (
  id serial4 PRIMARY KEY, 
  title VARCHAR(255),
  price INT3, 
);

CREATE TABLE tickets (
  id serial4 PRIMARY KEY, 
  customer_id int4 REFERENCES customers(id) ON DELETE CASCADE,
  films_id int4 REFERENCES films(id) ON DELETE CASCADE
);