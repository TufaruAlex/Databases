select distinct first_name + ' ' + last_name as name from Writers
union
select first_name + ' ' + last_name from Artists;

select distinct C.alias, W.first_name, W.last_name
from Characters C, Writers W, Characters_and_Creators CC
where C.id = CC.character_id or W.id = CC.creator_id;