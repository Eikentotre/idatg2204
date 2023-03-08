## Assignment 3 - Andesei
### Task 1
Clarification:
- Seeing as the Submission instructions ask for 'the SQL statements I am using to create the corresponding tables in MySQL (Task 1)', I will not be including the relational schema for the database. 
#### Creating and inserting into Pharmacies, PharmacyCompany, drug, contracts, soldby and sells
``` SQL
CREATE TABLE Pharmacies (
  phone VARCHAR(20) NOT NULL,
  name VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  street VARCHAR(255) NOT NULL,
  city VARCHAR(255) NOT NULL,
  PRIMARY KEY (phone)
);

INSERT INTO Pharmacies (phone, name, address, street, city)
VALUES ('54327612', 'City Drug', '36 South Cherry', 'Starkville', 'MS 39759');
INSERT INTO Pharmacies (phone, name, address, street, city)
VALUES ('87435217', 'Pill Pack', '29 E. Pine Lane', 'Stuart', 'FL 34997');
INSERT INTO Pharmacies (phone, name, address, street, city)
VALUES ('98463251', 'Better Life', '8004 Eagle St.', 'Sarasota', 'FL 34231');
INSERT INTO Pharmacies (phone, name, address, street, city)
VALUES ('45362819', 'Pharma Best', '15 Williams Drive', 'Elgin', 'IL 60120');
INSERT INTO Pharmacies (phone, name, address, street, city)
VALUES ('87340213', 'Be Well', '790 Clay Road', 'Ooltewah', 'TN 37363');
INSERT INTO Pharmacies (phone, name, address, street, city)
VALUES ('35446281', 'Absolute Care', '39 Spruce Drive', 'Charlottesville', 'VA 22901');


CREATE TABLE PharmacyCompany (
  name VARCHAR(255) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  PRIMARY KEY (name)
);

INSERT INTO PharmacyCompany (name, phone) VALUES ('Janson & Janson', '23749912'), ('Pfizer', '45732810'), ('Bayer', '88374291'), ('Roche', '66372910'), ('Abbott', '66392014'), ('Allergan', '47639201'), ('CSL', '84192200'), ('Vertex Pharmaceuticals', '91228345');


CREATE TABLE Drug (
  trademark VARCHAR(255) NOT NULL,
  formula VARCHAR(255) NOT NULL,
  PRIMARY KEY (trademark)
);

INSERT INTO Drug (trademark, formula) VALUES 
('Ultram', 'tramadol'),
('Advil', 'ibuprofen'),
('Aleve', 'naproxen'),
('Bayer Aspirin', 'aspirin'),
('Zipsor', 'diclofenac'),
('Irenka', 'duloxetine'),
('Myoflex', 'Trolamine salicylate');



CREATE TABLE Contracts (
  Company_name VARCHAR(255) NOT NULL,
  Pharmacy_phone VARCHAR(10) NOT NULL,
  FOREIGN KEY (Company_name) REFERENCES PharmacyCompany(name),
  FOREIGN KEY (Pharmacy_phone) REFERENCES pharmacies(phone)
);
-- Two foreign key constraints are added to this table to enforce referential integrity. The 'Company_name' column is a foreign key that references the 'name' column of the 'PharmacyCompany' table, and the 'Pharmacy_phone' column is a foreign key that references the 'phone' column of the 'pharmacies' table. Somehow, I am not able to make this work. Therefore, I chose to do the following instead:

CREATE TABLE Contracts (
    Company_name VARCHAR(255) NOT NULL,
    Pharmacy_phone VARCHAR(10) NOT NULL
);
-- And;
ALTER TABLE Contracts ADD FOREIGN KEY (Company_name) REFERENCES PharmacyCompany (name);
ALTER TABLE Contracts ADD FOREIGN KEY (Pharmacy_phone) REFERENCES pharmacies (phone);

INSERT INTO Contracts (Company_name, Pharmacy_phone) VALUES ('Janson & Janson', '54327612'), ('Janson & Janson', '54327612'), ('Pfizer', '54327612'), ('Bayer', '87340213'), ('Roche', '35446281'), ('CSL', '98463251'), ('Abbott', '87340213'), ('Vertex Pharmaceuticals', '87340213'), ('Allergan', '98463251'), ('Allergan', '35446281');

-- Didn't work untill I removed the foreign key constraint with 'ALTER TABLE Contracts DROP FOREIGN KEY Contracts_ibfk_2;' and added it again.


CREATE TABLE Soldby (
  Company_name VARCHAR(50) NOT NULL,
  trademark VARCHAR(50) NOT NULL,
  FOREIGN KEY (Company_name) REFERENCES PharmacyCompany(name),
  FOREIGN KEY (trademark) REFERENCES Drug(trademark)
);

INSERT INTO Soldby (Company_name, trademark) VALUES 
('Janson & Janson', 'Ultram'),
('Janson & Janson', 'Aleve'),
('Janson & Janson', 'Zipsor'),
('Janson & Janson', 'Myoflex'),
('Pfizer', 'Ultram'),
('Pfizer', 'Zipsor'),
('Bayer', 'Bayer Aspirin'),
('Roche', 'Irenka'),
('CSL', 'Ultram'),
('Abbott', 'Aleve'),
('Vertex Pharmaceuticals', 'Irenka'),
('Allergan', 'Advil');



CREATE TABLE Sells (
  Pharmacy_phone VARCHAR(20) NOT NULL,
  trademark VARCHAR(50) NOT NULL,
  Company_name VARCHAR(50) NOT NULL
);


INSERT INTO Sells (Pharmacy_phone, trademark, Company_name) VALUES 
('54327612', 'Ultram', 'Pfizer'),
('54327612', 'Aleve', 'Abbott'),
('87340213', 'Aleve', 'Abbott'),
('35446281', 'Advil', 'Allergan'),
('98463251', 'Advil', 'Allergan'),
('35446281', 'Irenka', 'Vertex Pharmaceuticals');


ALTER TABLE Sells ADD FOREIGN KEY (Pharmacy_phone) REFERENCES Pharmacy(phone);
ALTER TABLE Sells ADD FOREIGN KEY (trademark) REFERENCES Drug(trademark);
ALTER TABLE Sells ADD FOREIGN KEY (Company_name) REFERENCES PharmacyCompany(name);

-- I do not see what's wrongly formed here. 

```


### Task 2

Is there any use of having both limo_id and limo_registration? They are both unique for each limo.

1. The primary key of the table would be limo_id/limo_registration/driver_id/driver_name, journey_date, start_time in order to specify that the one driver or limo is driving at a specific date and time.
2. The functional dependencies of the table: 
		- Both price and limo_capacity is dependent on class
		- driver_name is dependent on driver_id
		- limo_id is dependent on limo_registration
3. The relation is in 1NF because it contains redundant data. In order for it to be 2NF, the data would have to be separated into different tables for the limos, drivers and journeys, and would need foreign keys to establish relationships between them and the journey table. 
4.  3NF: 
	**Limos:**
	- limo_registration 
	- limo_capacity
	**Drivers**:
	- id (PK)
	- name
	**Journeys**:
	- id (PK)
	- journey_date
	- limo_registration (FK)
	- driver_id (FK)
	- class
	- price (NOK)
5. There are no partial dependencies, so the table is in BCNF. 