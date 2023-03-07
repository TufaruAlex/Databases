select first_name + ' ' + last_name as name from Writers
intersect
select first_name + ' ' + last_name from Artists;

select name from Series
where
name in (select title from Issues);