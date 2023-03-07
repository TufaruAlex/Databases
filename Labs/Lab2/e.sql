select P.name from Publishers P
where P.id not in (select P.id from Publishers P where P.number_of_issues > 50000);

select I.title from Issues I
where I.id in (select IC.issue_id from Issues_and_Characters IC 
where IC.character_id in (select CC.character_id from Characters_and_Creators CC where CC.creator_id=4 and CC.character_id=3))