drop table Equipment;
drop table Can_Fly;
drop table Assigned_To;
drop table Booked_On;
drop table Departure;
drop table Pilot; 
drop table Employee;


drop table Person;

create table Person (
	Name varchar(15) not null,
	Address varchar(15) not null,
	Phone varchar(12),	-- optional 
	primary key (Name)
);

create table Employee (
	Name varchar(15) not null,
	Salary int,
	Emp_No smallint unique not null,
	primary key (Name),
	constraint empfk foreign key (Name) references Person(Name)
);


create table Pilot (
	Emp_No smallint not null,
	constraint pilfk foreign key (Emp_No) references Employee(Emp_No)
);

drop table Aircraft;
drop table Plane;

create table Plane (
	Maker varchar(15) not null,
	Model_No varchar(15) not null,
	primary key (Model_No)
);


create table Aircraft (			-- subsumes type
	Serial_No smallint not null,
	Model_No varchar(15) not null,
	primary key (Serial_No, Model_No),
	constraint airfk foreign key (Model_No) references Plane(Model_No)
);

drop table Flight;

create table Flight (
	Num smallint not null,
	Origin varchar(3),
	Dest varchar(3),
	Dep_Time date,
	Arr_Time date,
	primary key (Num)
);


create table Departure (		/* subsumes Instance_Of */
	Dep_Date date not null,
	Num smallint not null,
	primary key (Dep_Date, Num),
	constraint depfk foreign key (Num) references Flight(Num)
);


create table Booked_On (
	Name varchar(15) not null,
	Dep_Date date not null,
	Num smallint not null,
	primary key (Name, Dep_Date, Num),
	constraint boofk foreign key (Dep_Date, Num) references Departure(Dep_Date, Num)
);


create table Assigned_To (
	Emp_No smallint not null,
	Dep_Date date not null,
	Num smallint not null,
	primary key (Emp_No, Dep_Date, Num),
	constraint assfk1 foreign key (Emp_No) references Employee(Emp_No),
	constraint assfk2 foreign key (Dep_Date, Num) references Departure(Dep_Date, Num)
);


create table Can_Fly (
	Emp_No smallint not null,
	Model_No varchar(15) not null,
	primary key (Emp_No, Model_No),
	constraint canfk1 foreign key (Emp_No) references Employee(Emp_No),
	constraint canfk2 foreign key (Model_No) references Plane(Model_No)
);


create table Equipment (
	Dep_Date date not null,
	Num smallint not null,
	Serial_No smallint not null,
	Model_No varchar(15) not null,
	primary key (Dep_Date, Num, Serial_No, Model_No),
	constraint equfk1 foreign key (Dep_Date, Num) references Departure(Dep_Date, Num),
	constraint equfk2 foreign key (Serial_No, Model_No) references 
		Aircraft(Serial_No, Model_No)
);

