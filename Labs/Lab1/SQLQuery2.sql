/*CREATE TABLE Editors(
	id INT NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	date_of_birth DATE NOT NULL,
	date_of_death DATE,
	awards VARCHAR(100),
	PRIMARY KEY(id)
);*/

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
		REFERENCES Series(id)
		ON DELETE CASCADE,
	FOREIGN KEY(writer_id)
		REFERENCES Writers(id)
		ON DELETE CASCADE,
	FOREIGN KEY(penciler_id)
		REFERENCES Artists(id)
		ON DELETE CASCADE,
	FOREIGN KEY(inker_id)
		REFERENCES Artists(id)
		ON DELETE CASCADE,
	FOREIGN KEY(colorist_id)
		REFERENCES Artists(id)
		ON DELETE CASCADE,
	FOREIGN KEY(letterer_id)
		REFERENCES Artists(id)
		ON DELETE CASCADE,
	FOREIGN KEY(editor_id)
		REFERENCES Editors(id)
		ON DELETE CASCADE,
);