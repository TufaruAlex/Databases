select f.name from
(select S.name from Series S inner join Publishers P on S.publisher=P.id where P.number_of_series < 10000 or P.number_of_series > 420)f

select distinct f.alias from
(select C.alias from Characters C inner join Issues_and_Characters IC on IC.character_id=C.id 
inner join Issues I on IC.issue_id=I.id inner join Series S on I.series_id=S.id where S.publisher=1)f