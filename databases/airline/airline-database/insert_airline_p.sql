start transaction;

insert into Person
values ('Smith',	'123 Elm St.',		'801-556-2239');
insert into Person
values ('Jones',	'234 Oak St.',		'801-552-2943');
insert into Person
values ('Peters',	'345 Pine St.',		'801-393-2230');
insert into Person
values ('Green',	'435 Alder St.',	'801-933-2320');
insert into Person
values ('Rowe',		'348 Elder St.',	'801-343-2320');
insert into Person
values ('Phillips',	'395 Pine St.',		'801-323-2320');
insert into Person
values ('Gates',	'285 Kapok St.',	'801-493-2203');
insert into Person
values ('Clark',	'223 Easy St.',		'801-193-2320');
insert into Person
values ('Warnock',	'775 Main St.',		'801-303-2222');
insert into Person
values ('Hooper',	'456 Maple St.',	'313-912-2101');
insert into Person
values ('Edwards',	'567 Spruce St.',	'801-228-6729');
insert into Person
values ('Majeris',	'678 Willow St.',	null);
insert into Person
values ('MacBride',	'789 Fir St.',		null);

insert into Employee
values ('Jones',	50000.00,	1001);
insert into Employee
values ('Peters',	45000.00,	1002);
insert into Employee
values ('Rowe',		35000.00,	1003);
insert into Employee
values ('Phillips',	25000.00,	1004);
insert into Employee
values ('Gates',	5000000.00,	1005);
insert into Employee
values ('Clark',	150000.00,	1006);
insert into Employee
values ('Warnock',	500000.00,	1007);

insert into Pilot	values (1001);
insert into Pilot	values (1002);
insert into Pilot	values (1003);

insert into Plane	values ('Boeing',	'B727');
insert into Plane	values ('Boeing',	'B747');
insert into Plane	values ('Boeing',	'B757');
insert into Plane	values ('MD',		'DC9');
insert into Plane	values ('MD',		'DC10');
insert into Plane	values ('Airbus',	'A310');
insert into Plane	values ('Airbus',	'A320');
insert into Plane	values ('Airbus',	'A330');
insert into Plane	values ('Airbus',	'A340');

insert into Aircraft	values (11,		'B727');
insert into Aircraft	values (13,		'B727');
insert into Aircraft	values (10,		'B747');
insert into Aircraft	values (13,		'B747');
insert into Aircraft	values (22,		'B757');
insert into Aircraft	values (93,		'B757');
insert into Aircraft	values (21,		'DC9');
insert into Aircraft	values (22,		'DC9');
insert into Aircraft	values (23,		'DC9');
insert into Aircraft	values (24,		'DC9');
insert into Aircraft	values (21,		'DC10');
insert into Aircraft	values (70,		'A310');
insert into Aircraft	values (80,		'A320');

insert into Flight values (100,	'SLC',	'BOS',	to_date('08:00', 'HH24:MI'),	to_date('17:50', 'HH24:MI'));
insert into Flight values (206,	'DFW',	'STL',	to_date('09:00', 'HH24:MI'),	to_date('11:40', 'HH24:MI'));
insert into Flight values (334,	'ORD',	'MIA',	to_date('12:00', 'HH24:MI'),	to_date('14:14', 'HH24:MI'));
insert into Flight values (335,	'MIA',	'ORD',	to_date('15:00', 'HH24:MI'),	to_date('17:14', 'HH24:MI'));
insert into Flight values (336,	'ORD',	'MIA',	to_date('18:00', 'HH24:MI'),	to_date('20:14', 'HH24:MI'));
insert into Flight values (337,	'MIA',	'ORD',	to_date('20:30', 'HH24:MI'),	to_date('23:53', 'HH24:MI'));
insert into Flight values (121,	'STL',	'SLC',	to_date('07:00', 'HH24:MI'),	to_date('09:13', 'HH24:MI'));
insert into Flight values (122,	'STL',	'YYV',	to_date('08:30', 'HH24:MI'),	to_date('10:19', 'HH24:MI'));
insert into Flight values (330,	'JFK',	'YYV',	to_date('16:00', 'HH24:MI'),	to_date('18:53', 'HH24:MI'));
insert into Flight values (991,	'BOS',	'ORD',	to_date('17:00', 'HH24:MI'),	to_date('18:22', 'HH24:MI'));
insert into Flight values (394,	'DFW',	'MIA',	to_date('19:00', 'HH24:MI'),	to_date('21:30', 'HH24:MI'));
insert into Flight values (395,	'MIA',	'DFW',	to_date('21:00', 'HH24:MI'),	to_date('23:43', 'HH24:MI'));
insert into Flight values (449,	'CDG',	'DEN',	to_date('10:00', 'HH24:MI'),	to_date('19:29', 'HH24:MI'));
insert into Flight values (930,	'YYV',	'DCA',	to_date('13:00', 'HH24:MI'),	to_date('16:10', 'HH24:MI'));
insert into Flight values (931,	'DCA',	'YYV',	to_date('17:00', 'HH24:MI'),	to_date('18:10', 'HH24:MI'));
insert into Flight values (932,	'DCA',	'YYV',	to_date('18:00', 'HH24:MI'),	to_date('19:10', 'HH24:MI'));
insert into Flight values (112,	'DCA',	'DEN',	to_date('14:00', 'HH24:MI'),	to_date('18:07', 'HH24:MI'));

insert into Departure	values (to_date('31.10.2009', 'DD.MM.YYYY'),	100);
insert into Departure	values (to_date('31.10.2009', 'DD.MM.YYYY'),	112);
insert into Departure	values (to_date('31.10.2009', 'DD.MM.YYYY'),	206);
insert into Departure	values (to_date('31.10.2009', 'DD.MM.YYYY'),	334);
insert into Departure	values (to_date('31.10.2009', 'DD.MM.YYYY'),	335);
insert into Departure	values (to_date('31.10.2009', 'DD.MM.YYYY'),	337);
insert into Departure	values (to_date('31.10.2009', 'DD.MM.YYYY'),	449);
insert into Departure	values (to_date('01.11.2009', 'DD.MM.YYYY'),	100);
insert into Departure	values (to_date('01.11.2009', 'DD.MM.YYYY'),	112);
insert into Departure	values (to_date('01.11.2009', 'DD.MM.YYYY'),	206);
insert into Departure	values (to_date('01.11.2009', 'DD.MM.YYYY'),	334);
insert into Departure	values (to_date('01.11.2009', 'DD.MM.YYYY'),	395);
insert into Departure	values (to_date('01.11.2009', 'DD.MM.YYYY'),	991);

insert into Booked_On	values ('Smith',	to_date('31.10.2009', 'DD.MM.YYYY'),	100);
insert into Booked_On	values ('Green',	to_date('31.10.2009', 'DD.MM.YYYY'),	206);
insert into Booked_On	values ('Hooper',	to_date('31.10.2009', 'DD.MM.YYYY'),	334);
insert into Booked_On	values ('Edwards',	to_date('31.10.2009', 'DD.MM.YYYY'),	449);
insert into Booked_On	values ('MacBride',	to_date('01.11.2009', 'DD.MM.YYYY'),	991);
insert into Booked_On	values ('Gates',	to_date('01.11.2009', 'DD.MM.YYYY'),	991);
insert into Booked_On	values ('Rowe',		to_date('01.11.2009', 'DD.MM.YYYY'),	100);
insert into Booked_On	values ('Clark',	to_date('01.11.2009', 'DD.MM.YYYY'),	100);
insert into Booked_On	values ('Phillips',	to_date('31.10.2009', 'DD.MM.YYYY'),	449);
insert into Booked_On	values ('Warnock',	to_date('31.10.2009', 'DD.MM.YYYY'),	449);
insert into Booked_On	values ('Smith',	to_date('01.11.2009', 'DD.MM.YYYY'),	991);
insert into Booked_On	values ('Peters',	to_date('01.11.2009', 'DD.MM.YYYY'),	100);


insert into Assigned_To	values (1001,		to_date('31.10.2009', 'DD.MM.YYYY'),	100);
insert into Assigned_To	values (1002,		to_date('31.10.2009', 'DD.MM.YYYY'),	100);
insert into Assigned_To	values (1003,		to_date('31.10.2009', 'DD.MM.YYYY'),	100);
insert into Assigned_To	values (1004,		to_date('31.10.2009', 'DD.MM.YYYY'),	100);
insert into Assigned_To	values (1007,		to_date('31.10.2009', 'DD.MM.YYYY'),	206);
insert into Assigned_To	values (1003,		to_date('31.10.2009', 'DD.MM.YYYY'),	337);
insert into Assigned_To	values (1004,		to_date('31.10.2009', 'DD.MM.YYYY'),	337);
insert into Assigned_To	values (1005,		to_date('31.10.2009', 'DD.MM.YYYY'),	337);
insert into Assigned_To	values (1006,		to_date('31.10.2009', 'DD.MM.YYYY'),	337);
insert into Assigned_To	values (1001,		to_date('01.11.2009', 'DD.MM.YYYY'),	100);
insert into Assigned_To	values (1002,		to_date('01.11.2009', 'DD.MM.YYYY'),	100);
insert into Assigned_To	values (1006,		to_date('01.11.2009', 'DD.MM.YYYY'),	991);
insert into Assigned_To	values (1007,		to_date('01.11.2009', 'DD.MM.YYYY'),	991);
insert into Assigned_To	values (1007,		to_date('01.11.2009', 'DD.MM.YYYY'),	112);

insert into Can_Fly	values (1001,	'B727');
insert into Can_Fly	values (1001,	'B747');
insert into Can_Fly	values (1001,	'DC10');
insert into Can_Fly	values (1002,	'DC9');
insert into Can_Fly	values (1002,	'A340');
insert into Can_Fly	values (1002,	'B757');
insert into Can_Fly	values (1002,	'A320');
insert into Can_Fly	values (1003,	'A310');
insert into Can_Fly	values (1003,	'DC9');

insert into Equipment	values (to_date('31.10.2009', 'DD.MM.YYYY'),	100,	11,	'B727');
insert into Equipment	values (to_date('31.10.2009', 'DD.MM.YYYY'),	206,	13,	'B727');
insert into Equipment	values (to_date('31.10.2009', 'DD.MM.YYYY'),	112,	11,	'B727');
insert into Equipment	values (to_date('31.10.2009', 'DD.MM.YYYY'),	337,	24,	'DC9');
insert into Equipment	values (to_date('01.11.2009', 'DD.MM.YYYY'),	991,	22,	'B757');
insert into Equipment	values (to_date('01.11.2009', 'DD.MM.YYYY'),	112,	21,	'DC10');

commit;