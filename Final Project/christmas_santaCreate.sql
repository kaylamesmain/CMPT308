-------------------------------Drop Database if Already Exists----------------------------
DROP DATABASE christmas_santa;
---------------------------------------Create Database------------------------------------
CREATE DATABASE christmas_santa;
---------------------------------------Database Backup------------------------------------
--------------------------Create Sequence's--------------------------
CREATE SEQUENCE addresses_address_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 325936
  CACHE 1;

CREATE SEQUENCE delivered_gift_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;

CREATE SEQUENCE delivered_lead_reindeer_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;

CREATE SEQUENCE departments_department_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 382145
  CACHE 1;

CREATE SEQUENCE factories_factory_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 663534
  CACHE 1;

CREATE SEQUENCE gifts_elf_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;

CREATE SEQUENCE gifts_gift_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 273855
  CACHE 1;

CREATE SEQUENCE gifts_item_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;

CREATE SEQUENCE gifts_kid_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;

CREATE SEQUENCE gifts_wrapping_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;

CREATE SEQUENCE head_elves_elf_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;

CREATE SEQUENCE inventory_factory_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;

CREATE SEQUENCE inventory_item_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 514413
  CACHE 1;

CREATE SEQUENCE kid_logs_kid_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;

CREATE SEQUENCE kid_logs_log_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 13
  CACHE 1;

CREATE SEQUENCE kids_address_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;

CREATE SEQUENCE kids_kid_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 447966
  CACHE 1;

CREATE SEQUENCE letters_kid_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;

CREATE SEQUENCE letters_letter_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 665621
  CACHE 1;

CREATE SEQUENCE reindeer_reindeer_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 178641
  CACHE 1;

CREATE SEQUENCE staff_department_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;

CREATE SEQUENCE staff_elf_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 100199
  CACHE 1;

CREATE SEQUENCE wrapping_schemes_wrapping_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 890075
  CACHE 1;

--------------------------Create Tables--------------------------

------------addresses Table
CREATE TABLE addresses
(
  address_id integer NOT NULL DEFAULT nextval('addresses_address_id_seq'::regclass),
  street_address text NOT NULL,
  city text,
  region text,
  postal_code text,
  country text NOT NULL,
  CONSTRAINT addresses_pkey PRIMARY KEY (address_id)
);


------------delivered Table
CREATE TABLE delivered
(
  gift_id integer NOT NULL DEFAULT nextval('delivered_gift_id_seq'::regclass),
  lead_reindeer integer NOT NULL DEFAULT nextval('delivered_lead_reindeer_seq'::regclass),
  time_delivered timestamp with time zone NOT NULL,
  CONSTRAINT delivered_pkey PRIMARY KEY (gift_id)
);


------------departments Table
CREATE TABLE departments
(
  department_id integer NOT NULL DEFAULT nextval('departments_department_id_seq'::regclass),
  department_name text,
  CONSTRAINT departments_pkey PRIMARY KEY (department_id)
);

------------factories Table
CREATE TABLE factories
(
  factory_id integer NOT NULL DEFAULT nextval('factories_factory_id_seq'::regclass),
  factory_name text,
  speciality text,
  CONSTRAINT factories_pkey PRIMARY KEY (factory_id)
);


------------gifts Table
CREATE TABLE gifts
(
  gift_id integer NOT NULL DEFAULT nextval('gifts_gift_id_seq'::regclass),
  kid_id integer NOT NULL DEFAULT nextval('gifts_kid_id_seq'::regclass),
  item_id integer NOT NULL DEFAULT nextval('gifts_item_id_seq'::regclass),
  elf_id integer NOT NULL DEFAULT nextval('gifts_elf_id_seq'::regclass),
  wrapping_id integer NOT NULL DEFAULT nextval('gifts_wrapping_id_seq'::regclass),
  date_packaged date,
  eta date,
  CONSTRAINT gifts_pkey PRIMARY KEY (gift_id),
  CONSTRAINT gifts_check CHECK (date_packaged <= eta)
);


------------head_elves Table
CREATE TABLE head_elves
(
  elf_id integer NOT NULL DEFAULT nextval('head_elves_elf_id_seq'::regclass),
  title text,
  promotion_date timestamp without time zone,
  CONSTRAINT head_elves_pkey PRIMARY KEY (elf_id)
);


------------inventory Table
CREATE TABLE inventory
(
  item_id integer NOT NULL DEFAULT nextval('inventory_item_id_seq'::regclass),
  factory_id integer NOT NULL DEFAULT nextval('inventory_factory_id_seq'::regclass),
  item_name text,
  item_description text,
  item_weight_lbs integer,
  CONSTRAINT inventory_pkey PRIMARY KEY (item_id)
);


------------kid_logs Table
CREATE TABLE kid_logs
(
  log_id integer NOT NULL DEFAULT nextval('kid_logs_log_id_seq'::regclass),
  kid_id integer NOT NULL DEFAULT nextval('kid_logs_kid_id_seq'::regclass),
  changed_to text NOT NULL,
  changed_on timestamp without time zone NOT NULL,
  CONSTRAINT kid_logs_pkey PRIMARY KEY (log_id)
);


------------kids Table
CREATE TABLE kids
(
  kid_id integer NOT NULL DEFAULT nextval('kids_kid_id_seq'::regclass),
  address_id integer NOT NULL DEFAULT nextval('kids_address_id_seq'::regclass),
  first_name text,
  last_name text,
  gender text,
  age integer,
  verdict text,
  CONSTRAINT kids_pkey PRIMARY KEY (kid_id),
  CONSTRAINT kids_age_check CHECK (age < 22),
  CONSTRAINT kids_verdict_check CHECK (verdict = 'Naughty'::text OR verdict = 'Nice'::text)
);


------------letters Table
CREATE TABLE letters
(
  kid_id integer NOT NULL DEFAULT nextval('letters_kid_id_seq'::regclass),
  letter_id integer NOT NULL DEFAULT nextval('letters_letter_id_seq'::regclass),
  date_delivered date NOT NULL,
  date_received date,
  wishes text,
  CONSTRAINT letters_pkey PRIMARY KEY (kid_id, letter_id),
  CONSTRAINT letters_check CHECK (date_delivered < date_received)
);


------------reindeer Table
CREATE TABLE reindeer
(
  reindeer_id integer NOT NULL DEFAULT nextval('reindeer_reindeer_id_seq'::regclass),
  reindeer_name text,
  special_skills text,
  CONSTRAINT reindeer_pkey PRIMARY KEY (reindeer_id)
);


------------staff Table
CREATE TABLE staff
(
  elf_id integer NOT NULL DEFAULT nextval('staff_elf_id_seq'::regclass),
  department_id integer NOT NULL DEFAULT nextval('staff_department_id_seq'::regclass),
  first_name text,
  last_name text,
  age integer,
  hire_date date,
  hourly_rate money,
  CONSTRAINT staff_pkey PRIMARY KEY (elf_id)
);


------------wrapping_schemes Table
CREATE TABLE wrapping_schemes
(
  wrapping_id integer NOT NULL DEFAULT nextval('wrapping_schemes_wrapping_id_seq'::regclass),
  wrapping_color text,
  wrapping_pattern text,
  ribbon_color text,
  box_size text,
  CONSTRAINT wrapping_schemes_pkey PRIMARY KEY (wrapping_id)
);

  --------------------------Re-Start Sequences--------------------------

  ALTER SEQUENCE factories_factory_id_seq RESTART WITH 663522;
  ALTER SEQUENCE kids_kid_id_seq RESTART WITH 447766;
  ALTER SEQUENCE addresses_address_id_seq RESTART WITH 325837;
  ALTER SEQUENCE letters_letter_id_seq RESTART WITH 665522;
  ALTER SEQUENCE gifts_gift_id_seq RESTART WITH 273756;
  ALTER SEQUENCE wrapping_schemes_wrapping_id_seq RESTART WITH 889976;
  ALTER SEQUENCE inventory_item_id_seq RESTART WITH 514388;
  ALTER SEQUENCE staff_elf_id_seq RESTART WITH 100000;
  ALTER SEQUENCE departments_department_id_seq RESTART WITH 382133;
  ALTER SEQUENCE reindeer_reindeer_id_seq RESTART WITH 178633;

--------------------------Table Values--------------------------

------------addresses Table
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('887-5208 Dolor, St.','Anjou','Quebec','44039-585','Madagascar');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 220, 3758 Libero. Avenue','Segni','Lazio','37635','Hungary');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 214, 2825 Integer St.','Carapicuíba','São Paulo','43703','Mayotte');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('5655 Ac Av.','Elgin','Morayshire','13645','Belarus');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('Ap #434-3217 Id, St.','Teruel','Aragón','WU3Z 7CP','Poland');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 688, 1947 Eget Avenue','Rzeszów','PK','24599','Aruba');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('192-277 Semper Rd.','El Tabo','V','08-896','United Kingdom (Great Britain)');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('Ap #898-814 Dapibus St.','Pointe-Claire','Quebec','30308','Christmas Island');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 740, 1621 Sed Rd.','Morwell','VIC','A21 8NW','Kyrgyzstan');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('Ap #680-6434 Pellentesque. Ave','Portland','Maine','2801','South Sudan');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('Ap #525-4917 Ac Av.','King Township','Ontario','8342','Burkina Faso');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 396, 3918 Quam. Street','Maringá','PR','41912','Zimbabwe');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('6216 Pellentesque St.','Liverpool','New South Wales','99481','Tanzania');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 128, 852 Metus Ave','Crato','Ceará','722979','Turkey');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('Ap #360-6200 Aliquam Road','Hamburg','HH','S0T 3VJ','Bhutan');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('4003 Dis Rd.','Port Hope','Ontario','60425','Suriname');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('3509 Ullamcorper Avenue','Belfast','Ulster','25728','Nicaragua');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 802, 7488 Ut St.','Reading','PA','44815','Andorra');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('722-5908 Imperdiet, Road','Jacksonville','Florida','52268','South Sudan');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 480, 8745 Fusce Rd.','Forge-Philippe','HE','10145','Netherlands');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('Ap #967-6912 Tincidunt Street','Baisy-Thy','Waals-Brabant','7218','Saint Kitts and Nevis');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 807, 9963 Non, Avenue','Port Hope','Ontario','8197','Lithuania');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 454, 4347 Ipsum Street','Rennes','Bretagne','7775 YQ','Lesotho');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('278-9563 Pellentesque. Road','Mariquina','Los Ríos','4753','Angola');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('3359 Erat. Ave','Tarragona','CA','8829 HA','Virgin Islands, United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 274, 3042 Non, St.','Whitehorse','YK','5882 LH','Trinidad and Tobago');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('843-7100 Nulla Rd.','Hamburg','Hamburg','H4P 6E9','Christmas Island');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('Ap #914-2060 Tincidunt Street','Dover','DE','1998','British Indian Ocean Territory');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('Ap #207-620 Laoreet Ave','Vienna','Vienna','56443','Myanmar');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('3589 Dolor St.','Caplan','QC','34126','Philippines');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('239-7899 Enim, Ave','Malegaon','Maharastra','1822','Uzbekistan');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('6516 Fringilla Avenue','Portland','Maine','875391','Italy');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 613, 3803 Eu Av.','Gliwice','Sląskie','LH57 9EC','Sri Lanka');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('Ap #218-2780 Facilisis St.','Idaho Falls','Idaho','71626','Liberia');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('917 Etiam Av.','Hamburg','Hamburg','50417','French Southern Territories');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('367-1426 Eu St.','San Pablo','Heredia','8114','Saint Kitts and Nevis');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('Ap #666-5906 Aliquet. Rd.','San Diego','CA','08933','Belgium');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 210, 1291 Phasellus Avenue','Didim','Aydın','64-152','Ukraine');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('Ap #204-3877 Sem Ave','King Township','Ontario','SK05 0IE','Burkina Faso');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('Ap #940-6538 Turpis Avenue','Vanier','Ontario','8711 ZI','Djibouti');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('Ap #449-2200 In Street','Balfour','Orkney','62543','Hungary');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('507-8636 Odio Avenue','Cumberland','Ontario','25-670','Malawi');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('212-9162 Nullam Rd.','Eisden','L.','4101','Saint Barthélemy');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 932, 5676 Nunc Av.','Zaltbommel','Gelderland','07642','Iraq');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('1985 Sem Rd.','Nadiad','GJ','CM5 0CF','Mali');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('Ap #888-7487 Elit, Street','Duns','BE','9349','Dominica');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('Ap #821-3859 Sed Road','Kailua','HI','2485','New Zealand');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('Ap #457-5986 Et Ave','Juazeiro','BA','20199','Tonga');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 687, 6849 Orci, St.','Berlin','BE','2947','Guinea');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 619, 4519 Quis Street','Fermont','Quebec','863420','Lesotho');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('735-1151 Nec, Road','Laren','Noord Holland','3853 EM','Netherlands');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 356, 7591 Sapien. Ave','Dordrecht','Zuid Holland','85943','Guyana');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('7894 Elit, Rd.','Dublin','L','79852-752','Saint Pierre and Miquelon');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('5598 Ornare St.','Brest','BR','823487','Singapore');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('922-1025 Ligula. Street','Ankara','Ankara','6052','Western Sahara');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('889-9240 In Avenue','Mysore','Karnataka','10482','Guernsey');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('792-8224 Eget Av.','Vienna','Vienna','G6Z 3JX','Saint Pierre and Miquelon');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('223-4841 Ante Ave','Feilding','NI','29208','Ghana');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('Ap #335-5282 Hendrerit Rd.','Hamburg','Hamburg','225270','Canada');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 414, 2449 Cursus St.','Jaipur','RJ','3062','Burkina Faso');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('888-9380 Donec Ave','West Valley City','UT','57284','Azerbaijan');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('166-1823 Fusce Street','Ulloa (Barrial)','Heredia','02607','Curaçao');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('245-9829 Erat Street','Lleida','CA','05697','Nauru');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('Ap #613-8599 Duis Street','Carapicuíba','São Paulo','7951','Angola');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('1249 Proin Av.','Castres','MI','27994','Saint Pierre and Miquelon');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('Ap #536-3739 Arcu Street','São João de Meriti','Rio de Janeiro','09-123','Tokelau');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('525-3089 Vitae Av.','Diadema','São Paulo','77702','Benin');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('448-910 Amet Road','Fontaine-Valmont','Henegouwen','59204','Hungary');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('831-9755 Maecenas St.','Saint-Malo','BR','41908','San Marino');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('493-7916 Ultrices. St.','Cincinnati','Ohio','4114','Tanzania');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 528, 4795 Nec St.','Tilburg','N.','55562','Thailand');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('330-6649 Ligula. Road','Vienna','Wie','1519','Netherlands');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 571, 1177 Non Rd.','Bankura','West Bengal','90309-674','Holy See (Vatican City State)');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('Ap #807-8537 Libero St.','San Pablo','Heredia','96390','Congo (Brazzaville)');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 825, 1086 Molestie Avenue','Thorold','ON','41814','Albania');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('852-7452 Cras Road','Neder-Over-Heembeek','BU','49574','Virgin Islands, United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('826-4286 Lacus. Avenue','Cap-de-la-Madeleine','Quebec','41511','Tokelau');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 611, 6785 Tempor Av.','Waitakere','NI','48731','Aruba');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 174, 3053 Lobortis Rd.','Norrköping','Östergötlands län','3879','Guernsey');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('229-8488 Et St.','King''s Lynn','NF','84175','Pitcairn Islands');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 478, 8215 Mauris Road','Bear','Delaware','J7N 3Y6','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 809, 5356 Fusce Rd.','Waiheke Island','North Island','5914','Guinea');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('335-9436 Velit. St.','Pietrasanta','Toscana','41905','Mauritania');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 568, 8494 Taciti Avenue','Parramatta','NSW','4229','Puerto Rico');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('Ap #536-8058 Magnis Road','Lagos','LA','C3 1CC','Libya');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 412, 6940 Aliquam, St.','Strongoli','Calabria','9154','United Arab Emirates');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('Ap #209-9757 Egestas. St.','Wommelgem','AN','41021','Argentina');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 586, 4526 Lacus. Rd.','Clermont-Ferrand','AU','03082','Marshall Islands');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('Ap #767-9644 Sed Ave','Timaru','South Island','07834','Tanzania');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('167-7574 Non Avenue','Purmerend','Noord Holland','2527','South Georgia and The South Sandwich Islands');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('480-8076 Mi Rd.','Hamburg','HH','4074','Tunisia');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('Ap #773-7824 Sodales Rd.','Tiltil','RM','87523','Ukraine');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('703-4113 Donec Ave','Covington','Kentucky','65531','Virgin Islands, British');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('6964 Ut, Ave','Aurora','ON','4407','Russian Federation');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('4963 Imperdiet Av.','Lansing','MI','70834','Spain');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('984-190 Aliquet. Av.','Forst','BB','K9S 6A0','Armenia');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 192, 9993 Eu, Av.','Wallasey','Cheshire','BQ97 4ZY','Afghanistan');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 400, 6476 Lectus. Ave','Tauranga','NI','94569','French Guiana');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('599-1443 Dictum St.','Cork','Munster','11019','Venezuela');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('983-8227 Accumsan Street','Dutse','JI','777387','Niger');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('709-5922 Quis, Road','Chesapeake','Virginia','65428','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('513-374 Rutrum Ave','St. Petersburg','Florida','40004','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('Ap #985-7787 Quis St.','Lowell','Massachusetts','53419','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 755, 4375 Lacinia Rd.','Kansas City','Missouri','99080','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('704-7837 In Av.','Lewiston','Maine','17376','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('8738 Aliquam Rd.','Pocatello','Idaho','71778','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('Ap #810-3047 Placerat, Road','Biloxi','Mississippi','17443','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('904-8083 Tempor Ave','Jonesboro','Arkansas','71337','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('715-6159 Id Av.','Davenport','Iowa','14922','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 945, 632 Maecenas Avenue','Tallahassee','Florida','30919','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('5207 Orci St.','Columbia','Missouri','46259','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('Ap #443-4563 Tempus Ave','Bridgeport','Connecticut','67130','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 979, 9179 Elit, St.','Los Angeles','California','92176','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('8514 Dolor St.','San Diego','California','96434','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 719, 4022 Eget Rd.','Fort Wayne','Indiana','36469','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('848 Arcu. Road','Atlanta','Georgia','37760','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 471, 5666 At St.','Fairbanks','Alaska','99945','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('251-4092 Eros St.','Cleveland','Ohio','32759','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('741-4803 At Rd.','Racine','Wisconsin','65140','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('381-8820 Penatibus St.','Metairie','Louisiana','12101','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('Ap #612-6463 Tellus Rd.','Lawton','Oklahoma','78377','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('293-5532 Ut Rd.','Augusta','Maine','41792','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 730, 772 Ante. Avenue','Norfolk','Virginia','97833','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('506-9478 Ultrices Av.','Tampa','Florida','38321','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('685-1755 Sagittis. Ave','College','Alaska','99592','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 147, 1809 Molestie St.','Lansing','Michigan','58348','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 566, 1784 Ultrices Ave','Hillsboro','Oregon','78178','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('Ap #479-6391 Et St.','Baton Rouge','Louisiana','69954','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('775-4860 Quam, St.','Kaneohe','Hawaii','82184','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('131-2573 Ut Av.','Los Angeles','California','92825','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('3027 Ut Road','Des Moines','Iowa','43501','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('616-9324 Ornare Rd.','San Diego','California','96005','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('7030 Tellus Road','Grand Island','Nebraska','41215','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('797-6805 Ipsum. Road','Great Falls','Montana','56122','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('591-1017 Quis, Street','Covington','Kentucky','77831','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 956, 4994 Vestibulum, Rd.','Bear','Delaware','30465','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('173-3731 Tortor St.','San Diego','California','92200','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('3812 Etiam Road','Norman','Oklahoma','68219','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('Ap #510-2065 Amet St.','Montpelier','Vermont','63805','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('558-6986 Sed, Rd.','Portland','Maine','42262','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('346-3725 Ipsum Rd.','Norman','Oklahoma','13892','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('141-7320 Vulputate Rd.','Bowling Green','Kentucky','56121','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('709-2507 Egestas St.','Allentown','Pennsylvania','26954','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 169, 8968 Nisi. Av.','Los Angeles','California','90867','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 645, 9570 Duis Rd.','Portland','Oregon','57505','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 670, 9013 Euismod Rd.','Chandler','Arizona','85127','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('771-8776 Eros. St.','Wilmington','Delaware','74404','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('Ap #631-4456 Pede. St.','Fort Collins','Colorado','98214','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('Ap #148-9900 Cursus Ave','Lincoln','Nebraska','50488','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 934, 882 Pede. Rd.','Joliet','Illinois','66342','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 694, 4648 Ipsum. Street','Fort Wayne','Indiana','46677','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('8640 Pede Avenue','Gresham','Oregon','59608','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 788, 4438 Maecenas Av.','Meridian','Idaho','97808','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('195-6686 Tortor. Avenue','Virginia Beach','Virginia','51921','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('748-9061 Augue Rd.','Los Angeles','California','94686','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('Ap #635-1315 A, Rd.','Auburn','Maine','12013','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 268, 742 Parturient Rd.','Nashville','Tennessee','80910','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 277, 242 Viverra. Street','Akron','Ohio','47292','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 808, 9458 Mus. Street','Oklahoma City','Oklahoma','88741','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 383, 3425 Vel Street','New Haven','Connecticut','49591','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('Ap #267-5997 Nec, Ave','Biloxi','Mississippi','77520','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('Ap #736-5104 Amet, Street','Lexington','Kentucky','94067','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('8034 Feugiat Avenue','Overland Park','Kansas','33522','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 165, 4387 Lectus Rd.','Henderson','Nevada','66024','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('720-6789 Cursus Rd.','Lawton','Oklahoma','56391','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 307, 3485 Eros Rd.','Helena','Montana','67705','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('1383 Quis St.','Lewiston','Maine','85149','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('478-2530 Mollis St.','Jacksonville','Florida','53778','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('500-9363 Fusce Ave','Fairbanks','Alaska','99643','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 850, 102 Integer Street','Eugene','Oregon','62150','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('333-1050 Sem Street','Minneapolis','Minnesota','68068','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('Ap #382-641 Phasellus Rd.','Atlanta','Georgia','55558','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('8639 Mus. Rd.','Wichita','Kansas','86045','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 653, 7699 Mi St.','Fort Wayne','Indiana','55927','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('1172 Nunc St.','Newark','Delaware','74808','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('112-2781 Ligula. Avenue','Wichita','Kansas','30103','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('996-5167 Nisl Rd.','Sioux City','Iowa','35845','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('Ap #630-3314 Tempus Av.','Rockford','Illinois','78271','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('9742 Duis St.','Springfield','Missouri','30786','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('618-5028 Sodales Av.','Dallas','Texas','33802','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('9984 Placerat, St.','Grand Island','Nebraska','81850','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 602, 3011 Orci Rd.','Fresno','California','91585','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('Ap #859-6785 Mauris Av.','Kansas City','Kansas','40496','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 236, 5014 Nascetur St.','Olathe','Kansas','81537','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('Ap #993-5549 Convallis Rd.','Richmond','Virginia','45797','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('742-455 Magna. Av.','Mesa','Arizona','85099','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 787, 7264 Vestibulum Av.','West Valley City','Utah','80590','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('2918 Egestas Road','Independence','Missouri','96111','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 329, 1317 Nisi St.','Minneapolis','Minnesota','14393','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('291-3429 Nec Rd.','Fayetteville','Arkansas','72691','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('749-3586 Cubilia St.','Billings','Montana','61873','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('487-2047 Libero. Street','Seattle','Washington','27698','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('519-4502 Vestibulum Street','Boise','Idaho','78452','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('Ap #104-9603 Quam St.','Bear','Delaware','25634','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 652, 6115 Nulla Street','Sioux City','Iowa','17183','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 981, 1493 Montes, Road','Metairie','Louisiana','44011','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('Ap #602-2790 Penatibus Ave','Lexington','Kentucky','72622','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('P.O. Box 151, 4391 Volutpat Avenue','San Antonio','Texas','47394','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('Ap #661-4338 Elit St.','Columbia','Missouri','87032','United States');
INSERT INTO "addresses" (street_address,city,region,postal_code,country) VALUES ('185-7427 Nullam St.','Reading','Pennsylvania','91905','United States');
------------delivered Table
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273794,178636,'2017-12-24 00:16:50');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273816,178641,'2017-12-25 00:37:54');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273774,178640,'2017-12-25 00:52:38');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273775,178633,'2017-12-24 04:52:28');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273767,178636,'2017-12-25 07:39:17');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273809,178633,'2017-12-24 22:14:55');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273841,178633,'2017-12-24 11:13:59');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273792,178641,'2017-12-25 04:23:41');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273771,178638,'2017-12-25 05:59:01');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273778,178634,'2017-12-25 06:31:06');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273773,178635,'2017-12-25 06:03:20');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273802,178637,'2017-12-24 14:31:27');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273796,178634,'2017-12-24 20:09:04');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273836,178641,'2017-12-25 14:36:58');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273828,178640,'2017-12-24 03:00:57');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273847,178641,'2017-12-25 16:47:09');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273769,178641,'2017-12-24 03:39:54');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273834,178636,'2017-12-24 06:53:26');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273756,178637,'2017-12-25 13:18:56');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273759,178640,'2017-12-25 00:49:18');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273780,178634,'2017-12-25 04:00:31');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273825,178639,'2017-12-25 13:45:56');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273837,178641,'2017-12-25 00:42:17');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273761,178639,'2017-12-24 03:12:20');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273766,178633,'2017-12-25 12:36:22');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273772,178639,'2017-12-24 02:23:55');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273849,178635,'2017-12-25 18:04:03');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273782,178639,'2017-12-24 17:05:55');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273765,178633,'2017-12-25 05:12:45');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273801,178638,'2017-12-25 03:30:07');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273803,178640,'2017-12-25 14:05:12');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273808,178638,'2017-12-24 06:27:03');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273793,178636,'2017-12-25 19:03:31');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273835,178635,'2017-12-25 19:57:53');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273811,178633,'2017-12-24 20:35:39');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273855,178636,'2017-12-25 08:02:22');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273856,178639,'2017-12-24 15:47:41');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273857,178638,'2017-12-25 04:31:53');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273858,178633,'2017-12-25 00:56:51');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273859,178635,'2017-12-25 00:03:48');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273860,178633,'2017-12-25 04:10:04');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273861,178639,'2017-12-24 17:12:56');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273862,178634,'2017-12-25 03:40:04');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273863,178639,'2017-12-25 15:58:49');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273864,178636,'2017-12-25 05:07:17');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273865,178633,'2017-12-24 01:02:09');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273866,178640,'2017-12-25 03:42:45');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273867,178633,'2017-12-24 19:06:33');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273868,178634,'2017-12-24 16:09:48');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273869,178641,'2017-12-25 16:07:34');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273870,178633,'2017-12-25 00:23:00');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273871,178635,'2017-12-24 23:45:40');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273872,178638,'2017-12-24 03:04:17');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273873,178640,'2017-12-25 15:07:58');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273874,178636,'2017-12-25 09:16:32');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273875,178639,'2017-12-25 09:49:08');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273876,178634,'2017-12-24 08:24:37');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273877,178638,'2017-12-24 07:17:47');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273878,178635,'2017-12-24 13:55:07');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273879,178635,'2017-12-25 15:56:59');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273880,178637,'2017-12-24 02:41:26');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273881,178636,'2017-12-24 11:07:37');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273882,178640,'2017-12-24 06:59:44');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273883,178638,'2017-12-24 09:47:27');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273884,178638,'2017-12-24 01:57:03');
INSERT INTO "delivered" (gift_id,lead_reindeer,time_delivered) VALUES (273885,178635,'2017-12-24 14:04:06');

------------departments Table
INSERT INTO "departments" (department_name) VALUES ('Production');
INSERT INTO "departments" (department_name) VALUES ('Research and Development');
INSERT INTO "departments" (department_name) VALUES ('Purchasing');
INSERT INTO "departments" (department_name) VALUES ('Marketing');
INSERT INTO "departments" (department_name) VALUES ('Human Resources');
INSERT INTO "departments" (department_name) VALUES ('Finance');
INSERT INTO "departments" (department_name) VALUES ('Customer Service');
INSERT INTO "departments" (department_name) VALUES ('Distribution');
INSERT INTO "departments" (department_name) VALUES ('Santa Care');
INSERT INTO "departments" (department_name) VALUES ('Legal');
INSERT INTO "departments" (department_name) VALUES ('IT Support');
INSERT INTO "departments" (department_name) VALUES ('Operations');
INSERT INTO "departments" (department_name) VALUES ('Administrative');

------------factories Table
insert into factories (factory_name, speciality) values ('Action', 'Nerf Guns, Action Figures, Super Soakers, etc.');
insert into factories (factory_name, speciality) values ('Arts', 'Crafts, Coloring Books, Paint, etc');
insert into factories (factory_name, speciality) values ('Baby', 'Learning Toys, Bottles, Blankets, etc.');
insert into factories (factory_name, speciality) values ('Building', 'Blocks, LEGOS, Toy Tools, etc');
insert into factories (factory_name, speciality) values ('Cooking', 'Play Kitchens, Easy Bake Oven, Cookbooks, etc.');
insert into factories (factory_name, speciality) values ('Dolls', 'Dress-Up, Stuffed Animals, American Girl, etc.');
insert into factories (factory_name, speciality) values ('Electronics', 'Tech Toys, Movies, Music, etc.');
insert into factories (factory_name, speciality) values ('Games', 'Puzzles, Board Games, Outdoor Games, etc.');
insert into factories (factory_name, speciality) values ('Outdoor', 'Trampoline, Mini-Pool, Basketball Hoops, etc');
insert into factories (factory_name, speciality) values ('Vehicles', 'Bikes, Control Cars, Trains, etc.');
insert into factories (factory_name, speciality) values ('Video', 'Video Games, Online Gift Cards, Controllers');
insert into factories (factory_name, speciality) values ('Pets', 'Rescue Dogs, Cats, etc. looking for a new home.');
insert into factories (factory_name, speciality) values ('Clothes', 'Dresses, Bags, Watches, etc.');

------------gifts Table
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447823,514396,100031,890029,'12/24/2017','2017-12-24 11:21:37');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447861,514407,100005,890000,'12/23/2017','2017-12-25 10:46:24');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447833,514407,100024,890021,'12/16/2017','2017-12-24 10:59:30');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447838,514392,100119,890053,'12/18/2017','2017-12-24 07:30:11');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447833,514404,100118,889981,'12/17/2017','2017-12-25 09:56:00');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447828,514405,100119,890030,'12/06/2017','2017-12-25 09:20:02');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447820,514408,100086,890036,'12/19/2017','2017-12-25 10:17:39');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447838,514388,100189,890037,'12/13/2017','2017-12-24 04:41:52');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447865,514403,100088,890021,'12/24/2017','2017-12-24 08:38:00');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447882,514392,100174,889976,'12/16/2017','2017-12-24 21:57:41');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447773,514393,100030,890042,'12/22/2017','2017-12-24 21:01:58');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447857,514407,100183,890049,'12/15/2017','2017-12-25 20:51:24');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447833,514411,100133,890027,'12/11/2017','2017-12-24 17:37:00');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447838,514401,100008,890003,'12/23/2017','2017-12-25 05:39:41');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447882,514394,100187,890057,'12/04/2017','2017-12-25 11:26:43');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447828,514388,100094,890035,'12/22/2017','2017-12-25 13:36:52');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447852,514406,100185,890058,'12/24/2017','2017-12-25 19:00:08');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447882,514400,100097,890053,'12/07/2017','2017-12-24 08:49:15');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447882,514407,100146,890012,'12/21/2017','2017-12-24 04:25:00');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447865,514390,100146,890071,'12/20/2017','2017-12-24 12:38:54');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447813,514389,100105,890026,'12/24/2017','2017-12-25 00:56:04');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447811,514412,100026,890073,'12/23/2017','2017-12-25 14:30:41');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447817,514388,100063,890012,'12/11/2017','2017-12-25 16:03:44');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447857,514413,100022,890008,'12/12/2017','2017-12-25 23:31:44');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447861,514410,100123,890021,'12/23/2017','2017-12-24 01:44:26');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447823,514399,100142,890002,'12/22/2017','2017-12-25 05:42:09');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447865,514408,100023,890058,'12/08/2017','2017-12-24 00:21:35');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447861,514389,100185,890004,'12/09/2017','2017-12-25 00:43:15');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447859,514391,100127,890055,'12/16/2017','2017-12-24 16:41:17');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447823,514409,100098,890058,'12/19/2017','2017-12-25 13:23:30');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447769,514405,100101,890056,'12/07/2017','2017-12-25 22:48:13');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447773,514391,100195,890044,'12/18/2017','2017-12-24 05:16:24');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447813,514397,100053,890043,'12/19/2017','2017-12-25 04:39:32');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447882,514390,100155,890039,'12/18/2017','2017-12-25 06:28:54');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447813,514413,100053,890033,'12/23/2017','2017-12-25 11:48:11');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447813,514405,100174,889982,'12/14/2017','2017-12-24 06:02:12');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447837,514412,100190,889986,'12/21/2017','2017-12-25 12:58:23');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447813,514413,100133,889986,'12/01/2017','2017-12-24 06:38:10');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447838,514406,100162,889987,'12/09/2017','2017-12-25 14:36:39');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447820,514392,100147,890009,'12/10/2017','2017-12-24 21:07:54');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447780,514389,100163,889987,'12/07/2017','2017-12-25 05:56:07');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447820,514411,100191,890023,'12/11/2017','2017-12-25 14:21:18');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447837,514404,100181,890033,'12/04/2017','2017-12-24 21:45:23');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447811,514392,100181,890003,'12/07/2017','2017-12-24 19:30:38');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447837,514409,100057,890030,'12/20/2017','2017-12-24 21:00:34');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447823,514389,100038,890038,'12/24/2017','2017-12-25 01:39:58');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447817,514395,100197,889987,'12/17/2017','2017-12-24 11:15:04');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447813,514404,100020,890013,'12/12/2017','2017-12-25 11:36:47');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447861,514410,100034,890027,'12/09/2017','2017-12-25 22:10:31');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447837,514391,100038,890029,'12/21/2017','2017-12-24 06:07:25');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447865,514392,100010,890017,'12/23/2017','2017-12-25 12:42:52');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447780,514392,100199,890002,'12/14/2017','2017-12-24 06:07:29');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447865,514396,100034,890024,'12/02/2017','2017-12-24 05:26:16');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447838,514397,100104,890067,'12/22/2017','2017-12-25 06:38:29');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447780,514388,100067,890053,'12/08/2017','2017-12-25 09:04:58');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447773,514395,100181,890005,'12/05/2017','2017-12-24 23:05:19');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447837,514401,100152,890013,'12/11/2017','2017-12-24 23:57:59');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447773,514393,100065,890064,'12/16/2017','2017-12-25 22:21:06');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447828,514401,100038,890051,'12/10/2017','2017-12-24 22:17:54');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447865,514391,100192,890043,'12/07/2017','2017-12-24 20:36:34');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447773,514412,100037,890018,'12/19/2017','2017-12-25 09:11:43');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447823,514411,100038,889984,'12/01/2017','2017-12-24 11:06:28');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447852,514401,100029,889993,'12/12/2017','2017-12-24 08:12:03');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447852,514402,100085,890015,'12/16/2017','2017-12-24 11:12:51');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447833,514390,100164,890073,'12/18/2017','2017-12-25 10:48:16');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447773,514410,100001,890041,'12/19/2017','2017-12-24 15:53:40');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447835,514395,100131,889989,'12/21/2017','2017-12-24 14:52:18');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447857,514410,100171,890072,'12/13/2017','2017-12-25 15:07:42');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447820,514406,100150,890033,'12/13/2017','2017-12-25 00:44:55');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447811,514403,100016,890055,'12/11/2017','2017-12-25 07:45:43');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447865,514396,100156,890005,'12/11/2017','2017-12-24 05:25:20');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447828,514400,100093,890057,'12/16/2017','2017-12-25 07:37:57');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447833,514412,100143,890053,'12/04/2017','2017-12-25 15:20:52');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447838,514395,100079,890027,'12/03/2017','2017-12-24 14:19:46');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447882,514396,100177,890055,'12/09/2017','2017-12-24 01:01:06');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447835,514391,100031,890015,'12/02/2017','2017-12-25 16:43:16');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447780,514396,100045,889984,'12/23/2017','2017-12-24 00:16:33');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447882,514397,100120,890001,'12/15/2017','2017-12-24 09:31:12');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447857,514412,100075,890013,'12/12/2017','2017-12-24 16:37:28');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447811,514399,100179,890053,'12/18/2017','2017-12-25 12:25:30');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447865,514393,100054,890003,'12/03/2017','2017-12-25 05:45:20');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447857,514403,100177,890005,'12/23/2017','2017-12-25 17:57:23');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447852,514411,100110,889996,'12/09/2017','2017-12-25 13:19:12');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447837,514395,100011,889996,'12/21/2017','2017-12-24 19:43:16');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447828,514390,100025,890047,'12/15/2017','2017-12-25 11:14:58');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447828,514400,100097,889979,'12/16/2017','2017-12-24 01:57:27');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447780,514413,100029,889992,'12/24/2017','2017-12-24 04:12:38');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447823,514399,100100,890049,'12/14/2017','2017-12-25 07:30:58');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447852,514391,100032,890042,'12/01/2017','2017-12-24 11:37:44');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447817,514408,100126,890073,'12/01/2017','2017-12-25 06:00:42');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447828,514407,100027,889998,'12/16/2017','2017-12-24 02:24:57');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447820,514412,100122,889996,'12/16/2017','2017-12-25 10:18:45');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447823,514398,100062,890074,'12/14/2017','2017-12-24 10:25:02');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447861,514405,100195,889984,'12/18/2017','2017-12-24 08:04:24');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447780,514413,100142,890006,'12/04/2017','2017-12-25 16:57:07');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447769,514391,100118,889995,'12/24/2017','2017-12-24 01:13:07');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447865,514413,100187,890001,'12/10/2017','2017-12-25 02:58:15');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447852,514389,100086,890008,'12/07/2017','2017-12-25 16:27:52');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447833,514394,100184,890041,'12/16/2017','2017-12-24 10:50:50');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447861,514411,100180,890014,'12/04/2017','2017-12-24 00:52:12');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447823,514402,100050,890068,'12/10/2017','2017-12-24 14:57:39');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447846,514397,100149,890043,'12/02/2017','2017-12-24 03:49:01');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447875,514388,100116,890058,'12/13/2017','2017-12-24 08:28:47');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447896,514404,100190,889995,'12/03/2017','2017-12-24 17:58:16');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447883,514408,100056,889995,'12/08/2017','2017-12-25 18:35:02');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447864,514405,100097,889985,'12/20/2017','2017-12-24 20:01:31');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447886,514395,100025,890057,'12/13/2017','2017-12-25 12:14:55');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447856,514398,100011,890009,'12/02/2017','2017-12-25 16:36:19');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447875,514403,100158,890051,'12/12/2017','2017-12-25 13:01:34');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447836,514391,100163,890012,'12/05/2017','2017-12-25 23:20:37');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447859,514407,100193,890054,'12/18/2017','2017-12-25 09:34:47');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447896,514395,100140,889991,'12/19/2017','2017-12-25 18:08:28');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447878,514404,100167,890007,'12/06/2017','2017-12-24 21:06:25');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447818,514403,100070,890042,'12/18/2017','2017-12-24 19:42:01');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447878,514399,100102,890010,'12/22/2017','2017-12-24 19:28:04');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447818,514392,100041,890019,'12/15/2017','2017-12-24 02:30:16');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447836,514389,100041,890004,'12/01/2017','2017-12-25 00:16:23');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447893,514390,100195,890063,'12/02/2017','2017-12-24 22:11:56');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447846,514401,100108,890030,'12/03/2017','2017-12-24 08:36:00');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447824,514399,100152,890045,'12/09/2017','2017-12-24 20:12:42');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447889,514394,100063,889987,'12/23/2017','2017-12-25 16:57:19');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447853,514412,100099,890028,'12/15/2017','2017-12-24 14:52:44');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447888,514396,100086,890038,'12/22/2017','2017-12-25 15:50:22');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447893,514388,100158,890044,'12/12/2017','2017-12-24 06:50:04');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447854,514411,100175,890014,'12/08/2017','2017-12-25 07:58:44');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447889,514394,100125,890054,'12/17/2017','2017-12-24 18:09:01');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447830,514398,100188,890037,'12/22/2017','2017-12-25 20:47:10');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447848,514401,100090,890028,'12/11/2017','2017-12-24 20:52:28');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447859,514399,100054,889993,'12/16/2017','2017-12-24 02:52:38');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447869,514388,100185,890032,'12/05/2017','2017-12-25 23:57:35');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447863,514411,100002,890026,'12/12/2017','2017-12-25 01:36:12');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447888,514412,100081,890024,'12/23/2017','2017-12-24 12:30:00');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447847,514396,100117,890005,'12/23/2017','2017-12-24 15:56:10');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447891,514390,100118,890001,'12/20/2017','2017-12-24 22:39:08');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447867,514391,100193,890029,'12/13/2017','2017-12-25 16:39:15');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447877,514388,100154,890060,'12/06/2017','2017-12-25 02:08:31');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447816,514399,100074,889996,'12/11/2017','2017-12-25 01:17:11');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447817,514405,100111,890009,'12/04/2017','2017-12-25 14:56:59');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447802,514409,100119,890064,'12/06/2017','2017-12-24 10:37:41');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447822,514390,100056,889998,'12/05/2017','2017-12-25 16:15:21');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447878,514407,100007,890062,'12/07/2017','2017-12-24 02:51:35');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447878,514391,100059,890035,'12/19/2017','2017-12-25 02:06:22');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447865,514397,100076,890075,'12/21/2017','2017-12-24 17:38:07');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447825,514395,100148,889978,'12/09/2017','2017-12-24 16:08:17');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447886,514411,100083,890006,'12/07/2017','2017-12-24 22:42:16');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447877,514397,100099,890050,'12/23/2017','2017-12-24 14:55:24');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447825,514389,100088,890008,'12/03/2017','2017-12-25 16:18:26');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447869,514390,100089,889983,'12/02/2017','2017-12-24 17:12:29');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447852,514396,100194,890054,'12/08/2017','2017-12-25 03:04:32');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447863,514403,100178,890003,'12/10/2017','2017-12-25 11:13:39');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447857,514392,100091,890010,'12/20/2017','2017-12-24 05:34:56');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447894,514404,100019,889996,'12/17/2017','2017-12-24 07:11:29');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447873,514403,100112,890021,'12/21/2017','2017-12-24 08:26:38');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447870,514412,100155,890032,'12/16/2017','2017-12-24 03:50:37');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447804,514393,100048,890055,'12/17/2017','2017-12-24 19:59:41');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447898,514404,100129,889982,'12/18/2017','2017-12-24 10:00:53');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447895,514410,100172,889990,'12/10/2017','2017-12-24 08:50:29');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447898,514411,100068,889986,'12/10/2017','2017-12-25 20:07:52');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447865,514398,100064,890019,'12/04/2017','2017-12-25 00:50:46');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447804,514408,100005,889982,'12/07/2017','2017-12-25 19:21:07');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447880,514411,100080,890017,'12/15/2017','2017-12-25 21:23:59');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447876,514399,100013,890011,'12/04/2017','2017-12-24 15:30:22');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447805,514395,100010,890005,'12/09/2017','2017-12-25 00:36:44');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447843,514405,100098,890007,'12/11/2017','2017-12-25 07:21:37');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447886,514393,100067,890049,'12/11/2017','2017-12-24 08:40:40');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447875,514405,100075,890000,'12/09/2017','2017-12-25 14:05:23');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447862,514407,100170,890004,'12/18/2017','2017-12-24 01:03:38');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447852,514392,100098,890067,'12/23/2017','2017-12-25 18:15:29');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447823,514407,100113,890005,'12/21/2017','2017-12-24 15:48:01');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447827,514402,100098,890049,'12/10/2017','2017-12-25 07:19:40');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447807,514407,100102,889999,'12/08/2017','2017-12-24 19:56:13');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447883,514404,100061,889978,'12/01/2017','2017-12-25 18:03:50');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447864,514395,100149,890022,'12/18/2017','2017-12-24 10:52:59');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447852,514397,100026,890073,'12/10/2017','2017-12-24 00:07:22');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447807,514399,100076,889999,'12/12/2017','2017-12-25 21:05:33');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447850,514403,100047,889993,'12/06/2017','2017-12-24 00:38:49');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447876,514392,100051,889981,'12/05/2017','2017-12-25 23:25:46');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447827,514390,100051,890056,'12/12/2017','2017-12-24 23:11:31');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447809,514406,100046,890008,'12/17/2017','2017-12-25 01:15:16');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447817,514413,100156,889994,'12/12/2017','2017-12-24 06:54:14');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447855,514391,100133,889984,'12/01/2017','2017-12-24 23:42:20');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447855,514407,100063,890023,'12/15/2017','2017-12-25 00:51:04');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447852,514413,100054,890068,'12/13/2017','2017-12-24 10:29:03');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447855,514391,100182,890058,'12/18/2017','2017-12-25 07:54:31');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447829,514403,100093,889982,'12/08/2017','2017-12-25 07:20:11');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447834,514402,100146,890066,'12/18/2017','2017-12-24 23:41:46');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447850,514407,100020,890033,'12/13/2017','2017-12-25 01:19:46');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447896,514408,100040,890046,'12/23/2017','2017-12-25 00:59:43');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447835,514390,100157,890059,'12/11/2017','2017-12-24 10:19:58');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447802,514405,100061,889978,'12/14/2017','2017-12-25 19:10:19');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447851,514411,100148,890037,'12/13/2017','2017-12-24 00:07:08');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447898,514406,100132,889989,'12/18/2017','2017-12-24 14:34:21');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447839,514401,100182,890035,'12/19/2017','2017-12-25 11:50:59');
INSERT INTO "gifts" (kid_id,item_id,elf_id,wrapping_id,date_packaged,eta) VALUES (447820,514393,100062,890048,'12/21/2017','2017-12-24 16:41:30');
------------head_elves Table
INSERT INTO "head_elves" (elf_id, title, promotion_date) VALUES (100120, 'Chief Manufacturing Engineer', '01/23/1999');
INSERT INTO "head_elves" (elf_id, title, promotion_date) VALUES (100008, 'Department Manager', '11/17/1994');
INSERT INTO "head_elves" (elf_id, title, promotion_date) VALUES (100000, 'Resourcing Lead', '06/12/2001');
INSERT INTO "head_elves" (elf_id, title, promotion_date) VALUES (100002, 'Marketing Director', '01/01/2000');
INSERT INTO "head_elves" (elf_id, title, promotion_date) VALUES (100020, 'Marketing Manager', '04/21/2005');
INSERT INTO "head_elves" (elf_id, title, promotion_date) VALUES (100031, 'Chief Happiness Officer', '06/06/2009');
INSERT INTO "head_elves" (elf_id, title, promotion_date) VALUES (100033, 'Chief People Officer', '06/06/2008');
INSERT INTO "head_elves" (elf_id, title, promotion_date) VALUES (100111, 'Accounting Director', '03/05/2010');
INSERT INTO "head_elves" (elf_id, title, promotion_date) VALUES (100112, 'Accounting Manager', '06/21/1999');
INSERT INTO "head_elves" (elf_id, title, promotion_date) VALUES (100176, 'Department Manager', '03/03/2003');
INSERT INTO "head_elves" (elf_id, title, promotion_date) VALUES (100030, 'Chief Legal Analyist', '09/03/1998');
INSERT INTO "head_elves" (elf_id, title, promotion_date) VALUES (100098, 'Sales Executive', '12/03/1998');

------------inventory Table
INSERT INTO "inventory" (factory_id, item_name, item_description, item_weight_lbs) VALUES (663532, 'FIFA 18(Xbox One)', 'Video Game for Xbox One gaming system', 1);
INSERT INTO "inventory" (factory_id, item_name, item_description, item_weight_lbs) VALUES (663532, 'FIFA 18(PS4)', 'Video Game for PS4 gaming system', 1);
INSERT INTO "inventory" (factory_id, item_name, item_description, item_weight_lbs) VALUES (663522, 'Gun(water)', 'Water gun', 2);
INSERT INTO "inventory" (factory_id, item_name, item_description, item_weight_lbs) VALUES (663522, 'Gun(nerf)', 'Gun that shoot foam bullets', 5);
INSERT INTO "inventory" (factory_id, item_name, item_description, item_weight_lbs) VALUES (663523, 'Coloring book(Frozen)', 'Disney movie frozen color book', 1);
INSERT INTO "inventory" (factory_id, item_name, item_description, item_weight_lbs) VALUES (663523, 'Paint(face)', 'Face and Skin paint', 1);
INSERT INTO "inventory" (factory_id, item_name, item_description, item_weight_lbs) VALUES (663524, 'Blanket(Froggy)', 'Blanket with frogs on it', 1);
INSERT INTO "inventory" (factory_id, item_name, item_description, item_weight_lbs) VALUES (663524, 'Play Pin(baby toy)', 'Child to play in safe area', 10);
INSERT INTO "inventory" (factory_id, item_name, item_description, item_weight_lbs) VALUES (663525, 'LEGOS(42 packet)', 'building blocks', 3);
INSERT INTO "inventory" (factory_id, item_name, item_description, item_weight_lbs) VALUES (663525, 'Toy hammer(building tool)', 'building tool set', 2);
INSERT INTO "inventory" (factory_id, item_name, item_description, item_weight_lbs) VALUES (663526, 'Easy bake oven(kitchen)', 'Kitchen oven', 9);
INSERT INTO "inventory" (factory_id, item_name, item_description, item_weight_lbs) VALUES (663526, 'Linda recipe book(baking)', 'Cookbook', 1);
INSERT INTO "inventory" (factory_id, item_name, item_description, item_weight_lbs) VALUES (663527, 'teddy bear(stuff animal)', 'stuffed animal toy', 2);
INSERT INTO "inventory" (factory_id, item_name, item_description, item_weight_lbs) VALUES (663527, 'American Girl(doll)', 'doll', 4);
INSERT INTO "inventory" (factory_id, item_name, item_description, item_weight_lbs) VALUES (663528, 'Cinderella (movie)', 'Disney movie', 2);
INSERT INTO "inventory" (factory_id, item_name, item_description, item_weight_lbs) VALUES (663528, 'Beyonce(music)', 'music cd', 1);
INSERT INTO "inventory" (factory_id, item_name, item_description, item_weight_lbs) VALUES (663529, 'monster inc puzzle(puzzle)', 'puzzle', 4);
INSERT INTO "inventory" (factory_id, item_name, item_description, item_weight_lbs) VALUES (663529, 'twister(game)', 'board game', 5);
INSERT INTO "inventory" (factory_id, item_name, item_description, item_weight_lbs) VALUES (663530, 'kid pool(mini pool)', 'outdoor pool', 10);
INSERT INTO "inventory" (factory_id, item_name, item_description, item_weight_lbs) VALUES (663530, 'mini trampoline(trampoline)', 'outdoor trampoline', 10);
INSERT INTO "inventory" (factory_id, item_name, item_description, item_weight_lbs) VALUES (663531, 'Ferrari(car)', 'sports car vehicle', 10);
INSERT INTO "inventory" (factory_id, item_name, item_description, item_weight_lbs) VALUES (663531, 'lamborghini(car)', 'sports car vehicle', 10);
INSERT INTO "inventory" (factory_id, item_name, item_description, item_weight_lbs) VALUES (663533, 'German Shepard(dog)', 'rescue dog', 5);
INSERT INTO "inventory" (factory_id, item_name, item_description, item_weight_lbs) VALUES (663533, 'Taby Cat(cat)', 'rescue cat', 3);
INSERT INTO "inventory" (factory_id, item_name, item_description, item_weight_lbs) VALUES (663534, 'Forever 21(clothing)', 'dress', 2);
INSERT INTO "inventory" (factory_id, item_name, item_description, item_weight_lbs) VALUES (663534, 'Micheal Kors(clothing)', 'bag', 4);

------------kids Table
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325903,'Walter','Simmons','Male',3,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325868,'Gannon','Sanders','Male',17,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325912,'Laith','Fernandez','Male',18,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325895,'Stuart','Leblanc','Male',21,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325922,'Stone','Becker','Male',9,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325876,'Davis','Dudley','Male',11,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325879,'Amery','Gallegos','Male',13,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325910,'Perry','Cleveland','Male',2,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325887,'Berk','Myers','Male',10,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325867,'Bert','Joseph','Male',12,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325882,'Barrett','Mills','Male',4,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325915,'Brennan','Pate','Male',5,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325855,'Joseph','Cortez','Male',7,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325843,'Hasad','Sims','Male',1,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325885,'Patrick','Blackburn','Male',16,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325851,'Gray','Hubbard','Male',10,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325874,'Carl','Anderson','Male',2,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325885,'Oren','Finch','Male',12,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325930,'Demetrius','Tyler','Male',7,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325878,'Davis','Beach','Male',1,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325929,'Cairo','Joyce','Male',17,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325913,'Shad','Lindsay','Male',21,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325921,'Alvin','Gray','Male',6,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325861,'Jasper','Davis','Male',21,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325902,'Xander','Gay','Male',8,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325875,'Byron','Anthony','Male',10,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325921,'Cairo','Oneal','Male',7,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325901,'Nolan','Christian','Male',5,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325931,'Lance','Meyers','Male',21,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325843,'Connor','Abbott','Male',11,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325877,'Eaton','Rasmussen','Male',19,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325861,'Kermit','Warner','Male',4,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325884,'Yardley','Clayton','Male',20,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325907,'Wing','Powers','Male',10,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325900,'Tad','Pope','Male',6,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325890,'Lars','Bass','Male',13,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325910,'Eaton','Le','Male',17,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325867,'Emery','Short','Male',1,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325895,'Lee','Henderson','Male',13,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325891,'Xanthus','Mcneil','Male',19,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325875,'Ray','Stone','Male',4,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325843,'Edward','Garcia','Male',8,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325848,'Ira','Berry','Male',13,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325917,'Zane','Harding','Male',2,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325896,'Aaron','Hendrix','Male',6,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325876,'Xander','Spence','Male',13,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325893,'Paki','Kidd','Male',8,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325898,'Herman','Stafford','Male',19,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325850,'Zane','Blair','Male',18,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325900,'Andrew','Powell','Male',13,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325897,'Arden','Ayers','Male',9,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325850,'Vance','Daniel','Male',10,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325867,'Armand','Farmer','Male',15,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325874,'Amos','Kemp','Male',9,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325861,'Marshall','Nixon','Male',6,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325917,'Michael','Middleton','Male',4,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325838,'Seth','Blanchard','Male',12,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325888,'Burton','Sloan','Male',9,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325910,'Ethan','Jennings','Male',2,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325901,'Steven','Leblanc','Male',7,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325916,'Alan','Conner','Male',8,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325877,'Upton','Reyes','Male',15,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325917,'Colin','Cohen','Male',12,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325873,'Harper','Fitzpatrick','Male',19,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325839,'Levi','Poole','Male',13,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325865,'Brock','Kaufman','Male',17,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325857,'Nero','Branch','Male',10,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325838,'Lucius','Copeland','Male',18,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325910,'Devin','Whitney','Male',6,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325839,'Eric','Bass','Male',12,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325859,'Kirk','Macdonald','Male',15,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325894,'Elliott','Mccoy','Male',9,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325907,'Tiger','Lucas','Male',10,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325906,'Daniel','Ortega','Male',17,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325841,'Ryder','Gaines','Male',18,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325906,'Orson','Smith','Male',5,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325846,'Shad','David','Male',9,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325901,'Zeus','Castro','Male',5,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325911,'Dean','Pennington','Male',2,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325887,'Alvin','Moreno','Male',14,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325843,'Ezra','Bowers','Male',8,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325851,'Price','Macias','Male',19,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325854,'Zeus','Aguilar','Male',20,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325855,'Rafael','Olsen','Male',12,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325891,'Patrick','Barr','Male',11,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325931,'Hamilton','Moore','Male',6,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325842,'Odysseus','Bruce','Male',8,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325927,'Ciaran','Gallagher','Male',1,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325932,'Murphy','Carrillo','Male',14,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325892,'Wyatt','Vega','Male',20,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325909,'Sean','Elliott','Male',11,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325838,'Kyle','Lambert','Male',21,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325891,'Rajah','Holcomb','Male',5,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325851,'Levi','Armstrong','Male',2,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325859,'Yoshio','Russell','Male',18,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325884,'Drake','Carrillo','Male',17,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325882,'Troy','Witt','Male',9,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325847,'Colton','Hanson','Male',10,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325839,'Clinton','Gillespie','Male',8,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325870,'Jonah','Sexton','Male',7,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325838,'Alan','Labouseur','Male',21,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325933,'Cecilia','Adkins','Female',19,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325891,'Kyra','Goodman','Female',11,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325848,'Hope','Russo','Female',13,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325877,'Tatyana','Snyder','Female',5,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325879,'Jolie','Hunt','Female',21,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325838,'Jacqueline','Donovan','Female',9,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325876,'Zoe','Clayton','Female',7,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325920,'Wyoming','Fields','Female',19,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325887,'Jolene','Christensen','Female',5,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325906,'Echo','Riley','Female',7,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325863,'Madeline','Duke','Female',4,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325914,'Chastity','Hood','Female',15,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325918,'Isabelle','Dale','Female',12,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325921,'Ayanna','Nolan','Female',13,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325893,'Holly','Rodriguez','Female',1,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325883,'Nora','Gentry','Female',9,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325863,'Anika','Ramirez','Female',6,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325900,'Brynn','Kramer','Female',10,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325879,'Tallulah','Velasquez','Female',20,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325909,'Lillian','Lawson','Female',18,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325844,'Venus','Valentine','Female',19,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325916,'Iona','Long','Female',1,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325897,'Buffy','Jefferson','Female',14,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325837,'Geraldine','Duke','Female',11,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325838,'Quincy','Pacheco','Female',19,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325933,'Quintessa','Bell','Female',13,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325932,'Dana','Howell','Female',4,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325877,'Regan','Vega','Female',1,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325888,'Aphrodite','Castro','Female',15,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325860,'Isabelle','Whitaker','Female',19,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325840,'Joy','Nolan','Female',3,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325931,'Signe','Salas','Female',15,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325852,'Gail','Bennett','Female',17,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325839,'Allegra','Deleon','Female',17,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325902,'Alexandra','Jones','Female',1,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325931,'Naomi','Stone','Female',6,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325936,'Ocean','Cobb','Female',16,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325901,'Autumn','Vincent','Female',19,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325928,'Zenaida','Nielsen','Female',19,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325855,'Helen','Stein','Female',19,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325904,'Hilary','Tillman','Female',3,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325868,'Joelle','Vincent','Female',9,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325900,'Kalia','Shields','Female',16,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325915,'Rhoda','Gonzalez','Female',16,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325932,'Isabelle','Mills','Female',9,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325932,'Haviva','Woods','Female',1,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325872,'Sophia','Whitley','Female',21,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325925,'Shellie','Hardin','Female',14,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325927,'Eliana','Harding','Female',1,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325926,'Whitney','Fields','Female',13,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325886,'Quintessa','Snow','Female',12,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325849,'Urielle','Mccall','Female',1,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325914,'Erica','Coleman','Female',17,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325888,'Dai','Copeland','Female',2,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325840,'Urielle','Tillman','Female',20,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325915,'Lisandra','Benjamin','Female',2,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325844,'Cherokee','Gross','Female',20,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325853,'Selma','Robertson','Female',2,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325869,'Bo','Cotton','Female',14,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325873,'Maite','Andrews','Female',4,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325927,'Kaye','Wolfe','Female',19,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325879,'Quynn','Sanford','Female',12,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325905,'Claudia','Salazar','Female',5,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325843,'Cleo','Arnold','Female',12,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325861,'Venus','Collins','Female',9,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325870,'Cherokee','Cote','Female',12,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325845,'Ori','Rodriquez','Female',5,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325869,'Sasha','Harvey','Female',19,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325919,'Winter','Vincent','Female',1,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325842,'Winter','Torres','Female',15,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325838,'Hadassah','Noel','Female',14,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325925,'Hedwig','Bowen','Female',5,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325837,'Virginia','Washington','Female',3,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325879,'Alea','Decker','Female',3,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325923,'Kay','Duke','Female',7,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325903,'Zelenia','Jones','Female',1,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325895,'Lael','Jenkins','Female',19,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325905,'Veronica','Whitley','Female',20,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325920,'Jaden','Alston','Female',7,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325858,'Vivian','Conway','Female',18,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325853,'Martha','Brooks','Female',9,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325887,'Quynn','Hanson','Female',12,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325862,'Amethyst','Chavez','Female',11,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325879,'Demetria','Huffman','Female',14,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325902,'Beverly','Harding','Female',4,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325875,'Nadine','Rodriguez','Female',16,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325893,'Penelope','Rowland','Female',15,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325872,'Alisa','Carpenter','Female',19,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325843,'Brooke','Pratt','Female',14,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325883,'Rosalyn','Vasquez','Female',12,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325881,'Jael','Moore','Female',17,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325916,'Germane','Waters','Female',16,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325869,'Fredericka','Alford','Female',15,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325908,'Martha','Tillman','Female',19,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325904,'Whilemina','Thompson','Female',17,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325893,'Xena','Abbott','Female',13,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325906,'Harriet','Serrano','Female',8,'Naughty');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325934,'Angelica','Bartlett','Female',3,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325889,'Chelsea','Simon','Female',9,'Nice');
INSERT INTO "kids" (address_id,first_name,last_name,gender,age,verdict) VALUES (325867,'Tatyana','Forbes','Female',11,'Nice');

------------letters Table
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447833,'09/28/2017','12/07/2017','Bike');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447820,'09/25/2017','11/22/2017','Xbox One X');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447893,'09/06/2017','10/22/2017','PS4 Pro');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447825,'09/27/2017','11/09/2017','Dog');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447890,'09/21/2017','11/24/2017','Bike');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447769,'09/22/2017','11/06/2017','iPhone X');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447936,'09/01/2017','11/25/2017','Apple Watch');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447959,'09/10/2017','11/08/2017','PS4 Pro');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447881,'09/28/2017','12/02/2017','Dog');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447909,'09/21/2017','11/20/2017','Bike');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447839,'09/22/2017','10/06/2017','World Peace');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447822,'09/22/2017','11/29/2017','Apple Watch');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447773,'09/23/2017','10/16/2017','World Peace');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447879,'09/21/2017','12/16/2017','Macbook Pro');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447842,'09/27/2017','11/17/2017','Nintendo Switch');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447799,'09/24/2017','11/13/2017','Nintendo Switch');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447935,'09/11/2017','11/12/2017','Apple Watch');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447847,'09/16/2017','11/19/2017','World Peace');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447775,'09/21/2017','11/29/2017','iPhone X');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447805,'09/20/2017','11/22/2017','iPhone X');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447840,'09/18/2017','12/08/2017','Macbook Pro');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447905,'09/15/2017','10/05/2017','Dog');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447948,'09/29/2017','11/20/2017','PS4 Pro');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447934,'09/02/2017','11/03/2017','Xbox One X');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447907,'09/08/2017','11/04/2017','Xbox One X');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447958,'09/11/2017','12/20/2017','Nintendo Switch');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447828,'09/25/2017','12/10/2017','Nintendo Switch');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447901,'09/29/2017','11/07/2017','Dog');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447776,'09/12/2017','10/17/2017','Macbook Pro');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447890,'09/20/2017','12/19/2017','iPhone X');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447884,'09/01/2017','12/22/2017','Bike');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447895,'09/07/2017','12/07/2017','Macbook Pro');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447891,'09/07/2017','11/22/2017','Bike');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447837,'09/18/2017','10/11/2017','Apple Watch');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447852,'09/15/2017','12/12/2017','Bike');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447769,'09/22/2017','12/14/2017','iPhone X');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447777,'09/05/2017','11/02/2017','Apple Watch');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447865,'09/10/2017','10/24/2017','iPhone X');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447928,'09/17/2017','12/06/2017','Dog');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447905,'09/01/2017','10/19/2017','World Peace');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447804,'09/17/2017','10/05/2017','Dog');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447825,'09/04/2017','12/19/2017','Nintendo Switch');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447872,'09/14/2017','12/05/2017','iPhone X');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447889,'09/29/2017','10/30/2017','Dog');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447819,'09/08/2017','10/09/2017','iPhone X');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447875,'09/29/2017','11/14/2017','Nintendo Switch');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447886,'09/17/2017','12/03/2017','Nintendo Switch');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447861,'09/17/2017','10/09/2017','Nintendo Switch');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447810,'09/29/2017','12/10/2017','World Peace');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447940,'09/22/2017','11/19/2017','PS4 Pro');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447962,'09/27/2017','11/01/2017','PS4 Pro');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447913,'09/04/2017','10/22/2017','Bike');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447769,'09/14/2017','12/14/2017','iPhone X');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447917,'09/23/2017','12/20/2017','Macbook Pro');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447825,'09/20/2017','10/22/2017','Apple Watch');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447871,'09/25/2017','11/28/2017','PS4 Pro');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447859,'09/01/2017','10/11/2017','Apple Watch');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447849,'09/24/2017','11/29/2017','iPhone X');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447963,'09/09/2017','12/01/2017','Xbox One X');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447862,'09/26/2017','10/17/2017','Dog');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447855,'09/20/2017','12/21/2017','World Peace');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447828,'09/22/2017','12/15/2017','PS4 Pro');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447919,'09/15/2017','10/15/2017','World Peace');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447813,'09/25/2017','10/20/2017','Xbox One X');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447884,'09/28/2017','12/09/2017','Macbook Pro');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447849,'09/09/2017','10/23/2017','Apple Watch');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447869,'09/05/2017','12/11/2017','PS4 Pro');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447888,'09/21/2017','12/22/2017','Apple Watch');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447799,'09/17/2017','10/31/2017','iPhone X');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447791,'09/04/2017','10/08/2017','Nintendo Switch');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447837,'09/23/2017','10/30/2017','Bike');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447846,'09/22/2017','10/03/2017','iPhone X');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447917,'09/03/2017','10/28/2017','World Peace');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447928,'09/20/2017','10/16/2017','Nintendo Switch');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447866,'09/17/2017','10/04/2017','PS4 Pro');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447912,'09/22/2017','12/19/2017','Nintendo Switch');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447930,'09/19/2017','11/11/2017','Apple Watch');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447936,'09/04/2017','11/17/2017','Apple Watch');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447840,'09/19/2017','12/16/2017','Nintendo Switch');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447893,'09/17/2017','12/05/2017','PS4 Pro');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447915,'09/22/2017','10/23/2017','Dog');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447777,'09/15/2017','11/06/2017','Macbook Pro');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447852,'09/01/2017','12/08/2017','Bike');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447907,'09/14/2017','11/21/2017','Macbook Pro');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447892,'09/15/2017','10/20/2017','World Peace');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447856,'09/25/2017','11/23/2017','Macbook Pro');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447879,'09/27/2017','11/27/2017','iPhone X');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447878,'09/16/2017','10/13/2017','iPhone X');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447889,'09/08/2017','10/06/2017','Nintendo Switch');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447830,'09/28/2017','11/06/2017','Xbox One X');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447892,'09/28/2017','12/21/2017','Macbook Pro');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447861,'09/27/2017','10/05/2017','Dog');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447954,'09/10/2017','12/03/2017','Apple Watch');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447891,'09/09/2017','12/20/2017','PS4 Pro');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447948,'09/07/2017','12/15/2017','Macbook Pro');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447899,'09/25/2017','12/06/2017','Apple Watch');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447899,'09/19/2017','10/23/2017','Apple Watch');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447796,'09/11/2017','11/15/2017','iPhone X');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447796,'09/04/2017','10/23/2017','iPhone X');
INSERT INTO "letters" (kid_id,date_delivered,date_received,wishes) VALUES (447931,'09/09/2017','12/23/2017','iPhone X');

------------reindeer Table
INSERT INTO "reindeer" (reindeer_name,special_skills) VALUES ('Dasher','Speed');
INSERT INTO "reindeer" (reindeer_name,special_skills) VALUES ('Prancer','High Jumper');
INSERT INTO "reindeer" (reindeer_name,special_skills) VALUES ('Comet','Speed');
INSERT INTO "reindeer" (reindeer_name,special_skills) VALUES ('Vixen','None');
INSERT INTO "reindeer" (reindeer_name,special_skills) VALUES ('Dancer','Stamina');
INSERT INTO "reindeer" (reindeer_name,special_skills) VALUES ('Cupid','Navigator');
INSERT INTO "reindeer" (reindeer_name,special_skills) VALUES ('Donner','None');
INSERT INTO "reindeer" (reindeer_name,special_skills) VALUES ('Blitzen','Short Bursts of Speed');
INSERT INTO "reindeer" (reindeer_name,special_skills) VALUES ('Rudolph','Navigator, Shiny Nose');

------------staff Table
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382135,'Price','Hightop',4624,'05/30/1904','$0.61');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382139,'Oren','Who',5395,'03/15/1968','$91.61');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382136,'Hunter','Evergreen',1219,'03/27/1954','$37.26');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382141,'Dalton','Smith',2284,'12/25/1974','$2.21');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382140,'Owen','Joy',505,'02/14/1874','$51.54');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382135,'Axel','Openslae',3081,'04/28/1977','$79.92');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382143,'Lawrence','Mary',6691,'05/20/1926','$54.99');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382140,'Ulric','Minstix',3969,'09/29/1923','$17.89');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382134,'Ivor','Maybottom',2582,'01/30/2002','$2.16');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382145,'Robert','Openslae',5409,'12/28/1897','$25.03');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382138,'Walker','Evergreen',5708,'12/24/1908','$86.20');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382138,'Vaughan','Jones',2762,'04/28/1992','$19.45');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382140,'Cullen','Upatree',7240,'09/20/1889','$76.45');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382142,'Jamal','Upatree',389,'01/13/1936','$13.88');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382137,'Edward','Snowball',9073,'05/24/1893','$38.78');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382142,'Hamilton','Brown',2460,'11/23/1871','$89.31');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382135,'Castor','Minstix',972,'10/25/1968','$85.58');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382142,'Cameron','Jones',9806,'06/07/1843','$21.67');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382139,'Vance','Brown',2816,'11/20/1852','$9.37');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382138,'Brandon','Brown',2552,'02/25/1864','$66.00');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382136,'Guy','Smith',23,'11/01/1879','$49.97');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382143,'Daquan','Who',9192,'10/13/1963','$20.99');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382144,'Cadman','Brown',525,'04/02/1885','$56.30');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382136,'Nero','Smith',7762,'08/21/1925','$12.40');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382141,'Erasmus','Hightop',405,'12/24/1830','$12.32');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382135,'Aquila','Mary',9269,'08/02/1864','$12.81');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382135,'Duncan','Maybottom',8744,'08/16/1852','$31.31');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382140,'Driscoll','Smith',5007,'01/24/1958','$87.82');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382133,'Reed','Evergreen',1827,'11/02/1986','$66.54');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382139,'Francis','Smith',7665,'06/09/1872','$57.30');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382142,'Rahim','Mary',8897,'08/09/2018','$48.85');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382137,'Otto','Who',4421,'12/12/1924','$41.65');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382138,'Bernard','Snowball',8472,'09/08/1999','$10.52');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382137,'Howard','Hightop',6046,'08/22/1860','$90.96');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382136,'Grady','Smith',8364,'12/22/1853','$88.72');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382135,'Gannon','Jones',5717,'02/22/1910','$40.18');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382142,'Owen','Openslae',707,'08/02/1987','$1.44');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382141,'Tucker','Openslae',4413,'06/19/1939','$53.86');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382145,'Paul','Jones',6397,'03/15/1941','$61.58');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382137,'Keane','Minstix',1819,'11/28/1817','$37.30');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382141,'Jordan','Star',3088,'07/28/1917','$50.45');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382144,'Wayne','Star',3060,'08/15/1942','$99.07');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382142,'Brandon','Smith',2231,'02/25/2008','$45.66');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382133,'Reece','Joy',4052,'02/08/1830','$8.58');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382145,'Joseph','Star',9635,'11/16/1851','$36.49');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382133,'Sean','Star',5179,'04/30/1975','$65.20');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382134,'Zeph','Smith',7445,'12/28/1870','$9.76');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382142,'Daquan','Minstix',8380,'04/09/1907','$54.89');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382142,'Hasad','Mary',9421,'01/12/2005','$41.24');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382140,'Jeremy','Brown',3265,'01/12/1960','$14.14');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382134,'Kibo','Hightop',7593,'10/28/1987','$42.17');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382142,'Cooper','Minstix',7594,'01/23/1864','$22.89');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382141,'Yoshio','Minstix',2248,'02/23/2010','$76.86');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382138,'Justin','Upatree',9424,'02/27/1914','$15.40');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382136,'Murphy','Mary',4785,'04/23/1968','$43.73');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382133,'Austin','Snowball',8487,'01/30/1880','$60.18');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382138,'Curran','Hightop',5928,'03/05/1922','$73.41');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382145,'Scott','Brown',7499,'10/06/1917','$46.61');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382145,'Moses','Evergreen',8496,'08/27/1864','$12.62');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382142,'Phillip','Maybottom',6517,'11/01/1899','$24.48');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382142,'Marshall','Minstix',3789,'09/18/2017','$24.44');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382136,'Dane','Upatree',2558,'06/12/2018','$14.73');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382143,'Justin','Minstix',1265,'06/27/1920','$76.38');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382135,'Dorian','Maybottom',3872,'12/23/2017','$7.65');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382143,'Wallace','Brown',5258,'10/19/2010','$91.14');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382134,'Levi','Hightop',9183,'08/31/1913','$10.65');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382137,'Adam','Star',1620,'05/19/1879','$83.98');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382135,'Hayes','Evergreen',8465,'10/05/1984','$91.33');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382144,'Colorado','Upatree',5358,'05/07/1957','$87.27');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382142,'Wade','Evergreen',2552,'11/06/2011','$14.97');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382138,'Ashton','Hightop',2128,'03/08/1943','$99.76');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382137,'Alan','Evergreen',8734,'05/03/1885','$43.87');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382141,'Hamilton','Smith',3472,'03/25/1882','$93.68');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382139,'George','Maybottom',973,'01/18/1956','$44.88');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382142,'Yasir','Smith',9980,'04/19/1929','$74.12');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382139,'Elliott','Who',7056,'09/13/1984','$45.79');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382144,'Richard','Smith',152,'05/15/1925','$32.41');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382137,'Timon','Openslae',160,'03/13/1982','$42.21');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382133,'Lucian','Minstix',3932,'01/24/1897','$60.53');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382144,'Wang','Brown',5096,'10/16/1984','$57.44');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382139,'Len','Maybottom',602,'01/02/1898','$21.43');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382144,'Byron','Evergreen',9472,'12/13/1988','$28.26');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382136,'Dominic','Brown',5228,'08/16/1950','$60.02');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382135,'Kuame','Minstix',7575,'05/24/1900','$34.34');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382134,'Donovan','Maybottom',4860,'11/16/1852','$60.05');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382139,'Tarik','Hightop',3258,'05/14/1833','$50.60');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382133,'Marshall','Who',1451,'12/14/1951','$34.24');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382134,'Kato','Brown',4558,'09/06/1880','$8.99');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382138,'Brock','Jones',9320,'05/22/1898','$30.83');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382133,'Leonard','Snowball',1923,'07/18/2007','$48.07');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382136,'Price','Smith',7425,'05/31/1869','$93.94');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382134,'Wang','Mary',3783,'07/16/1898','$77.75');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382144,'Gil','Evergreen',1652,'10/27/1952','$26.07');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382139,'George','Brown',5047,'11/22/1977','$82.09');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382144,'Gage','Upatree',7038,'11/07/2016','$71.90');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382143,'Mannix','Joy',2787,'03/05/1951','$40.62');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382142,'Guy','Minstix',9669,'06/16/1912','$81.17');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382142,'Rigel','Brown',7852,'07/06/1975','$90.44');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382138,'Clayton','Smith',7343,'01/18/2010','$46.48');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382134,'Ali','Snowball',6657,'07/04/1959','$75.05');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382143,'Fleur','Upatree',7159,'07/10/2014','$52.27');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382136,'Laura','Upatree',4754,'12/07/1937','$95.57');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382143,'Tasha','Mary',8162,'09/05/1817','$41.73');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382142,'Kylie','Smith',5552,'03/31/1943','$13.55');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382140,'Paloma','Maybottom',27,'08/15/1884','$23.05');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382144,'Kiona','Maybottom',1377,'05/29/1897','$7.74');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382140,'Fredericka','Evergreen',592,'02/04/1864','$73.39');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382133,'Abigail','Smith',1862,'07/02/1868','$56.00');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382134,'Amela','Snowball',5581,'04/03/1999','$1.37');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382143,'Victoria','Snowball',3007,'08/16/1980','$22.76');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382143,'Xantha','Maybottom',5344,'06/05/2009','$90.88');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382138,'Brooke','Star',3513,'02/28/1921','$7.86');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382135,'Shelly','Mary',8818,'05/01/1946','$22.83');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382133,'Yuri','Who',1498,'12/23/1990','$43.17');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382134,'Minerva','Brown',690,'03/12/2002','$56.85');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382142,'Josephine','Minstix',7250,'08/16/1847','$86.98');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382134,'Leslie','Brown',180,'04/24/1861','$79.23');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382138,'Shea','Hightop',7147,'07/26/2011','$12.98');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382133,'Melissa','Snowball',5381,'05/08/1970','$36.05');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382143,'Erin','Minstix',3500,'06/12/2008','$42.76');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382133,'Stacy','Maybottom',4617,'06/05/1984','$27.43');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382137,'Cassandra','Brown',7943,'07/22/1865','$68.67');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382139,'Freya','Smith',8572,'07/26/1978','$30.75');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382136,'Carla','Snowball',3587,'01/17/1903','$81.78');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382136,'Cherokee','Maybottom',8602,'01/14/1871','$71.48');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382142,'Aphrodite','Maybottom',7852,'10/21/1864','$4.12');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382139,'Charissa','Evergreen',9561,'05/01/1873','$25.99');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382135,'Lisandra','Jones',2941,'07/14/1904','$94.99');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382145,'Farrah','Jones',7902,'10/31/1858','$6.00');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382138,'Jana','Mary',7994,'03/12/1833','$83.21');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382143,'Alma','Minstix',9067,'09/28/1898','$15.97');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382137,'Lani','Minstix',1164,'11/03/1970','$86.89');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382134,'Farrah','Joy',3052,'08/20/1876','$9.57');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382135,'Shaeleigh','Who',4107,'01/02/2009','$71.39');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382133,'Brooke','Mary',7896,'08/11/1962','$44.82');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382140,'Bo','Upatree',7560,'02/09/1870','$93.93');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382135,'Joelle','Joy',9670,'06/07/1898','$42.32');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382134,'Maia','Minstix',4414,'09/09/1870','$38.39');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382145,'Zenia','Snowball',9192,'07/17/1942','$13.60');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382143,'Macey','Upatree',9772,'07/08/1845','$63.88');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382136,'Gwendolyn','Star',602,'05/17/1997','$32.43');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382141,'Amanda','Maybottom',949,'03/30/1856','$70.57');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382145,'Nita','Joy',2128,'12/07/1837','$17.89');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382144,'Evelyn','Snowball',7634,'10/06/1878','$77.25');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382140,'Aurelia','Minstix',9228,'04/17/1831','$64.37');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382142,'Madonna','Openslae',543,'11/01/1999','$12.73');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382135,'Yeo','Openslae',2910,'07/27/1903','$34.20');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382144,'Dorothy','Smith',6231,'02/07/1860','$66.94');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382133,'Anjolie','Minstix',5045,'11/19/1884','$60.69');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382139,'Angela','Star',8618,'11/25/1967','$48.16');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382136,'Mollie','Evergreen',399,'03/10/1990','$59.33');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382139,'Kirsten','Star',3274,'09/19/2001','$8.10');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382143,'Ignacia','Openslae',1077,'09/17/1937','$59.97');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382138,'Iona','Star',5364,'11/01/1863','$76.52');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382133,'Lani','Brown',1458,'08/05/1836','$7.98');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382141,'Jenna','Star',7669,'11/02/1933','$91.10');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382143,'Haley','Mary',6203,'11/26/1978','$22.79');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382141,'Tamara','Evergreen',7170,'01/20/1942','$40.40');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382139,'Paloma','Minstix',6620,'07/08/1867','$98.87');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382133,'Madeson','Snowball',704,'01/20/1844','$27.81');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382135,'Zoe','Upatree',7481,'11/20/1883','$98.30');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382139,'Orli','Hightop',76,'07/22/2016','$54.57');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382141,'Regan','Joy',3880,'07/03/2005','$65.71');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382135,'Claudia','Evergreen',5107,'03/03/1924','$99.30');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382141,'Michelle','Snowball',5790,'09/18/1849','$69.80');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382140,'Carissa','Who',2183,'11/10/1893','$62.28');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382140,'Aubrey','Jones',4249,'01/25/1929','$7.34');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382145,'Renee','Star',2273,'04/27/1862','$69.89');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382142,'Melodie','Snowball',787,'09/28/1949','$51.11');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382138,'Vielka','Brown',975,'11/23/1937','$83.78');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382137,'Ria','Star',3783,'09/20/2011','$79.55');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382137,'Cathleen','Maybottom',5331,'12/26/1940','$3.57');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382140,'September','Minstix',7792,'11/12/1843','$71.14');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382145,'Olympia','Joy',2725,'11/23/1926','$80.09');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382138,'Charlotte','Hightop',2377,'07/28/1882','$92.43');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382143,'Nita','Star',1747,'11/29/1885','$68.92');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382139,'Latifah','Openslae',7446,'10/29/1873','$66.53');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382144,'Alice','Evergreen',4968,'02/02/1829','$70.29');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382137,'Justine','Joy',6102,'03/13/1911','$19.81');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382142,'Maite','Smith',7199,'10/01/1895','$23.53');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382144,'Jenette','Hightop',5564,'08/02/1954','$21.89');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382133,'Nadine','Minstix',6552,'02/04/1872','$90.07');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382134,'Hilda','Mary',6058,'09/05/1964','$20.65');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382135,'Melanie','Star',8740,'05/05/1979','$0.33');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382143,'Briar','Maybottom',6837,'02/23/1894','$75.89');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382141,'Dorothy','Mary',5779,'12/31/1937','$41.16');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382134,'Sierra','Maybottom',2525,'05/02/1911','$45.93');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382143,'Rhonda','Who',6325,'07/05/1929','$45.36');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382143,'Lunea','Mary',3875,'02/08/1872','$16.42');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382139,'Morgan','Jones',9392,'06/29/1956','$76.44');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382141,'Jeanette','Minstix',2604,'04/05/1959','$82.58');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382143,'Emi','Openslae',3072,'09/11/1892','$71.69');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382141,'Neve','Mary',6207,'10/15/1944','$51.00');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382133,'Doris','Smith',3318,'03/30/1920','$63.11');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382144,'Irma','Minstix',8346,'11/13/1849','$92.50');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382145,'Aline','Maybottom',3687,'10/27/1928','$32.65');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382139,'Paloma','Maybottom',6558,'08/15/2000','$44.20');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382144,'Iona','Hightop',4335,'05/18/1923','$0.28');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382143,'Judith','Hightop',701,'11/20/1898','$64.33');
INSERT INTO "staff" (department_id,first_name,last_name,age,hire_date,hourly_rate) VALUES (382141,'Kimberley','Openslae',2083,'03/27/1825','$51.15');

------------wrapping_schemes Table
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Blue','Gingerbread Men','Indigo','Small');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Indigo','Stripes','Pink','X-Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Pink','Jingle Bells','Pink','Medium');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Pink','Candy Canes','Black','X-Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Black','Santa','Black','Small');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Black','Snowflakes','Indigo','Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Yellow','Jingle Bells','Brown','Medium');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Indigo','SnowGlobes','Indigo','X-Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Pink','Snowmen','Pink','Medium');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Orange','Gingerbread Men','Yellow','Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Green','Jingle Bells','Red','Small');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('White','Christmas Trees','Violet','Medium');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Indigo','SnowGlobes','White','X-Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Green','Christmas Trees','Green','X-Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Brown','SnowGlobes','Purple','X-Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Black','Stars','Red','Medium');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Red','Stripes','Red','Small');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Brown','Ornaments','Pink','X-Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Indigo','Stockings','Violet','Medium');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Pink','Jingle Bells','Orange','X-Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Violet','Christmas Trees','Red','Small');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Indigo','Santa','Pink','Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Green','Snowmen','Pink','Medium');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Red','Reindeer','Blue','X-Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Green','Reindeer','Orange','Medium');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('White','Reindeer','Indigo','Small');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Purple','Candy Canes','Indigo','Small');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Violet','Christmas Trees','White','Medium');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Red','SnowGlobes','Pink','X-Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Black','Stripes','Black','Medium');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Orange','Snowmen','Indigo','X-Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Blue','Snowflakes','Violet','X-Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('White','SnowGlobes','Green','Medium');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Purple','SnowGlobes','Violet','Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('White','Snowmen','Pink','Small');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Black','Reindeer','White','Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Purple','Ornaments','Yellow','Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Black','Elves','Black','Small');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Purple','Stripes','Pink','Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Brown','Jingle Bells','Yellow','Medium');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Purple','Santa','Yellow','Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Black','Christmas Trees','Pink','Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Purple','Santa','Yellow','Medium');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Blue','Snowmen','Blue','Medium');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Blue','Christmas Trees','Violet','Small');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Orange','Reindeer','Brown','Medium');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Violet','Jingle Bells','Yellow','Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Pink','Elves','Violet','Small');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Pink','Jingle Bells','Black','X-Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Purple','Reindeer','Violet','Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Brown','Elves','Black','Small');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Violet','Jingle Bells','Brown','X-Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('White','Stockings','Brown','X-Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Purple','Snowflakes','Yellow','Small');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('White','Stars','Orange','Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Black','Candy Canes','Pink','Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Blue','Snowflakes','Blue','X-Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Blue','Stars','Blue','Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Blue','Christmas Trees','Black','Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Indigo','Santa','Violet','Medium');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Green','Elves','Brown','Medium');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('White','Stars','Indigo','X-Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Pink','Stripes','Indigo','X-Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Green','SnowGlobes','Green','Medium');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Indigo','SnowGlobes','Yellow','Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('White','Stockings','Purple','Medium');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Green','Elves','Blue','Small');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('White','Stars','Blue','Small');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('White','Christmas Trees','Black','X-Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Red','Snowmen','Purple','Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Pink','Stripes','Black','Medium');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Indigo','Snowmen','Purple','Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Pink','Snowflakes','Pink','X-Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Black','SnowGlobes','Brown','Small');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Pink','Reindeer','Purple','Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Green','Ornaments','Indigo','X-Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Indigo','Stockings','Black','Small');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Brown','Santa','White','Medium');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Pink','Stockings','Red','Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('White','SnowGlobes','Black','Medium');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Yellow','Candy Canes','Black','Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('White','Gingerbread Men','Blue','X-Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Violet','Santa','Purple','X-Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Blue','Snowmen','Brown','X-Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Pink','Stars','Pink','Small');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Yellow','Jingle Bells','Green','Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Black','Reindeer','Orange','Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('White','Stockings','Blue','Small');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Blue','Snowmen','Violet','X-Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Purple','Snowflakes','Black','Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Blue','Gingerbread Men','Blue','X-Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Violet','Stockings','Yellow','Medium');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('White','Snowflakes','Brown','Medium');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Purple','Elves','Green','Small');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Green','Candy Canes','Red','X-Large');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Indigo','Stockings','Orange','Small');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Purple','SnowGlobes','Indigo','Small');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Violet','Stockings','Indigo','Small');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Black','Ornaments','White','Small');
INSERT INTO "wrapping_schemes" (wrapping_color,wrapping_pattern,ribbon_color,box_size) VALUES ('Indigo','Christmas Trees','Violet','Large');

--------------------------Foreign Keys--------------------------

ALTER TABLE delivered
ADD CONSTRAINT delivered_gift_id_fkey FOREIGN KEY (gift_id)
    REFERENCES gifts (gift_id) MATCH SIMPLE
    ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE delivered
ADD CONSTRAINT delivered_lead_reindeer_fkey FOREIGN KEY (lead_reindeer)
    REFERENCES reindeer (reindeer_id) MATCH SIMPLE
    ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE gifts
ADD CONSTRAINT gifts_elf_id_fkey FOREIGN KEY (elf_id)
    REFERENCES staff (elf_id) MATCH SIMPLE
    ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE gifts
ADD CONSTRAINT gifts_item_id_fkey FOREIGN KEY (item_id)
    REFERENCES inventory (item_id) MATCH SIMPLE
    ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE gifts
ADD CONSTRAINT gifts_kid_id_fkey FOREIGN KEY (kid_id)
    REFERENCES kids (kid_id) MATCH SIMPLE
    ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE gifts
ADD CONSTRAINT gifts_wrapping_id_fkey FOREIGN KEY (wrapping_id)
    REFERENCES wrapping_schemes (wrapping_id) MATCH SIMPLE
    ON UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE head_elves
ADD CONSTRAINT head_elves_elf_id_fkey FOREIGN KEY (elf_id)
    REFERENCES staff (elf_id) MATCH SIMPLE
    ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE inventory
ADD CONSTRAINT inventory_factory_id_fkey FOREIGN KEY (factory_id)
    REFERENCES factories (factory_id) MATCH SIMPLE
    ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE kid_logs
ADD CONSTRAINT kid_logs_kid_id_fkey FOREIGN KEY (kid_id)
  REFERENCES kids (kid_id) MATCH SIMPLE
  ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE kids
ADD CONSTRAINT kids_address_id_fkey FOREIGN KEY (address_id)
    REFERENCES addresses (address_id) MATCH SIMPLE
    ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE letters
ADD CONSTRAINT letters_kid_id_fkey FOREIGN KEY (kid_id)
    REFERENCES kids (kid_id) MATCH SIMPLE
    ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE staff
ADD CONSTRAINT staff_department_id_fkey FOREIGN KEY (department_id)
    REFERENCES departments (department_id) MATCH SIMPLE
    ON UPDATE CASCADE ON DELETE CASCADE;

-------------------------Views-------------------------------

------------america_gift_status
create or replace view america_gift_status
  as
    select distinct k.first_name, k.last_name, d.time_delivered
    from kids as k, gifts as g, addresses as a, delivered as d
    where g.gift_id in (select gift_id from delivered)
    AND (k.kid_id = g.kid_id)
    AND (g.gift_id = d.gift_id)
    AND (k.address_id = a.address_id)
    AND (a.country LIKE '%United States%')
    order by k.last_name;

------------gifts_per_kid
create or replace view gifts_per_kid
  as
  SELECT k.kid_id, k.first_name,k.last_name,k.age, COUNT(g.gift_id) AS number_of_gifts
  FROM kids as k INNER JOIN gifts as g ON k.kid_id = g.kid_id
  GROUP BY k.kid_id
  ORDER by number_of_gifts desc;

------------head_elves_info
create or replace view head_elves_info
  as
    select distinct s.first_name, s.last_name, h.title, d.department_name, s.hourly_rate
    from staff as s, head_elves as h, departments as d
    where s.elf_id in (select elf_id from head_elves)
    AND (s.department_id = d.department_id)
    AND (s.elf_id = h.elf_id)
    order by s.last_name;

------------item_gifted_amount
create or replace view item_gifted_amount
  as
  SELECT i.item_id, i.item_name,i.item_description, COUNT(g.item_id) AS item_gifted_amount
  FROM inventory as i INNER JOIN gifts as g ON i.item_id = g.item_id
  GROUP BY i.item_id
  ORDER by item_gifted_amount desc;

------------kids_wishes
create or replace view kids_wishes
  as
  SELECT k.kid_id, k.first_name,k.last_name, k.age, l.wishes
  FROM kids as k INNER JOIN letters as l ON k.kid_id = l.kid_id
  GROUP BY k.kid_id, l.wishes
  ORDER by k.last_name;

------------not_sent_letters
create or replace view not_sent_letters
as select distinct k.kid_id, k.first_name, k.last_name, a.country
from kids as k, addresses as a
where k.kid_id not in
(select l.kid_id from letters as l) And
(a.address_id = k.address_id)
order by k.last_name;

------------verdict_occurences
create or replace view verdict_occurences
  as
  SELECT k.first_name,k.last_name, COUNT(k.kid_id) AS times_switched
  FROM kids as k INNER JOIN kid_logs kl ON k.kid_id = kl.kid_id
  GROUP BY k.kid_id
  ORDER by times_switched desc;

-------------------------Stored Procedures-------------------------------

------------get_gift_info(kid_first_name, kid_last_name, recursor_name) Function (Procedure)
CREATE OR REPLACE FUNCTION get_gift_info (TEXT, TEXT, REFCURSOR) RETURNS refcursor AS
$$
DECLARE
  input_one TEXT := $1;
  input_two TEXT := $2;
  resultSet REFCURSOR := $3;
BEGIN
  OPEN resultset FOR

    select k.first_name, k.last_name, i.item_name as Item, s.first_name as Packaged_By, w.box_size as Box_Size
    from gifts as g, kids as k, inventory as i, staff as s, wrapping_schemes as w
    where
      (g.kid_id = k.kid_id) AND
      (g.item_id = i.item_id) AND
      (g.elf_id = s.elf_id) AND
      (g.wrapping_id = w.wrapping_id) AND
      k.first_name LIKE input_one AND
      k.last_name LIKE input_two
      order by k.last_name;

    return resultSet;
end;
$$
LANGUAGE plpgsql;

------------get_elf_gift_sum(elf_first_name, elf_last_name, recursor_name) Function (Procedure)
CREATE OR REPLACE FUNCTION get_elf_gift_sum (TEXT, TEXT, REFCURSOR) RETURNS refcursor AS
$$
DECLARE
  input_one TEXT := $1;
  input_two TEXT := $2;
  resultSet REFCURSOR := $3;
BEGIN
  OPEN resultset FOR

    select s.first_name, s.last_name, COUNT(g.gift_id) as Packaged
    from staff as s
    inner join  gifts as g on s.elf_id = g.elf_id
    where
      s.first_name LIKE input_one AND
      s.last_name LIKE input_two
    group by s.first_name, s.last_name
    order by s.last_name;

    return resultSet;
end;
$$
LANGUAGE plpgsql;


--------------------------Trigger Functions--------------------------

------------log_verdict_changes() Trigger Function
CREATE OR REPLACE FUNCTION log_verdict_changes()
  RETURNS trigger AS
$BODY$
BEGIN
  IF NEW.verdict <> OLD.verdict THEN
  INSERT INTO kid_logs(kid_id,changed_to,changed_on)
  VALUES(OLD.kid_id,NEW.verdict,now());
END IF;

  RETURN NEW;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;


------------hourly_rate_changes Trigger Function
CREATE OR REPLACE FUNCTION hourly_rate_changes()
  RETURNS trigger AS
$BODY$
BEGIN
 IF NEW.hourly_rate <> OLD.hourly_rate AND NEW.hourly_rate > OLD.hourly_rate THEN
 UPDATE head_elves SET promotion_date = now() WHERE elf_id = OLD.elf_id;
 END IF;

 RETURN NEW;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

--------------------------Triggers--------------------------

------------verdict_changes Trigger
CREATE TRIGGER verdict_changes
  BEFORE UPDATE
  ON kids
  FOR EACH ROW
  EXECUTE PROCEDURE log_verdict_changes();

------------rate_changes Trigger
CREATE TRIGGER rate_changes
  BEFORE UPDATE
  ON staff
  FOR EACH ROW
  EXECUTE PROCEDURE hourly_rate_changes();

--------------------------Sample Data for kid_log--------------------------
UPDATE kids SET verdict = 'Naughty' WHERE kid_id = 447767;
UPDATE kids SET verdict = 'Naughty' WHERE kid_id = 447768;
UPDATE kids SET verdict = 'Naughty' WHERE kid_id = 447771;
UPDATE kids SET verdict = 'Naughty' WHERE kid_id = 447775;
UPDATE kids SET verdict = 'Naughty' WHERE kid_id = 447777;
UPDATE kids SET verdict = 'Naughty' WHERE kid_id = 447779;
UPDATE kids SET verdict = 'Naughty' WHERE kid_id = 447866;
UPDATE kids SET verdict = 'Nice' WHERE kid_id = 447866;
UPDATE kids SET verdict = 'Nice' WHERE kid_id = 447769;
UPDATE kids SET verdict = 'Nice' WHERE kid_id = 447770;
UPDATE kids SET verdict = 'Nice' WHERE kid_id = 447773;
UPDATE kids SET verdict = 'Nice' WHERE kid_id = 447776;
UPDATE kids SET verdict = 'Nice' WHERE kid_id = 447778;
UPDATE kids SET verdict = 'Nice' WHERE kid_id = 447783;
UPDATE staff SET hourly_rate = '$100.00' WHERE elf_id = 100020;
UPDATE staff SET hourly_rate = '$100.00' WHERE elf_id = 100000;


-------------------------------Security------------------------------------
create role santa;
grant all on all tables in schema public to santa;

create role head_elf;
grant SELECT, INSERT on letters to head_elf;
grant SELECT on kid_logs to head_elf;
grant SELECT, INSERT on kids to head_elf;
grant SELECT on departments to head_elf;
grant SELECT on factories to head_elf;
grant SELECT on reindeer to head_elf;
grant SELECT, INSERT, UPDATE, DELETE on addresses to head_elf;
grant SELECT, INSERT, UPDATE, DELETE on gifts to head_elf;
grant SELECT, INSERT, UPDATE, DELETE on wrapping_schemes to head_elf;
grant SELECT, INSERT, UPDATE, DELETE on delivered to head_elf;
grant SELECT, INSERT, UPDATE, DELETE on inventory to head_elf;

create role elf;
grant SELECT on letters to elf;
grant SELECT on kid_logs to elf;
grant SELECT on kids to elf;
grant SELECT on addresses to elf;
grant SELECT on wrapping_schemes to elf;
grant SELECT on departments to elf;
grant SELECT on delivered to elf;
grant SELECT on factories to elf;
grant SELECT on reindeer to elf;
grant SELECT, INSERT, UPDATE on gifts to elf;
grant SELECT, INSERT, UPDATE on inventory to elf;
