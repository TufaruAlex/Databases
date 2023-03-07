select P.name, P.number_of_issues from Publishers P
where P.number_of_issues > all (
	select P2.number_of_issues from Publishers P2
	where P2.name='Image Comics'
)

select P.name, P.number_of_issues from Publishers P
where P.number_of_issues > (
	select max(P2.number_of_issues) from Publishers P2
	where P2.name='Image Comics'
)

select I.title, I.page_count from Issues I
where I.page_count > any (
	select I2.page_count from Issues I2
	where I2.title like 'Doctor%' and I2.title not like '%2'
)

select I.title, I.page_count from Issues I
where I.page_count > (
	select min(I2.page_count) from Issues I2
	where I2.title like 'Doctor%' and I2.title not like '%2'
)

select I.title from Issues I
where I.id = any (
	select IC.issue_id from Issues_and_Characters IC
	where IC.character_id=3 or IC.character_id = 1
)

select I.title from Issues I
where I.id in (
	select IC.issue_id from Issues_and_Characters IC
	where IC.character_id=3 or IC.character_id = 1
)

select W.first_name, W.last_name from Writers W
where W.id <> all (
	select CC.creator_id from Characters_and_Creators CC
	where CC.character_id = 3
)

select W.first_name, W.last_name from Writers W
where W.id not in (
	select CC.creator_id from Characters_and_Creators CC
	where CC.character_id = 3
)