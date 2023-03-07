go
create procedure setIssueNumberFromIssuesTinyint as
	alter table Issues alter column issue_number tinyint

go
create procedure setIssueNumberFromIssuesInt as
	alter table Issues alter column issue_number int

go
create procedure addDateOfBirthToArtists as
	alter table Artists add date_of_birth date

go
create procedure removeDateOfBirthFromArtists as
	alter table Artists drop column date_of_birth

go
create procedure addDefaultToDateOfBirthFromArtists as
	alter table Artists add constraint DEFAULT0 default('2000-01-01') for date_of_birth

go
create procedure removeDefaultFromDateOfBirthFromArtists as
	alter table Artists drop constraint DEFAULT0

go
create procedure addAbilities as
	create table Abilities (
		name varchar(50) not null,
		type varchar(50)not null,
		character_id int not null,
		constraint ABILITIES_PRIMARY_KEY1 primary key(name)
	)

go
create procedure dropAbilities as
	drop table Abilities

go
create procedure addTypePrimaryKeyAbilities as
	alter table Abilities
		drop constraint if exists ABILITIES_PRIMARY_KEY1
	alter table Abilities
		add constraint ABILITIES_PRIMARY_KEY2 primary key(name,type)

go
create procedure removeTypePrimaryKeyAbilities as
	alter table Abilities
		drop constraint if exists ABILITIES_PRIMARY_KEY2
	alter table Abilities
		add constraint ABILITIES_PRIMARY_KEY1 primary key(name)

go
create procedure newCandidateKeyIssues as
	alter table Issues
		add constraint ISSUES_CANDIDATE_KEY_1 unique (series_id, issue_number)

go
create procedure dropCandidateKeyIssues as
	alter table Issues
		drop constraint if exists ISSUES_CANDIDATE_KEY_1

go
create procedure newForeignKeyAbilities as
	alter table Abilities
		add constraint ABILITIES_FOREIGN_KEY_1 foreign key(character_id) references Characters(id)

go
create procedure dropForeignKeyAbilities as
	alter table Abilities drop constraint if exists ABILITIES_FOREIGN_KEY_1

create table versionTable(
	version int
)

insert into versionTable values (1)

create table proceduresTable(
	fromVersion int,
	toVersion int,
	procedureName varchar(max),
	primary key (fromVersion, toVersion)
)

insert into proceduresTable values (1, 2, 'setIssueNumberFromIssuesTinyint')
insert into proceduresTable values (2, 1, 'setIssueNumberFromIssuesInt')
insert into proceduresTable values (2, 3, 'addDateOfBirthToArtists')
insert into proceduresTable values (3, 2, 'removeDateOfBirthFromArtists')
insert into proceduresTable values (3, 4, 'addDefaultToDateOfBirthFromArtists')
insert into proceduresTable values (4, 3, 'removeDefaultFromDateOfBirthFromArtists')
insert into proceduresTable values (4, 5, 'addAbilities')
insert into proceduresTable values (5, 4, 'dropAbilities')
insert into proceduresTable values (5, 6, 'addTypePrimaryKeyAbilities')
insert into proceduresTable values (6, 5, 'removeTypePrimaryKeyAbilities')
insert into proceduresTable values (6, 7, 'newCandidateKeyIssues')
insert into proceduresTable values (7, 6, 'dropCandidateKeyIssues')
insert into proceduresTable values (7, 8, 'newForeignKeyAbilities')
insert into proceduresTable values (8, 7, 'dropForeignKeyAbilities')

go
create procedure goToVersion(@newVersion int) as
	declare @curr int
    declare @var varchar(max)
    select @curr=version from versionTable

	if @newVersion > (select max(toVersion) from proceduresTable)
        raiserror ('Bad version', 10, 1)

	if @newVersion = @curr
			print('You are already on this version!');

	while @curr > @newVersion begin
        select @var=procedureName from proceduresTable where fromVersion=@curr and toVersion=@curr-1
        exec (@var)
        set @curr=@curr-1
    end

    while @curr < @newVersion begin
        select @var=procedureName from proceduresTable where fromVersion=@curr and toVersion=@curr+1
        exec (@var)
        set @curr=@curr+1
    end

    update versionTable set version=@newVersion

execute goToVersion 1

SELECT *
FROM versionTable

SELECT *
FROM proceduresTable