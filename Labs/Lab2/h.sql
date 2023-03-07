select W.first_name, W.last_name, count(*) as Issues
from Writers W inner join Issues I on I.writer_id=W.id
group by W.first_name, W.last_name
having count(*)=(
	select max(t.c)
	from (select count(*) c
		from Writers W inner join Issues I on I.writer_id=W.id
		group by W.first_name, W.last_name
	)t
)

select publisher, count(id) as number_of_series from Series S
group by publisher
having count(id) > (select avg(number_of_series) from (select count(id) as number_of_series from Series group by publisher) as temp)

select name, sum(page_count) as total_pages from
(select S.name, I.page_count from Series S inner join Issues I on I.series_id=S.id
group by S.name, I.page_count
)t
group by name
having sum(page_count) > 40

select S.publisher, min(S.begin_date) as earliest_series
from Series S
group by S.publisher
