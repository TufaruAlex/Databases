CREATE TABLE Users(
	id int not null,
	first_name varchar(30) not null,
	last_name varchar(30) not null,
	address varchar(100),
	PRIMARY KEY(id)
);

CREATE TABLE Books(
	id int not null,
	title varchar(30),
	author varchar(30),
	published_date datetime,
	PRIMARY KEY(id)
);

CREATE TABLE Reviews(
	id int NOT NULL,
	book_id int NOT NULL,
	reviewer_name varchar(100),
	content varchar(255),
	rating int,
	published_date datetime,
	PRIMARY KEY(id),
	FOREIGN KEY(book_id)
		REFERENCES Books(id)
		ON DELETE CASCADE
);