BEGIN TRANSACTION;

DROP TABLE IF EXISTS users, brewery, address_info, beverage, brewery_beverage, brewery_address_info;
DROP SEQUENCE IF EXISTS seq_user_id;

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

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username, password_hash, role)
VALUES ('testBrewer', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'ROLE_BREWER');



COMMIT TRANSACTION;
