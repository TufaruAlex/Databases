DELETE FROM Issues
DELETE FROM Series
DELETE FROM Publishers
DELETE FROM Writers
DELETE FROM Artists
delete from Characters
delete from Issues_and_Characters
delete from Characters_and_Creators

INSERT INTO Publishers(id,name,founding_year,number_of_series,number_of_issues,creator) VALUES
(1, 'Marvel', 1939, 10814, 55986, 'Martin Goodman'),
(2, 'DC', 1935, 8906, 54209, 'Malcolm Wheeler-Nicholson'),
(3, 'Dark Horse', 1986, 3773, 11857, 'Mike Richardson'),
(4, 'Image Comics', 1992, 3287, 14884, 'Erik Larsen')

INSERT INTO Series(id, name, number_of_issues, publication_type, is_singleton, begin_date, end_date, country, language, indicia_frequency, publisher, genre) VALUES
(1, 'Doctor Strange and the Sorcerers Supreme', 12, NULL, 0, '2016-10-26', '2017-11-13', 'United States', 'english', 'monthly', 1, 'fantasy'),
(2, 'Batman: Year One', 1, 'book', 1, '1988-06-16', '1988-06-16', 'United States', 'english', 'one-shot', 2, 'drama'),
(3, 'Spider-Man: Life Story', 6, NULL, 0, '2019-03-20', '2019-08-28', 'United States', 'english', 'monthly', 1, 'action')

INSERT INTO Writers(id, first_name, last_name, pseudonym, date_of_death, date_of_birth) VALUES
(1, 'Robbie', 'Thompson', NULL, NULL, NULL),
(2, 'Frank', 'Miller', NULL, NULL, NULL),
(3, 'Chip', 'Zdarsky', NULL, NULL, '1975 December 21'),
(4, 'Stan', 'Lee', NULL, '2018 November 12', '1922 December 28'),
(5, 'Steve', 'Ditko', NULL, '2018 June 29', '1927 November 2'),
(6, 'Milton', 'Finger', 'Bill Finger', '1974 January 18', '1914 February 8')

INSERT INTO Artists(id, first_name, last_name, pseudonym) VALUES
(1, 'Rafael', 'Albuquerque', NULL),
(2, 'John', 'Rauch', NULL),
(3, 'Joe', 'Caramagna', NULL),
(4, 'Javier', 'Rodriguez', NULL),
(5, 'Alvaro', 'Lopez', NULL),
(6, 'Jordie', 'Bellaire', NULL),
(7, 'Nathan', 'Stockman', NULL),
(8, 'Tamra', 'Bonvillain', NULL),
(9, 'David', 'Mazzucchelli', NULL),
(10, 'Richmond', 'Lewis', NULL),
(11, 'Todd', 'Klein', NULL),
(12, 'Frank', 'Miller', NULL),
(13, 'Steve', 'Ditko', NULL),
(14, 'Robert', 'Kahn', 'Bob Kane')


INSERT INTO Issues(id, title, series_id, issue_number, publication_date, price, page_count, writer_id, penciler_id, inker_id, colorist_id, letterer_id, editor_id) VALUES
(1, 'Doctor Strange and the Sorcerers Supreme #1', 1, 1, '2016-10-26', '3.99', NULL, 1, 1, 1, 2, 3, NULL),
(2, 'Doctor Strange and the Sorcerers Supreme #2', 1, 2, '2016-11-23', '3.99', NULL, 1, 4, 5, 6, 3, NULL),
(3, 'Doctor Strange and the Sorcerers Supreme #3', 1, 3, '2016-12-28', '3.99', NULL, 1, 4, 5, 6, 3, NULL),
(4, 'Doctor Strange and the Sorcerers Supreme #4', 1, 4, '2017-01-11', '3.99', 36, 1, 4, 5, 6, NULL, NULL),
(5, 'Doctor Strange and the Sorcerers Supreme #5', 1, 5, '2017-02-08', '3.99', 36, 1, 7, 7, 8, NULL, NULL),
(6, 'Batman: Year One', 2, 1, '1988-06-16', '9.95', 108, 2, 9, 9, 10, 11, NULL),
(7, 'Chapter One: The War at Home', 3, 1, '2019-03-20', '4.99', 33, 3, NULL, NULL, NULL, NULL, NULL)

insert into Characters(id, name, alias, first_appearance, universe) values
(1, 'Dr. Stephen Vincent Strange', 'Doctor Strange', 'Strange Tales #110 (April, 1963)', 'Earth 616'),
(2, 'Bruce Wayne', 'Batman', 'Detective Comics #27 (1939)', 'Earth 1'),
(3, 'Peter Parker', 'Spider-Man', 'Amazing Fantasy #15 (June, 1962)', 'Earth 616')

insert into Issues_and_Characters(issue_id, character_id) values
(1,1),
(2,1),
(3,1),
(4,1),
(5,1),
(6,2),
(7,3),
(1,2),
(7,1),
(1,3)

insert into Characters_and_Creators(character_id, creator_id) values
(1,4),
(1,5),
(2,6),
(3,4),
(3,5)

/*INSERT INTO Series VALUES
(3, 'Thor: God of Thunder', 27, 'magazine', 0, 'January 2013', 'November 2014', 'United States', 'english', 'monthly', 5, 'fantasy')
*/
update Issues
set page_count=32 
where page_count is null;

update Writers
set date_of_birth='1957-01-27'
where id=2;

update Issues
set letterer_id=3
where title like 'Doctor%' and page_count=36;

update Series
set publication_type='magazine'
where genre in ('fantasy', 'action');

delete from Publishers
where number_of_series between 3000 and 3800;

delete from Issues
where issue_number=5;

INSERT INTO Publishers(id,name,founding_year,number_of_series,number_of_issues,creator) VALUES
(3, 'Dark Horse', 1986, 3773, 11857, 'Mike Richardson'),
(4, 'Image Comics', 1992, 3287, 14884, 'Erik Larsen')

SELECT * FROM Series
SELECT * FROM Writers
SELECT * FROM Publishers
SELECT * FROM Artists
SELECT * FROM Issues
select * from Characters