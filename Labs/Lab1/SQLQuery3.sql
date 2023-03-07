/*
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

CREATE TABLE Series(
	id int NOT NULL,
	name VARCHAR(100) NOT NULL,
	number_of_issues int NOT NULL,
	publication_type VARCHAR(8),
	is_singleton BIT,
	begin_date DATE,
	end_date DATE,
	country VARCHAR(30),
	language VARCHAR(30),
	indicia_frequency VARCHAR(30),
	publisher VARCHAR(50),
	genre VARCHAR(30),
	PRIMARY KEY(id)
);

CREATE TABLE Editors(
	id INT NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	date_of_birth DATE NOT NULL,
	date_of_death DATE,
	awards VARCHAR(100),
	PRIMARY KEY(id)
);

CREATE TABLE Issues(
	id INT NOT NULL,
	title VARCHAR(30) NOT NULL,
	series_id INT NOT NULL,
	issue_number INT,
	publication_date DATE NOT NULL,
	price SMALLMONEY NOT NULL,
	page_count INT NOT NULL,
	writer_id INT NOT NULL,
	penciler_id INT,
	inker_id INT,
	colorist_id INT,
	letterer_id INT,
	editor_id INT,
	PRIMARY KEY(id),
	FOREIGN KEY(series_id)
		REFERENCES Series(id),
	FOREIGN KEY(writer_id)
		REFERENCES Writers(id),
	FOREIGN KEY(penciler_id)
		REFERENCES Artists(id),
	FOREIGN KEY(inker_id)
		REFERENCES Artists(id),
	FOREIGN KEY(colorist_id)
		REFERENCES Artists(id),
	FOREIGN KEY(letterer_id)
		REFERENCES Artists(id),
	FOREIGN KEY(editor_id)
		REFERENCES Editors(id)
);

CREATE TABLE Characters(
	id INT NOT NULL,
	name VARCHAR(30) NOT NULL,
	alias VARCHAR(30),
	first_appearance INT NOT NULL,
	universe VARCHAR(30) NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(first_appearance)
		REFERENCES Issues(id)
);

CREATE TABLE Publishers(
	id INT NOT NULL,
	name VARCHAR(30) NOT NULL,
	founding_year INT NOT NULL,
	number_of_series INT NOT NULL,
	number_of_issues INT NOT NULL,
	creator VARCHAR(30),
	PRIMARY KEY(id)
);

CREATE TABLE Graphic_novels(
	id int not null,
	name varchar(30) not null,
	author int not null,
	publication_date DATE NOT NULL,
	price SMALLMONEY NOT NULL,
	page_count INT NOT NULL,
	penciler_id INT,
	inker_id INT,
	colorist_id INT,
	letterer_id INT,
	editor_id INT,
	PRIMARY KEY(id),
	FOREIGN KEY(author)
		REFERENCES Writers(id),
	FOREIGN KEY(penciler_id)
		REFERENCES Artists(id),
	FOREIGN KEY(inker_id)
		REFERENCES Artists(id),
	FOREIGN KEY(colorist_id)
		REFERENCES Artists(id),
	FOREIGN KEY(letterer_id)
		REFERENCES Artists(id),
	FOREIGN KEY(editor_id)
		REFERENCES Editors(id)
);

CREATE TABLE Issues_and_Characters(
	issue_id INT NOT NULL,
	character_id INT NOT NULL
);

CREATE TABLE Characters_and_Creators(
	character_id INT NOT NULL,
	creator_id INT NOT NULL,
	FOREIGN KEY(character_id)
		REFERENCES Characters(id),
	FOREIGN KEY(creator_id)
		REFERENCES Writers(id),
	FOREIGN KEY(creator_id)
		REFERENCES Artists(id)
);

ALTER TABLE Series
ADD FOREIGN KEY(publisher) REFERENCES Publishers(id)*/

