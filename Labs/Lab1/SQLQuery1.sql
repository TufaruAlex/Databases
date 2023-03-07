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