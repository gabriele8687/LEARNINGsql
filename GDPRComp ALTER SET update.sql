use department

select * from Employee

alter table employee
add Isdeleted char(2)

update Employee
set  Isdeleted = 'N'

update Employee
set Isdeleted = 'Y' where phone ='360-287-8610'


select * from Employee where isdeleted ='Y'

create table GDPRComp
(EmpID  INT NOT NULL identity (100,1),
firstname char (25) not null,
lastname char (25) not null,
department char(35) not null default  'human resourses',
phone char (12) null,
email char (100) not null unique,
isdeleted char (1) null)

select * from Employee

insert into GDPRComp values ('Tom', 'Jackson', 'Production', '360-287-8610', 'Tom.Jackson@WPC.com', 'Y')

update GDPRComp
set department = 'GDPR',
PHONE = 'GDPR',
email= 'GDPR',
isdeleted ='B'
where EmpID = 100

select * from GDPRComp