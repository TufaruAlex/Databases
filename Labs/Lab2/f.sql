select W.first_name, W.last_name from Writers W
where exists(
	select * from Issues I
	where I.writer_id=W.id
)

select P.name from Publishers P
where exists(
	select * from Series S
	where S.publisher=P.id
)