BEGIN TRANSACTION;

DROP TABLE IF EXISTS users, brewery, address_info, beverage, brewery_beverage, brewery_address_info, rating;
DROP SEQUENCE IF EXISTS seq_user_id, seq_rating_id;

CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;


CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE brewery (
    brewery_id serial,
    name varchar(75) NOT NULL,
    description varchar(300),
    outdoor_seating bool NOT NULL,
    pet_friendly bool NOT NULL,
    serves_food bool NOT NULL,
    on_site_brewing bool NOT NULL,
    brewer_id int,
    CONSTRAINT PK_brewery PRIMARY KEY (brewery_id),
    CONSTRAINT FK_brewery_brewer_id FOREIGN KEY (brewer_id) REFERENCES users(user_id)
);

CREATE TABLE address_info (
  address_id serial,
  city_name varchar(30) NOT NULL,
  zip_code int NOT NULL,
  state_name varchar(30) NOT NULL,
  street_name varchar(30) NOT NULL,
  street_number int NOT NULL,
  phone_number varchar(20),
  CONSTRAINT PK_address_info PRIMARY KEY (address_id),
  CONSTRAINT UQ_state_name UNIQUE (state_name)
);

CREATE TABLE beverage (
    beverage_id serial,
    beverage_name varchar(30) NOT NULL,
    description varchar(250),
    image_url varchar(150),
    abv numeric(5,2) NOT NULL,
    beverage_type varchar(30) NOT NULL,
    ibu int,
    availability bool,
    CONSTRAINT PK_beverage PRIMARY KEY (beverage_id)
);

CREATE TABLE brewery_beverage (
    beverage_id int,
    brewery_id int,
    CONSTRAINT FK_brewery_beverage_brewery FOREIGN KEY (brewery_id) REFERENCES brewery(brewery_id),
    CONSTRAINT FK_brewery_beverage_beverage FOREIGN KEY (beverage_id) REFERENCES beverage(beverage_id)
);

CREATE TABLE brewery_address_info (
    brewery_id int,
    address_id int,
    CONSTRAINT FK_brewery_address_info_brewery FOREIGN KEY (brewery_id) REFERENCES brewery(brewery_id),
    CONSTRAINT FK_brewery_address_info_address FOREIGN KEY (address_id) REFERENCES address_info(address_id)
);
CREATE SEQUENCE seq_rating_id
 INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
CREATE TABLE rating(
	rating_id serial,
	rating_text VarChar (500) NOT NULL,
	rating int NOT NULL CHECK (rating <=5),
	rating_date date,
	rating_type varchar(25),
	beverage_id int CONSTRAINT fk_beverage REFERENCES beverage(beverage_id) NOT NULL,
	brewery_id int CONSTRAINT fk_brewery REFERENCES brewery(brewery_id) NOT NULL,
    reviewer_id int CONSTRAINT fk_users REFERENCES users(user_id)
);
	
	


)
	


INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username, password_hash, role)
VALUES ('testBrewer', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'ROLE_BREWER');


INSERT INTO beverage (beverage_name, description, image_url, abv, beverage_type, ibu, availability) VALUES ('Bud Light', 'gross', 'image', 4.00, 'Beer', 5, true);
INSERT INTO beverage (beverage_name, description, image_url, abv, beverage_type, ibu, availability) VALUES ('Corona', 'not gross', 'image', 6.00, 'Beer', 3, true);
INSERT INTO beverage (beverage_name, description, image_url, abv, beverage_type, ibu, availability) VALUES ('Angry Orchard', 'cidery', 'image', 3.00, 'Cider', 2, true);

INSERT INTO brewery (name, description, outdoor_seating, pet_friendly, serves_food, on_site_brewing, brewer_id) VALUES ('Brewery1', 'A brewery', true, true, true, true, 1);
INSERT INTO brewery (name, description, outdoor_seating, pet_friendly, serves_food, on_site_brewing, brewer_id) VALUES ('Brewery2', 'A 2nd brewery', true, false, true, false, 2);
INSERT INTO brewery (name, description, outdoor_seating, pet_friendly, serves_food, on_site_brewing, brewer_id) VALUES ('Brewery1', 'A 3rd brewery', false, true, false, true, 3);

INSERT INTO brewery_beverage (beverage_id, brewery_id) VALUES (1, 1);
INSERT INTO brewery_beverage (beverage_id, brewery_id) VALUES (1, 2);
INSERT INTO brewery_beverage (beverage_id, brewery_id) VALUES (1, 3);

INSERT INTO brewery_beverage (beverage_id, brewery_id) VALUES (2, 1);
INSERT INTO brewery_beverage (beverage_id, brewery_id) VALUES (2, 2);

INSERT INTO brewery_beverage (beverage_id, brewery_id) VALUES (3, 1);
INSERT INTO brewery_beverage (beverage_id, brewery_id) VALUES (3, 3);


COMMIT TRANSACTION;
