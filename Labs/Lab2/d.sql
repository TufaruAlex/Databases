select top 7 I.title, C.alias, W.first_name, W.last_name from Issues I
inner join Issues_and_Characters IC on I.id=IC.issue_id
inner join Characters C on IC.character_id=C.id
inner join Characters_and_Creators CC on C.id=CC.character_id
inner join Writers W on W.id=CC.creator_id
order by I.title;

select top 3 I.title, W.first_name, W.last_name, A.first_name, A.last_name 
from Issues I left join Writers W on I.writer_id=W.id 
left join Artists A on I.penciler_id=A.id;

select S.name, P.name from Series S
right join Publishers P on S.publisher=P.id
order by P.name;

select I.title, A.first_name, A.last_name from Issues I
full join Artists A on I.colorist_id=A.id;