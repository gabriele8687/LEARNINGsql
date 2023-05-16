***********Depatment Table***************

Create Table Department(
DepartmentName Char(35) Not Null,
BudgetCode Char(30) Not Null,
OfficeNumber Char(15) Not Null,
Phone Char(12) Not Null,
Constraint Department_PK Primary Key (DepartmentName)
);

***********Depatment Data***************

Insert into Department Values ('Administration', 'BC-100-10', 'BLDG01-300', '360-285-8100');

Insert into Department Values ('Legal', 'BC-200-10', 'BLDG01-200', '360-285-8200');

Insert into Department Values ('Accounting', 'BC-300-10', 'BLDG01-100', '360-285-8300');

Insert into Department Values ('Finance', 'BC-400-10', 'BLDG01-140', '360-285-8400');

Insert into Department Values ('Human Resources', 'BC-500-10', 'BLDG01-180', '360-285-8500');

Insert into Department Values ('Production', 'BC-600-10', 'BLDG02-100', '360-287-8600');

Insert into Department Values ('Marketing', 'BC-700-10', 'BLDG02-200', '360-287-8700');

Insert into Department Values ('InfoSystems', 'BC-800-10', 'BLDG02-270', '360-287-8800');

***********Employee Table***************

Create Table Employee(
EmployeeNumber Int Not Null Identity (1,1),
FirstName Char(25) Not Null,
LastName Char(25) Not Null,
Department Char(35) Not Null Default 'Human Resources',
Phone Char(12) Null,
Email Char(100) Not Null Unique,
Constraint Employee_PK Primary Key (EmployeeNumber),
Constraint Emp_Depart_FK Foreign Key (Department)
               References Department (DepartmentName)
               On Update Cascade
);

***********Employee Data***************

Insert into Employee Values ('Mary', 'Jacobs', 'Administration', '360-285-8110', 'Mary.Jacobs@WPC.com');

Insert into Employee Values ('Rosalie', 'Jackson', 'Administration', '360-285-8120', 'Rosalie.Jackson@WPC.com');

Insert into Employee Values ('Richard', 'Bandalone', 'Legal', '360-285-8210', 'Richard.Bandalone@WPC.com');

Insert into Employee Values ('Tom', 'Caruthers', 'Accounting', '360-285-8310', 'Tom.Caruters@WPC.com');

Insert into Employee Values ('Heather', 'Jones', 'Accounting', '360-285-8320', 'Heather.Jones@WPC.com');

Insert into Employee Values ('Mary', 'Abernathy', 'Finance', '360-285-8410', 'Mary.Abernathy@WPC.com');

Insert into Employee Values ('George', 'Smith', 'Human Resources', '360-285-8510', 'George.Smith@WPC.com');

Insert into Employee Values ('Tom', 'Jackson', 'Production', '360-287-8610', 'Tom.Jackson@WPC.com');

Insert into Employee Values ('George', 'Jones', 'Production', '360-287-8620', 'George.Jones@WPC.com');

Insert into Employee Values ('Ken', 'Numoto', 'Marketing', '360-287-8710', 'Ken.Numoto@WPC.com');

Insert into Employee (FirstName, LastName, Department, Email) Values ('James', 'Nestor', 'Infosystems', 'James.Nestor@WPC.com');

Insert into Employee Values ('Rick', 'Brown', 'InfoSystems', '360-287-8820', 'Rick.Brown@WPC.com');

***********Project Table***************

Create Table Project (
ProjectID Int Not Null Identity (1000,100),
ProjectName Char(50) Not Null,
Department Char(35) Not Null,
MaxHours Numeric(8,2) Not Null Default 100,
StartDate Date Null,
EndDate Date Null,
Constraint Project_PK Primary Key (ProjectID),
Constraint Proj_Depart_FK Foreign Key (Department)
               References Department (DepartmentName)
               On Update Cascade
);

***********Project Data***************

Insert into Project Values ('2014 Q3 Product Plan', 'Marketing', 135.00, '10-May-14', '15-Jun-14');

Insert into Project Values ('2014 Q3 Portfolio Analysis', 'Finance', 120.00, '5-Jul-14', '25-Jul-14');

Insert into Project Values ('2014 Q3 Tax Preparation', 'Accounting', 145.00, '10-Aug-14', '15-Oct-14');

Insert into Project Values ('2014 Q4 Product Plan', 'Marketing', 150.00, '10-Aug-14', '15-Sep-14');

Insert into Project (ProjectName, Department, MaxHours, StartDate) Values ('2014 Q4 Portfolio Analysis', 'Finance', 140.00, '05-Oct-14');


***********Assignemnt Table***************

Create Table Assignment(
ProjectID Int Not Null,
EmployeeNumber Int Not Null,
HourWorked Numeric(6,2) Null,
Constraint Assignment_PK Primary Key (ProjectID, EmployeeNumber),
Constraint Assign_Proj_FK Foreign Key (ProjectID)
               References Project (ProjectID)
               On Update No Action
               On Delete Cascade,
Constraint Assign_Emp_FK Foreign Key (EmployeeNumber)
               References Employee (EmployeeNumber)
               On Update No Action
               On Delete No Action
);

select * from  Employee

***********Assignment Data***************

Insert into Assignment Values (1000, 1, 30.0);
Insert into Assignment Values (1000, 8, 75.0);
Insert into Assignment Values (1000, 10, 55.0);
Insert into Assignment Values (1100, 4, 40.0);
Insert into Assignment Values (1100, 6, 45.0);
Insert into Assignment Values (1200, 1, 25.0);
Insert into Assignment Values (1200, 2, 20.0);
Insert into Assignment Values (1200, 4, 45.0);
Insert into Assignment Values (1200, 5, 40.0);
Insert into Assignment Values (1300, 1, 35.0);
Insert into Assignment Values (1300, 8, 80.0);
Insert into Assignment Values (1300, 10, 50.0);
Insert into Assignment Values (1400, 4, 15.0);
Insert into Assignment Values (1400, 5, 10.0);
Insert into Assignment Values (1400, 6, 27.5);


--Obtain only FirstName, LastName, Phone, and Department values of Employees in the accounting Department.

select * from Employee
where department ='accounting'

--Q2 Obtain only FirstName, LastName, Phone, and Department values of Employees that work in accounting and have the phone number 360-285-8310.

select firstname, lastname, phone, Department
from Employee
where Department='accounting' and phone='360-285-8310'

--Q3. Obtain FirstName, LastName, Phone, and Department values of Employees where Department value are in ‘Production’ and ‘Infosystem’.
select firstname, lastname, Phone, Department
from Employee
where Department= 'production' or department='InfoSystems';


--Q4. Determine all from Department Table where DepartmentName is ‘Administration’ or have the Office Number ‘BLDG02-100’.

select *from Department
where DepartmentName='administration' or OfficeNumber='BLDG02-100';

--1. Find all the Employee who works in the departments that end in ing.
select* from Employee
where Department like '%ing'

--2. Find all the Employee who do not works in the departments that end in ing
select* from Employee
where Department not like '%ing'
select* from Employee
where Department not like '%du%'

--3.Display the names, phone numbers and department of all the employees sorted by department in Descending Order.

select firstname, Lastname, phone, department
from Employee
order by Department desc

--4.Display the name of employees working in accounting department.

select Firstname, LastName
from Employee
where Department = 'accounting' or LastName= 'Jones';

select Firstname, LastName
from Employee
where Department = 'accounting';
select Firstname, LastName
from Employee
where Department = 'accounting' or Department = 'marketing';

--5.List employees whose last names start with ‘J’ and end with ‘n’.
select * from Employee
where LastName like 'J%n'

--6.Show only FirstName, LastName, Phone, and Department values of employees that work in accounting department and have the phone number 360-285-8310.
select * from Employee
where Department='accounting' and Phone='360-285-8310'

select firstname, lastname, phone, Department
from Employee
where Department='accounting' and Phone='360-285-8310'

--7.Display projects that their MaxHours are between 110 and 140.
select * from Project
where MaxHours between 100 and 140

select * from Project
where MaxHours >= 110 and maxhours <=140

--8.Obtain FirstName, LastName, and Department values of Employees where Department value equal to Accounting, or Finance.
select firstname, lastname, phone, department
from Employee
where Department in ( 'accounting','finance', 'marketing')

select firstname, lastname, phone, department
from Employee
where Department not in ( 'accounting','finance', 'marketing')

--9.List employees whose last names start with ‘J’ and end with ‘n’ and work in administration department
select * from Employee
where lastname like 'j%n' and department = 'administration'

--10.Write a query displaying all employees in descending order of last name.
select * from Employee
order by  lastname desc
--11.Write a query displaying all employees working in accounting department in descending order of last name.
select * from Employee
where Department ='accounting'  
order by lastname desc 
--12.Display the names, phone numbers and department of all the employees sorted by department in Ascending Order.
select firstname, Phone, department
from Employee
order by Department asc
--13.Show the number of employees working in accounting department.
Select count (department) as  count_accounting
from Employee
where department ='accounting'

--14.Show the average HourWorked.
select avg (HourWorked) as avarage_hour
from Assignment

--15.Show the number of employees working in each department separately.
select count (*) as count_accounting
from Employee
where department = 'accounting'

select count (*) count_marketing
from Employee
where Department='marketing'

select Department, count (*) as Employee_count from Employee group by Department

SELECT Department, COUNT(*) FROM Employee GROUP BY Department ORDER BY Department

--16.Write a query displaying the departments with more than one employee. You show use group by and having.

select departmentname from Department
where DepartmentName in (select Department
from employee group by department 
having count(*) >=1)

--17.Display the first name and last name of employees working on the “2014 Q3 Product Plan” project. You should use join.

select firstname, lastname from Employee e inner join Project p
on e.Department = p.Department
where p.ProjectName = '2014 Q3 Product Plan'

--18.Show the first name and last name of employees with WorkHours between 40 and 60. You should use join.
select firstname, lastname from Employee e inner join Assignment a
on e.EmployeeNumber = a.EmployeeNumber
where HourWorked between 40 and 60

-- 19.Write a query showing last name, office number and project name of employees. You should use join.
select e.lastname, d.officenumber, p.projectname
from Employee e inner join Department D
ON e.department= d.DepartmentName inner join Project p
on p.Department = e.Department

--20.Display the first name and last name of employees with WorkHours between 40 and 60. You should use nested queries.
select firstname, lastname
from Employee where EmployeeNumber in (select EmployeeNumber from Assignment
where HourWorked between 40 and 60)


select distinct Department from Project -- (distinct does not show the duplicate value)

--Show all the Column of the PROJECT table for project sponsored by the Finance Department.

SELECT ProjectID, ProjectName, Department, MaxHours, StartDate, EndDate
From Project
Where Department ='Finance'; 

--or

SELECT * From Project
Where Department = 'Finance';


--Show all the Column of the PROJECT table where the values of the MaxHours column is greater than 135.--
 
SELECT *
From Project
Where MaxHours > 135;

--Determine which projects are sponsored by the finance department and are allocated a maximum number of hours greater than 135--

select * from Project
where Department = 'finance'
and maxhours > 135

--Obtain FirstName, LastName, Phone, and Department values of Employees that work in accounting or have the phone number 360-285-8410.

SELECT FirstName, LastName, Phone, Department
From Employee
Where Department = 'Accounting'
OR Phone = '360-285-8410'; 



--Obtain FirstName, LastName, Phone, and Department values of Employees where Department value equal to Accounting, Finance or Marketing. 
select firstName, lastname, phone, department
from Employee
where  department in ('accounting', 'finance', 'marketing');

--Obtain FirstName, LastName, Phone, and Department values of Employees where Department value are not in to Accounting, Finance or Marketing.

select  FirstName, LastName, Phone, Department
from Employee
where Department not in ('accounting', 'finance','marketing')


--Obtain FirstName, LastName, Phone, and Department values of Employees where EmployeeNumber is between 2 and 5.

select FirstName, LastName, Phone, Department
from Employee
where EmployeeNumber between 2 and 5
-- or

select FirstName, LastName, Phone, Department
from Employee
where EmployeeNumber >=2 and EmployeeNumber <=5

-- Obtain FirstName, LastName, and Department values of Employees where EmployeeNumber are greater than 7

select FirstName, LastName, Phone, Department
from Employee
 where EmployeeNumber >7


 --Like Keyword is used in SQL expressions to select partial values.
 SELECT * From Project
 where ProjectName like '2014 Q_ Portfolio Analysis';

 --To find all employees who have a phone value that begins with 360-287-
 select *from Employee
 where Phone like '360-287-____';

 --% sign represent one or more unknown character
 SELECT *
From Employee
Where Phone Like '360-287-%';

--Is Null Keywork is used in a where clause to search for the null values.

SELECT FirstName, LastName, Phone, Department
From Employee
Where Phone Is Null;

--To display the names, phone numbers and department of all the employees sorted by department.
SELECT FirstName, LastName, Phone, Department
From Employee
Order By Department;
--To display the names, phone numbers and department of all the employees sorted by department in Descending Order.
SELECT FirstName, LastName, Phone,
Department
From Employee
Order By Department DESC;

--SQL AGGREGATE FUNCTION

SELECT MIN (MaxHours) As MinimumMaxHours, MAX (MaxHours) As MaximumMaxHours, SUM (MaxHours) As TotalMaxHours
From Project
Where ProjectID <= 1200;


select employeenumber from Employee where FirstName ='mary'
select firstname, lastname from Employee where lastname like 'J%'
