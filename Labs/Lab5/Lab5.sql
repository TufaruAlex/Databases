create table Ta (
    aid int primary key,
    a2 int unique,
    x int
)

create table Tb (
    bid int primary key,
    b2 int,
    x int
)

create table Tc (
    cid int primary key,
    aid int references Ta(aid) on delete cascade on update cascade,
    bid int references Tb(bid)on delete cascade on update cascade
)

go
create or alter procedure insertIntoTa(@rows int) as
    declare @max int
    set @max = @rows*2 + 100
    while @rows > 0 begin
        insert into Ta values (@rows, @max, @rows%120)
        set @rows = @rows-1
        set @max = @max-2
    end
go
create or alter procedure insertIntoTb(@rows int) as
    while @rows > 0 begin
        insert into Tb values (@rows, @rows%350, @rows%150)
        set @rows = @rows-1
    end
go
create or alter procedure insertIntoTc(@rows int) as
    declare @aid int
    declare @bid int
    while @rows > 0 begin
        set @aid = (select top 1 aid from Ta order by NEWID())
        set @bid = (select top 1 bid from Tb order by NEWID())
        insert into Tc values (@rows, @aid, @bid)
        set @rows = @rows-1
    end

exec insertIntoTa 10000
exec insertIntoTb 12000
exec insertIntoTc 4000
-- a)
select * from Ta -- clustered index scan 0.03 cost
select * from Ta where aid < 200 -- clustered index seek 0.003 cost

select a2 from Ta -- nonclustered index scan 0.02 cost
select a2 from Ta where a2 = 1 -- nonclustered index seek 0.003 cost

select a2,x from Ta where a2 = 300 -- key lookup cost 0.03
-- b)
select * from Tb where b2 = 40 -- clustered index scan cost 0.03

drop index if exists RequestNonclustered on Tb
create nonclustered index RequestNonclustered on Tb(b2)

select b2 from Tb where b2 = 40; -- nonclustered index seek cost 0.003
-- c)
go
create or alter view view1 as
    select top 1000 T1.x, T2.b2
    from Tc T3 join Ta T1 on T3.aid = T1.aid join Tb T2 on T3.bid = T2.bid
    where T2.b2 > 400 and T1.x < 20
go
select * from view1
-- 0.25 cost without indexes
-- 0.23 cost with indexes