/* Database schema to keep the structure of entire database. */

/*************** Project 1 ****************/
CREATE DATABASE vet_clinic;

CREATE TABLE animals(
    id INT GENERATED BY DEFAULT AS IDENTITY,
    name varchar(50),
    date_of_birth date,
    escape_attempts INT,
    neutered bool,
    weight_kg decimal
);

ALTER TABLE animals ADD COLUMN species TEXT;

CREATE TABLE owners (
  id SERIAL PRIMARY KEY,
  full_name VARCHAR(255),
  age INTEGER
);

CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

ALTER TABLE animals
	ADD PRIMARY KEY (id);

ALTER TABLE animals
     DROP COLUMN species;

ALTER TABLE animals
    ADD COLUMN species_id INT,
    ADD CONSTRAINT fk_species
        FOREIGN KEY (species_id)
        REFERENCES species (id);

ALTER TABLE animals
    ADD COLUMN owner_id INT,
    ADD CONSTRAINT fk_owners
        FOREIGN KEY (owner_id)
        REFERENCES owners (id);

/*********** Project 4 **************/

CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    age INTEGER,
    date_of_graduation DATE
);

CREATE TABLE specializations (
    vet_id INT,
    species_id INT,
    FOREIGN KEY (vet_id) REFERENCES vets (id),
    FOREIGN KEY (species_id) REFERENCES species (id)
);

CREATE TABLE visits (
    animal_id INT,
    vet_id INT,
    visit_date DATE,
    FOREIGN KEY (animal_id) REFERENCES animals (id),
    FOREIGN KEY (vet_id) REFERENCES vets (id)
);
