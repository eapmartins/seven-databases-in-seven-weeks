CREATE TABLE countries (
    code CHAR(2) PRIMARY KEY,
    name TEXT UNIQUE
);

CREATE TABLE cities (
    name TEXT NOT NULL,
    postal_code VARCHAR(9) CHECK (postal_code <> ''),
    country_code CHAR(2) REFERENCES countries,
    PRIMARY KEY (postal_code, country_code)
);

CREATE TABLE venues (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    street_address TEXT,
    type CHAR(7) CHECK (type IN ('public', 'private')) DEFAULT 'public',
    postal_code VARCHAR(9),
    country_code CHAR(2),
    FOREIGN KEY (postal_code, country_code) REFERENCES cities(postal_code, country_code) MATCH FULL
);

CREATE TABLE events (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    starts TIMESTAMP,
    ends TIMESTAMP,
    venue_id INTEGER,
    FOREIGN KEY (venue_id) REFERENCES venues(id)
);