BEGIN TRANSACTION;

DROP TABLE IF EXISTS users, brewery, address_info, beverage, brewery_beverage, brewery_address_info, rating;
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
  address varchar(300),
  phone_number varchar(20),
  latitude numeric(10,8),
  longitude numeric(10,8),
  CONSTRAINT PK_address_info PRIMARY KEY (address_id)
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

CREATE TABLE rating (
	rating_id serial,
	rating_text VarChar (500) NOT NULL,
	rating int NOT NULL CHECK (rating <=5),
	rating_date date,
	rating_type varchar(25),
	beverage_id int CONSTRAINT fk_beverage REFERENCES beverage(beverage_id),
	brewery_id int CONSTRAINT fk_brewery REFERENCES brewery(brewery_id),
    reviewer_id int CONSTRAINT fk_users REFERENCES users(user_id),
    CONSTRAINT PK_rating PRIMARY KEY (rating_id)
);




INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username, password_hash, role)
VALUES ('testBrewer', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'ROLE_BREWER');

INSERT INTO brewery (name, description, outdoor_seating, pet_friendly, serves_food, on_site_brewing, brewer_id)
VALUES ('Antiques On High', 'As the sister brewery to Seventh Son Brewing, AoH focuses on the production of sour and wild beers as well as hazy hop-forward IPAs and pale ales.', true, false, true, false, 2);
INSERT INTO brewery (name, description, outdoor_seating, pet_friendly, serves_food, on_site_brewing, brewer_id)
VALUES ('Barleys Brewing Company','Barleys Brewing Company is Columbus oldest operating Brewpub. Established in 1992, we offer a variety of award winning ales paired with elevated pub fare', false, false, true, true, 3);
INSERT INTO brewery (name, description, outdoor_seating, pet_friendly, serves_food, on_site_brewing,brewer_id)
VALUES('Brewdog Short North & Kennels', ' Our epic brewery in the USA is not only a brewery and taproom serving up cutting-edge brews, but also home to the world''s first craft beer hotel', true, true, true, false, 3);
INSERT INTO brewery (name, description, outdoor_seating, pet_friendly, serves_food, on_site_brewing, brewer_id)
VALUES('Columbus Brewing Co', 'Columbus Brewing Company is an independent craft brewery dedicated to exploring the flavors of American hops. Best known for Columbus IPA and Bodhi, we also enjoy the subtleties of German-style lagers, the intense characteristics of barrel aged beers and everything in between.', false, false, true, true, 3);
INSERT INTO brewery (name, description, outdoor_seating, pet_friendly, serves_food, on_site_brewing, brewer_id)
VALUES('Derive Brewing company', 'Located in Columbus, Ohio, Derive Brewing Company specializes in small batched hazy IPAs and saisons', true, false, true, false, 3);
INSERT INTO brewery (name, description, outdoor_seating, pet_friendly, serves_food, on_site_brewing, brewer_id)
VALUES('Elevator Brewery and Draught Haus', 'The Elevator Brewery & Draught Haus is a craft bar, micro-brewery, and chef driven restaurant that has been located in one of the most historic buildings, the Columbia building, in downtown Columbus for the last twenty years', false,false, true, false,3);
INSERT INTO brewery (name, description, outdoor_seating, pet_friendly, serves_food, on_site_brewing, brewer_id)
VALUES('Endeavor Brewing Company', 'In 2020 Endeavor became central Ohio’s first Brewstillery. Distilling and aging spirits on site, we released our clear spirits – Rum, Botanical Gin, Dry Gin, and Vodka – in 2020, and our first aged spirits – Cask Rum, Cask Gin, Malt Whisky, and Bourbon – in 2022.', true, false, true, true, 3);
INSERT INTO brewery (name, description, outdoor_seating, pet_friendly, serves_food, on_site_brewing, brewer_id)
VALUES('Hofbrauhaus Columbus', 'At Hofbräuhaus, we’re proud to have continued that tradition through the centuries – from the founding of our original brewery in Munich in 1589, to every Hofbräuhaus location around the world today', true, false, true, false, 3);
INSERT INTO brewery (name, description, outdoor_seating, pet_friendly, serves_food, on_site_brewing, brewer_id)
VALUES('Hoof Hearted Brewing', 'Relaxed brewery for house ales, stouts & elevated American pub fare in an airy, industrial venue.', true, true, true, true, 3);
INSERT INTO brewery (name, description, outdoor_seating, pet_friendly, serves_food, on_site_brewing, brewer_id)
VALUES('Knotty Pine Brewing', 'Casual brewpub serving American fare along with house-brewed beers & handcrafted cocktails',true, false, true, true, 3);
INSERT INTO brewery (name, description, outdoor_seating, pet_friendly, serves_food, on_site_brewing, brewer_id)
VALUES('Land-Grant Brewing Company', 'Production brewery & taproom located downtown in the historic Franklinton neighborhood of Columbus, featuring a sprawling outdoor beer garden and rotating food trucks.', true, true, true, false, 3);
INSERT INTO brewery (name, description, outdoor_seating, pet_friendly, serves_food, on_site_brewing, brewer_id)
VALUES('North High Brewing', 'North High Brewing was founded in 2011 by a couple of guys who were passionate about great beer and fun times, and we opened our doors here in 2012 as just the 7th brewery in Central Ohio', true, false, true, false, 3);
INSERT INTO brewery (name, description, outdoor_seating, pet_friendly, serves_food, on_site_brewing, brewer_id)
VALUES('Pretentious Barrel House','Established in October of 2017, Pretentious is the first brewery in Columbus to specialize exclusively in barrel-aged sour ales.', true, true, false, true,3);
INSERT INTO brewery (name, description, outdoor_seating, pet_friendly, serves_food, on_site_brewing, brewer_id)
VALUES('Random Precision Brewing Company', 'An all wild and sour brewery with an open and inviting taproom', false, true, false, false, 3);
INSERT INTO brewery (name, description, outdoor_seating, pet_friendly, serves_food, on_site_brewing, brewer_id)
VALUES('Seventh Son Brewing Co', 'Seventh Son Brewing has been producing exceptional beers at the intersection of 4th & 4th in Columbus’ historic Italian Village since April of 2013.', true, false, true, false, 3);
INSERT INTO brewery (name, description, outdoor_seating, pet_friendly, serves_food, on_site_brewing, brewer_id)
VALUES('Sideswipe Brewing', 'After years of home brewing not yet famous Craig opened Sideswipe Brewing in 2013 to share his passion for brewing and naming this marvelous venture Sideswipe', true, true, false, false, 3);
INSERT INTO brewery (name, description, outdoor_seating, pet_friendly, serves_food, on_site_brewing, brewer_id)
VALUES('Smokehouse Brewing', 'Smokehouse Brewing Company is a community place where one feels at home, no matter where home happens to be.', true, false, true, true, 3);
INSERT INTO brewery (name, description, outdoor_seating, pet_friendly, serves_food, on_site_brewing, brewer_id)
VALUES('Spires Social Brewing Co.', 'Family owned craft brewery with on-site production, taproom, full bar, featuring craft beer and soda.', true, true, false, false, 3);
INSERT INTO brewery (name, description, outdoor_seating, pet_friendly, serves_food, on_site_brewing, brewer_id)
VALUES('Wolfs Ridge Brewing', 'Established in 2013, Wolf’s Ridge has grown into one of Columbus’ premier dining and drinking destinations, winning numerous local and national awards for their food and drink programs that have become synonymous with quality, inventiveness, and approachability.', true, false, true, false, 3);
INSERT INTO brewery (name, description, outdoor_seating, pet_friendly, serves_food, on_site_brewing, brewer_id)
VALUES ('Zaftig Brewing Co.', 'Established in 2013, Zaftig Brewing Company is Worthington''s only craft brewery, offering an extensive array of selections. Well-known in Columbus for our high-gravity, full-bodied ales, we aren''t afraid to push the boundaries of what great craft beer can be.', true, false, true, false, 3);


INSERT INTO address_info (address, phone_number, latitude, longitude)
VALUES('714 S High St', '614-725-2070', 39.9476, -82.99774);
INSERT INTO address_info (address, phone_number, latitude, longitude)
VALUES('467 N High St', '614-228-2537', 39.9719408, -83.0027669);
INSERT INTO address_info (address, phone_number, latitude, longitude)
VALUES('1175 N High S', '614-908-3053', 39.98637, -83.00579);
INSERT INTO address_info (address, phone_number, latitude, longitude)
VALUES('2555 Harrison Rd', '614-224-3626', 39.9675898, -83.0692897);
INSERT INTO address_info (address, phone_number, latitude, longitude)
VALUES('2808 N. High St', '614-732-4186', 40.01939, -83.01185);
INSERT INTO address_info (address, phone_number, latitude, longitude)
VALUES('161 N High St', '614-228-0500', 39.9656697, -83.0017892);
INSERT INTO address_info (address, phone_number, latitude, longitude)
VALUES('909 W 5th Ave', '614-456-7074', 39.988002, -83.030429);
INSERT INTO address_info (address, phone_number, latitude, longitude)
VALUES('800 Goodale Blvd', '614-294-2437', 39.974313, -83.025737);
INSERT INTO address_info (address, phone_number, latitude, longitude)
VALUES('850 N 4th St', '614-104-4033', 39.9803665, -83.0002482);
INSERT INTO address_info (address, phone_number, latitude, longitude)
VALUES('1765 W 3rd Ave', '614-817-1515', 39.9852813, -83.0529324);
INSERT INTO address_info (address, phone_number, latitude, longitude)
VALUES('424 W Town St', '216-956-2634', 39.95787195, -83.01150763);
INSERT INTO address_info (address, phone_number, latitude, longitude)
VALUES('1125 Cleveland Ave', '614-226-3244', 39.992787, -82.982658);
INSERT INTO address_info (address, phone_number, latitude, longitude)
VALUES('745 Taylor Ave', '614-887-7687', 39.981855, -82.960769);
INSERT INTO address_info (address, phone_number, latitude, longitude)
VALUES('2365 W Dublin Granville Rd', '614-389-3864', 40.090144, -83.05232);
INSERT INTO address_info (address, phone_number, latitude, longitude)
VALUES('1101 N 4th St', '614-817-1515', 39.985351, -83.0019404);
INSERT INTO address_info (address, phone_number, latitude, longitude)
VALUES('2419 Scioto Harper Dr', '614-719-9654', 39.96723751, -83.06626767);
INSERT INTO address_info (address, phone_number, latitude, longitude)
VALUES('1130 Dublin Rd', '614-485-0227', 39.973715, -83.047935);
INSERT INTO address_info (address, phone_number, latitude, longitude)
VALUES('8757 Sancus Blvd', '614-485-0227', 40.1473396, -83.004836);
INSERT INTO address_info (address, phone_number, latitude, longitude)
VALUES('215 N 4th St', '614-429-3936', 39.9577586, -82.99517953);
INSERT INTO address_info (address, phone_number, latitude, longitude)
VALUES('7020 Huntley Rd Ste A', '614-636-2537', 40.1063329, -83.0003532);

INSERT INTO brewery_address_info (brewery_id, address_id)
VALUES(1,1);
INSERT INTO brewery_address_info (brewery_id, address_id)
VALUES(2,2);
INSERT INTO brewery_address_info (brewery_id, address_id)
VALUES(3,3);
INSERT INTO brewery_address_info (brewery_id, address_id)
VALUES(4,4);
INSERT INTO brewery_address_info (brewery_id, address_id)
VALUES(5,5);
INSERT INTO brewery_address_info (brewery_id, address_id)
VALUES(6,6);
INSERT INTO brewery_address_info (brewery_id, address_id)
VALUES(7,7);
INSERT INTO brewery_address_info (brewery_id, address_id)
VALUES(8,8);
INSERT INTO brewery_address_info (brewery_id, address_id)
VALUES(9,9);
INSERT INTO brewery_address_info (brewery_id, address_id)
VALUES(10,10);
INSERT INTO brewery_address_info (brewery_id, address_id)
VALUES(11,11);
INSERT INTO brewery_address_info (brewery_id, address_id)
VALUES(12,12);
INSERT INTO brewery_address_info (brewery_id, address_id)
VALUES(13,13);
INSERT INTO brewery_address_info (brewery_id, address_id)
VALUES(14,14);
INSERT INTO brewery_address_info (brewery_id, address_id)
VALUES(15,15);
INSERT INTO brewery_address_info (brewery_id, address_id)
VALUES(16,16);
INSERT INTO brewery_address_info (brewery_id, address_id)
VALUES(17,17);
INSERT INTO brewery_address_info (brewery_id, address_id)
VALUES(18,18);
INSERT INTO brewery_address_info (brewery_id, address_id)
VALUES(19,19);
INSERT INTO brewery_address_info (brewery_id, address_id)
VALUES(20,20);

INSERT INTO beverage (beverage_name, description, image_url, abv, beverage_type, ibu, availability) VALUES ('Bud Light', 'gross', 'image', 4.00, 'Beer', 5, true);
INSERT INTO beverage (beverage_name, description, image_url, abv, beverage_type, ibu, availability) VALUES ('Corona', 'not gross', 'image', 6.00, 'Beer', 3, true);
INSERT INTO beverage (beverage_name, description, image_url, abv, beverage_type, ibu, availability) VALUES ('Angry Orchard', 'cidery', 'image', 3.00, 'Cider', 2, true);

-- INSERT INTO brewery (name, description, outdoor_seating, pet_friendly, serves_food, on_site_brewing, brewer_id) VALUES ('Brewery1', 'A brewery', true, true, true, true, 2);
-- INSERT INTO brewery (name, description, outdoor_seating, pet_friendly, serves_food, on_site_brewing, brewer_id) VALUES ('Brewery2', 'A 2nd brewery', true, false, true, false, 1);
-- INSERT INTO brewery (name, description, outdoor_seating, pet_friendly, serves_food, on_site_brewing, brewer_id) VALUES ('Brewery1', 'A 3rd brewery', false, true, false, true, 3);

INSERT INTO brewery_beverage (beverage_id, brewery_id) VALUES (1, 1);
INSERT INTO brewery_beverage (beverage_id, brewery_id) VALUES (1, 2);
INSERT INTO brewery_beverage (beverage_id, brewery_id) VALUES (1, 3);

INSERT INTO brewery_beverage (beverage_id, brewery_id) VALUES (2, 1);
INSERT INTO brewery_beverage (beverage_id, brewery_id) VALUES (2, 2);

INSERT INTO brewery_beverage (beverage_id, brewery_id) VALUES (3, 1);
INSERT INTO brewery_beverage (beverage_id, brewery_id) VALUES (3, 3);

-- INSERT INTO brewery_beverage (beverage_id, brewery_id) VALUES (1, 21);
-- INSERT INTO brewery_beverage (beverage_id, brewery_id) VALUES (2, 21);
-- INSERT INTO brewery_beverage (beverage_id, brewery_id) VALUES (3, 21);


COMMIT TRANSACTION;
