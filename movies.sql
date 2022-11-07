CREATE TABLE directors (
	movie_id int(45) NOT NULL,
	person_id int(45) NOT NULL
);

CREATE TABLE movies (
	id int(45),
	title varchar(45) NOT NULL,
	year date,
	PRIMARY KEY(id)
);

CREATE TABLE people (
	id int(45) NOT NULL,
	name varchar(45) NOT NULL,
	birth date,
	PRIMARY KEY(id)
);

CREATE TABLE ratings (
	movie_id int(45) NOT NULL,
	rating float NOT NULL,
	votes int(45) NOT NULL
);

CREATE TABLE stars (
	movie_id int(45) NOT NULL,
	person_id itn(45) NOT NULL
);

ALTER TABLE directors ADD CONSTRAINT directors_fk0 FOREIGN KEY (movie_id) REFERENCES movies(id);
ALTER TABLE directors ADD CONSTRAINT directors_fk1 FOREIGN KEY (person_id) REFERENCES people(id);
ALTER TABLE ratings ADD CONSTRAINT ratings_fk0 FOREIGN KEY (movie_id) REFERENCES movies(id);
ALTER TABLE stars ADD CONSTRAINT stars_fk0 FOREIGN KEY (movie_id) REFERENCES movies(id);
ALTER TABLE stars ADD CONSTRAINT stars_fk1 FOREIGN KEY (person_id) REFERENCES people(id);