drop table works;

drop table manages;


drop table employee;

create table employee(
employee_name varchar(30),
street varchar(30),
city varchar(30),
primary key(employee_name));


drop table company;

create table company(
company_name varchar(30),
city varchar(30),
primary key(company_name));

create table works(
employee_name varchar(30),
company_name varchar(30),
salary number,
primary key(employee_name, company_name));

create table manages(
employee_name varchar(30),
manager_name varchar(30),
primary key(employee_name));


insert into employee values('Adams', 'Ainslie St.', 'Chicago');
insert into employee values('Addison', 'Church St.', 'New York');
insert into employee values('Bruus', 'Bowler St.', 'Chicago');
insert into employee values('Bryant', 'Broad St.', 'New York');
insert into employee values('Carpenter', 'Churchill St.', 'Washington');
insert into employee values('Gimbert', 'Bowler St.', 'Washington');
insert into employee values('Grosvenor', 'Addison St.', 'New York');
insert into employee values('Gulley', 'Ainslie St.', 'Chicago');
insert into employee values('Hancock', 'Aldine Ave.', 'Washington');
insert into employee values('Hankey', 'Alexander St.', 'New York');
insert into employee values('Hawkins', 'Altgeld St.', 'Chicago');
insert into employee values('Henson', 'Ancona St.', 'Washington');
insert into employee values('Homer', 'Bloomingdale Ave.', 'New York');
insert into employee values('Jones', 'Blue Island Ave.', 'Chicago');
insert into employee values('Kelly', 'Bonaparte St.', 'Washington');
insert into employee values('Roberts', 'Bowler St.', 'New York');
insert into employee values('Rushton', 'Brighton Pl.', 'Chicago');
insert into employee values('Ryder', 'Broad St.', 'Washington');
insert into employee values('Sinclair', 'Church St.', 'New York');
insert into employee values('Slater', 'Churchill St.', 'Chicago');
insert into employee values('Smith', 'Cicero Ave.', 'New York');
insert into employee values('Spooner', 'Dickens Ave.', 'Washington');
insert into employee values('Stewart', 'Dobson Ave.', 'Chicago');
insert into employee values('Stokes', 'Dominick St.', 'Washington');
insert into employee values('Sutton', 'Altgeld St.', 'New York');
insert into employee values('Thomas', 'Bowler St.', 'Chicago');
insert into employee values('Tilstone', 'Church St.', 'Chicago');



insert into company values('Bank of America', 'Chicago'); 
insert into company values('California Federal Bank', 'New York'); 
insert into company values('First Capital Bank', 'Chicago'); 
insert into company values('Small Bank Corparation', 'New York'); 
insert into company values('First Bank Corporation', 'Washington'); 

Insert into works  values ('Bruus','Bank of America', 3000);
Insert into works  values ('Grosvenor','Bank of America', 3300);
Insert into works  values ('Hawkins','Bank of America', 2900);
Insert into works  values ('Sutton','Bank of America', 2700);
Insert into works  values ('Thomas','Bank of America', 3400);
Insert into works  values ('Tilstone','Bank of America', 3600);
Insert into works  values ('Adams','Bank of America', 6300);
Insert into works  values ('Addison','California Federal Bank', 3400);
Insert into works  values ('Hankey','California Federal Bank', 2900);
Insert into works  values ('Spooner','California Federal Bank', 2900);
Insert into works  values ('Stewart','California Federal Bank', 3200);
Insert into works  values ('Stokes','California Federal Bank', 3100);
Insert into works  values ('Carpenter','California Federal Bank', 5800);
Insert into works  values ('Gulley','First Capital Bank', 2800);
Insert into works  values ('Sinclair','First Capital Bank', 3200);
Insert into works  values ('Slater','First Capital Bank', 3600);
Insert into works  values ('Smith','First Capital Bank', 3400);
Insert into works  values ('Gimbert','First Capital Bank', 5700);
Insert into works  values ('Bryant','Small Bank Corparation', 3000);
Insert into works  values ('Roberts','Small Bank Corparation', 2800);
Insert into works  values ('Rushton','Small Bank Corparation', 3300);
Insert into works  values ('Ryder','Small Bank Corparation', 3600);
Insert into works  values ('Hancock','Small Bank Corparation', 6100);
Insert into works  values ('Henson','First Bank Corporation', 3100);
Insert into works  values ('Homer','First Bank Corporation', 2700);
Insert into works  values ('Kelly','First Bank Corporation', 2900);
Insert into works  values ('Jones','First Bank Corporation', 5900);


Insert into manages  values ('Addison','Carpenter');
Insert into manages  values ('Bruus','Adams');
Insert into manages  values ('Bryant','Hancock');
Insert into manages  values ('Grosvenor','Adams');
Insert into manages  values ('Gulley','Gimbert');
Insert into manages  values ('Hankey','Carpenter');
Insert into manages  values ('Hawkins','Adams');
Insert into manages  values ('Henson','Jones');
Insert into manages  values ('Jones','Kelly');
Insert into manages  values ('Kelly','Homer');
Insert into manages  values ('Roberts','Hancock');
Insert into manages  values ('Rushton','Hancock');
Insert into manages  values ('Ryder','Hancock');
Insert into manages  values ('Sinclair','Gimbert');
Insert into manages  values ('Slater','Gimbert');
Insert into manages  values ('Smith','Gimbert');
Insert into manages  values ('Spooner','Carpenter');
Insert into manages  values ('Stewart','Carpenter');
Insert into manages  values ('Stokes','Carpenter');
Insert into manages  values ('Adams','Sutton');
Insert into manages  values ('Thomas','Adams');
Insert into manages  values ('Tilstone','Adams');



commit;

