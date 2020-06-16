CREATE TABLE properties (
    prop_id SERIAL PRIMARY KEY,
    name VARCHAR(60),
    description VARCHAR(150),
    price FLOAT
);

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    email VARCHAR(40),
    password VARCHAR(40)
);