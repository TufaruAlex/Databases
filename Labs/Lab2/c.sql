select title from Issues
except
select name from Series;

select first_name + ' ' + last_name as name from Artists
where
first_name not in (select first_name from Writers);