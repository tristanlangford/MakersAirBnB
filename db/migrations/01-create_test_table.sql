CREATE TABLE properties (
    prop_id SERIAL PRIMARY KEY,
    name VARCHAR(60),
    description VARCHAR(150),
    price FLOAT
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    email VARCHAR(40),
    password VARCHAR(150),
);

CREATE TABLE bookings (
    booking_id SERIAL PRIMARY KEY,
    start_date VARCHAR(15),
    end_date VARCHAR(15),
    comments VARCHAR(100),
    booker_id INTEGER,
    property_id INTEGER,
    confirmation CHAR DEFAULT 'n',
    FOREIGN KEY (booker_id) REFERENCES users(user_id),
    FOREIGN KEY (property_id) REFERENCES properties(prop_id)
);

CREATE TABLE avaiable_dates (
    date_id SERIAL PRIMARY KEY,
    start_date VARCHAR(15),
    end_date VARCHAR(15),
    property_id INTEGER,
    FOREIGN KEY (property_id) REFERENCES properties(prop_id)
);
