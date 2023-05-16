/* difference in date - datediff, adding day- dateadd, to get todays date- get date*/

/*mm/dd/yyyy*/

select DATEDIFF(dd, '01/01/2022', getdate())
select getdate()

drop table  Mytable
use department

create table Mytable
(oderNum int identity (1,1) primary key,
qyt int,
orderdate datetime default getdate())

insert into Mytable (qyt) values (100)
insert into Mytable (qyt) values (1)
insert into Mytable (qyt) values (250)
insert into Mytable (qyt) values (200)

select * from Mytable

select DATEADD(DD,5,GETDATE()) /* give you the date after 5 days*/

select DATEADD(MM,5,GETDATE())
select DATEADD(MM,-5,GETDATE())

select max (qyt) from Mytable

select max (qyt) as maxvalue, min(qyt) as minvalue, count (*) as countrow from Mytable

/* control of flow*/
/* if els, begin end*/

/* if something, di something otherwise do something else*/

if DATENAME (weekday,GETDATE()) in ('saturday', 'sunday')
select 'weekend'
else select 'weekend'

if DATENAME (weekday,GETDATE()) in ('saturday', 'sunday')
begin
select 'weekend'
end
else
select 'weekend'

if datediff (dd, '01/01/2023', getdate()) >101 -- nothing to do over 100--
begin
insert into Mytable (qyt, OrderDate) values (0,01/26/2023)
end
else
print 'Nothing to do'

select * from Mytable

If exists (select 1 from Mytable where qyt =0)
begin
update Mytable
set qyt =1
where qyt =0
end 
else
print 'No zero qyt'


