Create table [Designer](
[DesignerID] int Identity (1,1),
[DesignerFirstName] varchar(30),
[DesignerSurname]varchar(30),
[DesignerEmail]varchar(100),
[DesignerPhoneN0]varchar(30),
primary key ([DesignerID])
);



insert into Designer
values ( 'Dee','Maher','Dee@gmail.com', '+353445654'), 
		('Mick', 'Veale', 'mveale@gmail.com','+353869585758'),
		('Caoimne', 'Ryan', 'ryanch@gmail.com','+4425555603'),
		('Derek','Byrne', 'derekb@gmail.com','+353909837364'),
		('Carrie', 'Kessler', 'carriek@gmail.com','0004455778');

create table [customer](
[CustomerID] int identity (1,1),
[CustFirstname] varchar (40),
[CustSurName] varchar (50),
[CustStreetaddress] varchar (40),
[addressLine2] varchar (40),
[city] varchar (45),
[county] varchar (40),
[postcode] varchar (8),
[custPhoneNumber] char (15),
[custEmailaddress] varchar (100),
primary key ([CustomerID])
);



insert into customer
values ('Joe', 'Bloggs','1 Meain St', 'N/A','lUCAN', 'Dublin', '595xKFRO','039348475','joe.bloggs@gmail.com'),
('John', 'Lynskey','APT 1A', 'The Malting','Dublin', 'Dublin', 'LHGJ67','0975585555','Lynskeyj@gmail.com'),
('joan', 'Wild','29 The Old Coombe', 'N/A','Dublin', 'Dublin', 'P7686DF','048575869','Joanwild@gmail.com'),
('Mary', 'Jones','Apt 3C', 'The Tower','Ballymoon', 'Dublin', 'TY85967','7589505834383','joNES.mary.bloggs@gmail.com'),
('Lucy', 'Bloggs','1 Meain St', 'N/A','lUCAN', 'Dublin', '595xKFRO','039348475','joe.bloggs@gmail.com'),
('Joe', 'Grahams','2b A street', ' The palce','Dundalk', 'Louth', 'DF67990K','4748493002','grahaml@gmail.com');


create table tecnician(
EmployeeID varchar (10),
TechFirstName varchar (50),
techSurname varchar (50),
DateStarted datetime,
mainSkill varchar(25),
primary key (employeeID)
);




insert into tecnician
values ('04948DFX', 'Mark','Gill', '01/01/1999','Fret Builder'),
		('094585566J', 'Lisa','Lally', '01/01/2009','String Application'),
		('393G56H6', 'Richard','Desay', '06/20/2010','Mainbody Shaper'),
		('509OP565', 'Amanda','Kelly', '02/16/2005','Tuning Tester'),
		('1039U337', 'Robin','Byrne', '01/09/2002','Main Tester');
		

create table GuitarModel(
ModelID char (8),
Name varchar (20),
DesignerID int,
primary key(ModelID),
foreign key (designerID) references Designer(designerID)
);

insert into GuitarModel
values ('MDG00101', 'Bluebird',1),
		('MDG00201', 'Lisa', 3),
		('MDG00301', 'Richard',5),
		('MDG00105', 'Amanda',1),
		('MDG00402', 'Robin',4);

		select * from GuitarModel



create table guitar(
guitarID int identity (1,1),
completiondate datetime, 
readyforSale char(1),
modelID char (8),
customerID int,
primary key (guitarID),
foreign key (modelID) references GuitarModel (ModelID)
);


insert into guitar
values ( '10/02/1953','Y','MDG00101',1),
		( '10/02/1956','N','MDG00201',2),
		( '10/02/1959','Y','MDG00301',3),
		( '10/02/1958','N','MDG00105',4);
		
	


alter table guitar
add foreign key  (customerID) references customer (customerID)


create table Inspection(
InspectionID int identity(1,1),
guitarid int,
employeeid varchar (10),
QEG varchar (15),
InspectionDate datetime,
primary key (inspectionID),
foreign key (guitarid) references guitar (guitarID),
foreign key (employeeid) references tecnician (Employeeid)
);

insert into Inspection
values 
		(5, '094585566J','QEG5','1/01/1999'),
		(3, '393G56H6','QEG4','5/06/2000'),
		(4, '509OP565','QEG3','3/04/2002'),
		(6, '1039U337','QEG2','8/08/2004')


		select * from guitar


			



--Return all Guitars order by GuitarID.
select * from  guitar order by guitarid

--Return all Designers order by DesignerID in descending order.
select * from  Designer order by DesignerID DESC

--Return all Models where the Name has the letter b somewhere in it.

select * from GuitarModel where name like '%b%'

--Return all Customers whose AddressLine2 is N/A.
select * from customer where addressLine2 like '%n/a%'

--	Return all Inspections

select * from Inspection

-- Return all Technicians ordered by their Main Skill.

select * from tecnician order by MainSkill




