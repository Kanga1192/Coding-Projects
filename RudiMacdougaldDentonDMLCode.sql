delete from Inventory;
delete from Warehouse;
delete from Orders;
delete from Products;
delete from ProjectPersonnel;
delete from Projects;
delete from Locations;
delete from Dependents;
delete from Employees;
delete from Supervisor;
delete from Department_Manager;
delete from Customers;
delete from Department;

-- Populate Warehouse Table
insert into Warehouse (ID, Warehouse_Name, Located) values (1, 'Warehouse 1', 'Edinburgh');
insert into Warehouse (ID, Warehouse_Name, Located) values (2, 'Warehouse 2', 'London');
insert into Warehouse (ID, Warehouse_Name, Located) values (3, 'Warehouse 3', 'Birmingham');

-- Populate Products Table Using External CSV File
insert into Products (ID, ProductName, Price)
select id, productname, price
from sample_products
where id <= 1000;

-- Populate Inventory Table Using Cross Join Statement For ProductsID and WarehouseID
insert into Inventory (ProductsID, WarehouseID, Product_Quantity)
select P.ID as ProductsID
, W.ID as WarehouseID
, round (dbms_random.value(0, 76), 0) as Product_Quantity
from Products P cross join Warehouse W;

-- Populate Department Table
insert into Department (ID, Department_Name, Manager_Name) values (1, 'Human Resources', 'Selie	De Cleen');
insert into Department (ID, Department_Name, Manager_Name) values (2, 'Operations', 'Miguela Kindleysides');
insert into Department (ID, Department_Name, Manager_Name) values (3, 'IT', 'Sallyann	Spencers');
insert into Department (ID, Department_Name, Manager_Name) values (4, 'Finance', 'Mathe	Flagg');
insert into Department (ID, Department_Name, Manager_Name, Sale_Department_Employees_Name) values (5, 'Sales', 'Eberhard Fattorini', 'Jana Romushkin');
insert into Department (ID, Department_Name, Manager_Name, Sale_Department_Employees_Name) values (6, 'Sales', 'Eberhard Fattorini', 'Frederigo	Aloshechkin');
insert into Department (ID, Department_Name, Manager_Name, Sale_Department_Employees_Name) values (7, 'Sales', 'Eberhard Fattorini', 'Granger Lordon');
insert into Department (ID, Department_Name, Manager_Name, Sale_Department_Employees_Name) values (8, 'Sales', 'Eberhard Fattorini', 'Wynn Ilott');

-- Populate Locations Table
insert into Locations (ID, DepartmentID, LocationName) values (1, 1, 'Aberdeen');
insert into Locations (ID, DepartmentID, LocationName) values (2, 2, 'Newcastle');
insert into Locations (ID, DepartmentID, LocationName) values (3, 3, 'Glasgow');
insert into Locations (ID, DepartmentID, LocationName) values (4, 4, 'Southampton');
insert into Locations (ID, DepartmentID, LocationName) values (5, 5, 'Cardiff');

-- Populate Department_Manager Table
insert into Department_Manager (ID, DepartmentID, StartDate, EndDAte) values (1, 1, '12/23/2014', '12/03/2022');
insert into Department_Manager (ID, DepartmentID, StartDate) values (2, 1, '12/03/2022');
insert into Department_Manager (ID, DepartmentID, StartDate) values (3, 2, '10/31/2015');
insert into Department_Manager (ID, DepartmentID, StartDate) values (4, 3, '09/27/2016');
insert into Department_Manager (ID, DepartmentID, StartDate) values (5, 4, '09/05/2015');
insert into Department_Manager (ID, DepartmentID, StartDate) values (6, 5, '09/21/2016');

--Populate Supervisor Table
insert into Supervisor (ID, Department_ManagerID, SupervisorName) values (1, 2, 'Lenka Brightman');
insert into Supervisor (ID, Department_ManagerID, SupervisorName) values (2, 3, 'Ada Yakutin');
insert into Supervisor (ID, Department_ManagerID, SupervisorName) values (3, 3, 'Willow Bemwell');
insert into Supervisor (ID, Department_ManagerID, SupervisorName) values (4, 3, 'Tine Gouldstone');
insert into Supervisor (ID, Department_ManagerID, SupervisorName) values (5, 4, 'Idell De Giovanni');
insert into Supervisor (ID, Department_ManagerID, SupervisorName) values (6, 4, 'Ewart Kiendl');
insert into Supervisor (ID, Department_ManagerID, SupervisorName) values (7, 5, 'Carlyle Aizikovitch');
insert into Supervisor (ID, Department_ManagerID, SupervisorName) values (8, 6, 'Jana Romushkin');

--Populate Projects Table
insert into Projects (ID, DepartmentID, LocationID, ProjectName) values (1, 1, 1, 'Project 1');
insert into Projects (ID, DepartmentID, LocationID, ProjectName) Values (2, 1, 1, 'Project 5');
insert into Projects (ID, DepartmentID, LocationID, ProjectName) values (3, 2, 2, 'Project 16');
insert into Projects (ID, DepartmentID, LocationID, ProjectName) values (4, 2, 2, 'Project 11');
insert into Projects (ID, DepartmentID, LocationID, ProjectName) values (5, 2, 2, 'Project 4');
insert into Projects (ID, DepartmentID, LocationID, ProjectName) values (6, 3, 3, 'Project 12');
insert into Projects (ID, DepartmentID, LocationID, ProjectName) values (7, 3, 3, 'Project 7');
insert into Projects (ID, DepartmentID, LocationID, ProjectName) values (8, 4, 4, 'Project 2');
insert into Projects (ID, DepartmentID, LocationID, ProjectName) values (9, 4, 4, 'Project 8');
insert into Projects (ID, DepartmentID, LocationID, ProjectName) values (10, 4, 4, 'Project 14');
insert into Projects (ID, DepartmentID, LocationID, ProjectName) values (11, 5, 5, 'Project 3');

-- Populate Employees Table using external CSV file
insert into Employees (ID, DepartmentID, SupervisorID, First_Name, Last_Name, National_Insurance_Number, Address, Salary, DateOfBirth, EmailAddress
, ContactNumber, Start_Date, Leave_Date)
select
    ID
,   round(dbms_random.value(1, 5)) as DepartmentID
,   round(dbms_random.value(1, 8)) as SupervisorID
,   first_Name
,   Last_Name
,   National_Insurance_Number
,   Address
,   Salary
,   DOB
,   Email
,   Phone_Number
,   StartDate
,   Exitdate
from people
where id > 200;

-- Populate Customers Table using external CSV file
insert into Customers (ID, DepartmentID, First_Name, Last_Name, Email_Address, Contact_Number)
select
    ID
,   round(dbms_random.value(5, 8)) as DepartmentID
,   first_name
,   last_name
,   email
,   phone_number
from people
where id <= 200;

-- Populate Orders Table Primary and Foreign Keys
insert into Orders (ID, CustomersID, ProductsID) values (1, 5, 45);
insert into Orders (ID, CustomersID, ProductsID) values (2, 6, 68);
insert into Orders (ID, CustomersID, ProductsID) values (3, 54, 6);
insert into Orders (ID, CustomersID, ProductsID) values (4, 156, 46);
insert into Orders (ID, CustomersID, ProductsID) values (5, 67, 67);
insert into Orders (ID, CustomersID, ProductsID) values (6, 46, 164);
insert into Orders (ID, CustomersID, ProductsID) values (7, 96, 15);
insert into Orders (ID, CustomersID, ProductsID) values (8, 187, 35);

-- Populate Orders Table Using Random String and Values for Reference number and date
update Orders
set
    Reference_Number = dbms_random.string('x', 15)
,   Order_Date = sysdate - dbms_random.value(50, 1000);

-- Populate ProjectPersonnel Table
insert into ProjectPersonnel (ID, EmployeesID, ProjectsID, Hours_Worked, Date_) values (1, 256, 7, 5, to_date('04/15/2024', 'MM/DD/YYYY'));
insert into ProjectPersonnel (ID, EmployeesID, ProjectsID, Hours_Worked, Date_) values (2, 274, 2, 2, to_date('04/02/2024', 'MM/DD/YYYY'));
insert into ProjectPersonnel (ID, EmployeesID, ProjectsID, Hours_Worked, Date_) values (3, 556, 9, 15, to_date('04/18/2024', 'MM/DD/YYYY'));
insert into ProjectPersonnel (ID, EmployeesID, ProjectsID, Hours_Worked, Date_) values (4, 817, 4, 4, to_date('04/08/2024', 'MM/DD/YYYY'));
insert into ProjectPersonnel (ID, EmployeesID, ProjectsID, Hours_Worked, Date_) values (5, 432, 11, 7, to_date('04/16/2024', 'MM/DD/YYYY'));
insert into ProjectPersonnel (ID, EmployeesID, ProjectsID, Hours_Worked, Date_) values (6, 992, 6, 20, to_date('04/05/2024', 'MM/DD/YYYY'));
insert into ProjectPersonnel (ID, EmployeesID, ProjectsID, Hours_Worked, Date_) values (7, 990, 3, 1, to_date('04/01/2024', 'MM/DD/YYYY'));
insert into ProjectPersonnel (ID, EmployeesID, ProjectsID, Hours_Worked, Date_) values (8, 743, 10, 4, to_date('04/18/2024', 'MM/DD/YYYY'));

-- Populate Dependents Table
insert into Dependents (ID, EmployeesID, First_Name, Date_OF_Birth, Relationship) values (1, 498, 'Tilly', to_date('06/06/2008', 'MM/DD/YYYY'), 'Daughter');
insert into Dependents (ID, EmployeesID, First_Name, Date_OF_Birth, Relationship) values (2, 498, 'Delila', to_date('06/06/2008', 'MM/DD/YYYY'), 'Daughter');
insert into Dependents (ID, EmployeesID, First_Name, Date_OF_Birth, Relationship) values (3, 288, 'Jeff', to_date('06/10/2008', 'MM/DD/YYYY'), 'Son');
insert into Dependents (ID, EmployeesID, First_Name, Date_OF_Birth, Relationship) values (4, 285, 'Tom', to_date('02/06/2010', 'MM/DD/YYYY'), 'Son');
insert into Dependents (ID, EmployeesID, First_Name, Date_OF_Birth, Relationship) values (5, 527, 'Lily', to_date('08/08/2021', 'MM/DD/YYYY'), 'Daughter');
insert into Dependents (ID, EmployeesID, First_Name, Date_OF_Birth, Relationship) values (6, 527, 'Matilda', to_date('12/16/2010', 'MM/DD/YYYY'), 'Daughter');
insert into Dependents (ID, EmployeesID, First_Name, Date_OF_Birth, Relationship) values (7, 831, 'Olive', to_date('11/25/2009', 'MM/DD/YYYY'), 'Daughter');
insert into Dependents (ID, EmployeesID, First_Name, Date_OF_Birth, Relationship) values (8, 838, 'Ben', to_date('10/31/2020', 'MM/DD/YYYY'), 'Son');
insert into Dependents (ID, EmployeesID, First_Name, Date_OF_Birth, Relationship) values (9, 375, 'Theo', to_date('08/05/2020', 'MM/DD/YYYY'), 'Son');
insert into Dependents (ID, EmployeesID, First_Name, Date_OF_Birth, Relationship) values (10, 375, 'Nick', to_date('01/09/2018', 'MM/DD/YYYY'), 'Son');
insert into Dependents (ID, EmployeesID, First_Name, Date_OF_Birth, Relationship) values (11, 389, 'Jasmine', to_date('05/16/2016', 'MM/DD/YYYY'), 'Daughter');
insert into Dependents (ID, EmployeesID, First_Name, Date_OF_Birth, Relationship) values (12, 478, 'Poppy', to_date('06/10/2018', 'MM/DD/YYYY'), 'Daughter');
insert into Dependents (ID, EmployeesID, First_Name, Date_OF_Birth, Relationship) values (13, 455, 'Tim', to_date('04/20/2017', 'MM/DD/YYYY'), 'Son');
insert into Dependents (ID, EmployeesID, First_Name, Date_OF_Birth, Relationship) values (14, 455, 'Steve', to_date('09/14/2014', 'MM/DD/YYYY'), 'Son');
insert into Dependents (ID, EmployeesID, First_Name, Date_OF_Birth, Relationship) values (15, 739, 'Willow', to_date('05/16/2016', 'MM/DD/YYYY'), 'Daughter');
insert into Dependents (ID, EmployeesID, First_Name, Date_OF_Birth, Relationship) values (16, 740, 'Fred', to_date('11/06/2021', 'MM/DD/YYYY'), 'Son');
insert into Dependents (ID, EmployeesID, First_Name, Date_OF_Birth, Relationship) values (17, 716, 'Lilic', to_date('10/09/2019', 'MM/DD/YYYY'), 'Daughter');
insert into Dependents (ID, EmployeesID, First_Name, Date_OF_Birth, Relationship) values (18, 716, 'Paul', to_date('03/06/2019', 'MM/DD/YYYY'), 'Son');
insert into Dependents (ID, EmployeesID, First_Name, Date_OF_Birth, Relationship) values (19, 716, 'Rupert', to_date('12/05/2015', 'MM/DD/YYYY'), 'Son');
