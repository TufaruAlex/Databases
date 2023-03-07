CREATE TABLE Writer(
	id int NOT NULL,
	first_name varchar(30) NOT NULL,
	last_name varchar(30) NOT NULL,
	writing_style varchar(30) NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE Artist(
	id int NOT NULL,
	first_name varchar(30) NOT NULL,
	last_name varchar(30) NOT NULL,
	specialty varchar(30) NOT NULL,
	PRIMARY KEY(id)
);

