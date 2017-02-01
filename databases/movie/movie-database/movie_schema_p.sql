--
-- movie_schema.sql
-- AL 20161205 Works for oracle and postgres
--

drop table starsin;
drop table movies;
drop table moviestar;
drop table movieexec;
drop table studio;


create table movieexec(
name varchar(50), 
address varchar(50), 
cert integer, 
netWorth integer,
primary key(cert));

start transaction;
insert into movieexec values('George Lucas', 'Oak Rd.', 555, 200000000);
insert into movieexec values('Ted Turner', 'New York Av.', 333, 125000000);
insert into movieexec values('Stephen Spielberg', '123 ET road', 222, 100000000);
insert into movieexec values('Merv Griffin', 'Riot Rd.', 199, 112000000);
insert into movieexec values('Calvin Coolidge', 'Fast Lane', 123, 20000000);
insert into movieexec values('Mike Myers', 'Scarborough St.', 130, 25000000);
insert into movieexec values('Garry Marshall', 'First Street', 119, 50000000);
insert into movieexec values('Joel Coen', 'Second Street', 223, 40000000);
insert into movieexec values('J.J. Abrams', 'High Road', 345, 45000000);
insert into movieexec values('Bryan Singer', 'Downtown', 456, 70000000);
insert into movieexec values('Dean Parisot', 'Church Road 55', 567, 1000000);
insert into movieexec values('Frank Marshall', 'Road 2', 678, 15000000);
insert into movieexec values('George Roy Hill', 'Baldwin Av.', 789, 20000000);
insert into movieexec values('Jonathan Demme', 'First Road', 890, 3000000);
insert into movieexec values('Jan de Bont', 'Fifth Av.', 901, 30000000);
insert into movieexec values('James Cameron', 'Kings Road', 101, 650000000);
insert into movieexec values('Andrey Iskanov', 'Asian Rd.', 203, 500000);
insert into movieexec values('Wolfgang Petersen', 'German Street', 303, 25000000);
insert into movieexec values('Raj Kumar', 'India Street', 305, 35000000);
insert into movieexec values('Subhash Ghai', 'India Street', 308, 35000000);
commit;


create table studio(
name varchar(50), 
address varchar(50), 
presC integer,
primary key(name));

start transaction;
insert into studio values('MGM', 'MGM Boulevard', 123);
insert into studio values('DreamWorks', 'DreamWorks St.', 67890);
insert into studio values('Fox', 'Hollywood', 12345);
insert into studio values('Disney', 'Buena Vista', 999);
insert into studio values('Paramount', 'Hollywood', 555);
insert into studio values('USA Entertainm.', 'Hollywood', 777);
insert into studio values('CNN', 'New York', 333);
insert into studio values('Universal', 'Hollywood', 888);
insert into studio values('Tristar', 'Hollywood', 666);
insert into studio values('Unearthed Films', 'US', 654);
insert into studio values('Film City', 'Hollywood', 305);
insert into studio values('Bavaria Filmstudios', 'Berlin', 667); 
insert into studio values('Sony', 'New York', 668); 
commit;

create table movies(
title varchar(50), 
year integer, 
length integer, 
genre varchar(30), 
studioName varchar(50), 
producerc integer,
primary key(title, year),
foreign key(studioname) references studio,
foreign key(producerc) references movieexec);

start transaction;
insert into movies values('Pretty Woman', 1990, 119, 'comedy', 'Disney', 119);
insert into movies values('The Man Who Wasn''t There', 2001, 116, 'crime', 'USA Entertainm.', 222);
insert into movies values('Logan''s run', 1976, NULL, 'sciFi', 'MGM', 123);
insert into movies values('Star Wars', 1977, 124, 'fantasy', 'Fox', 555);
insert into movies values('Empire Strikes Back', 1980, 111, 'fantasy', 'Fox', 555);
insert into movies values('Star Trek', 1979, 132, 'sciFi', 'Paramount', 345);
insert into movies values('Star Trek: Nemesis', 2002, 116, 'sciFi', 'Paramount', 345);
insert into movies values('Terms of Endearment', 1983, 132, 'romance', 'MGM', 123);
insert into movies values('The Usual Suspects', 1995, 106, 'crime', 'MGM', 456);
insert into movies values('Gone With the Wind', 1938, 238, 'drama', 'MGM', 123);
insert into movies values('Wayne''s World', 1992, 95, 'comedy', 'Paramount', 123);
insert into movies values('Galaxy Quest', 1999, 104, 'comedy', 'DreamWorks', 567);
insert into movies values('Eight Below', 2006, 120, 'adventure', 'Disney', 678);
insert into movies values('The Sting', 1973, 129, 'comedy', 'Universal', 789);
insert into movies values('Philadelphia', 1993, 125, 'drama', 'Tristar', 890);
insert into movies values('Speed', 1994, 116, 'action', 'Fox', 901);
insert into movies values('Moonsoon Wedding', 2001, 114, 'adventure', 'Fox', 101);
insert into movies values('Philosophy of a Knife', 2008, 248, 'drama', 'Unearthed Films', 203);
insert into movies values('The Never Ending Story', 2000, 248, 'drama', 'Bavaria Filmstudios', 303);
insert into movies values('AC/DC: Family Jewels', 2005, 123, 'drama', 'Sony', 303);
insert into movies values('Bride and Prejudice', 2005, 127, 'drama', 'Universal', 303);
commit;


create table moviestar(
name varchar(50), 
address varchar(50), 
gender varchar(30), 
birthdate date,
primary key(name));

start transaction;
insert into moviestar values('Jane Fonda', 'Turner Av.', 'F', to_date('7/7/77', 'MM/DD/YY'));
insert into moviestar values('Alec Baldwin', 'Baldwin Av.', 'M', to_date('6/7/77', 'MM/DD/YY'));
insert into moviestar values('Kim Basinger', 'Baldwin Av.', 'F', to_date('5/7/79', 'MM/DD/YY'));
insert into moviestar values('Harrison Ford', '789 Palm Dr.', 'M', to_date('7/7/77', 'MM/DD/YY'));
insert into moviestar values('Debra Winger', 'A way', 'F', to_date('5/6/78', 'MM/DD/YY'));
insert into moviestar values('Jack Nicholson', 'X path', 'M', to_date('5/5/49', 'MM/DD/YY'));
insert into moviestar values('Mike Myers', 'Ontario Rd.', 'M', to_date('5/25/63', 'MM/DD/YY'));
insert into moviestar values('Carrie Fisher', '123 Maple St.', 'F', to_date('9/9/99', 'MM/DD/YY'));
insert into moviestar values('Mark Hamill', '456 Oak Rd.', 'M', to_date('8/8/88', 'MM/DD/YY'));
insert into moviestar values('Vivien Leigh', 'Kensingtion Place', 'F', to_date('11/5/13', 'MM/DD/YY'));
insert into moviestar values('Dana Carvey', 'Missosula Rd.', 'M', to_date('6/2/55', 'MM/DD/YY'));
insert into moviestar values('Kevin Spacey', 'New York Av.', 'F', to_date('12/21/37', 'MM/DD/YY'));
insert into moviestar values('Paul Newman', 'Westport Av.', 'M', to_date('1/26/25', 'MM/DD/YY'));
insert into moviestar values('Joanne Woodward', 'Westport Av.', 'F', to_date('2/27/30', 'MM/DD/YY'));
insert into moviestar values('Sandra Bullock', 'Kensingtion Place', 'F', to_date('7/26/1964', 'MM/DD/YYYY'));
insert into moviestar values('Naseeruddin Shah', 'Ocean St.', 'M', to_date('7/20/50', 'MM/DD/YY'));
insert into moviestar values('Lillete Dubey', 'Rubin Rd.', 'F', to_date('5/13/54', 'MM/DD/YY'));
insert into moviestar values('Aishwara Rai', 'India Rd.', 'F', to_date('11/1/1973', 'MM/DD/YYYY'));
insert into moviestar values('Barret Oliver', 'Oranienburger Strasse', 'M', to_date('3/1/70', 'MM/DD/YY'));
insert into moviestar values('Mark Evans', 'Rubin Rd.', 'F', to_date('5/13/54', 'MM/DD/YY'));
insert into moviestar values('Brian Johnson', 'Rubin Rd.', 'F', to_date('5/13/54', 'MM/DD/YY'));
commit;


create table starsin(
movieTitle varchar(50), 
movieYear integer, 
starName varchar(50),
primary key(movietitle, movieyear, starname),
foreign key(movietitle, movieyear) references movies,
foreign key(starname) references moviestar);

start transaction;
insert into starsin values('Star Wars', 1977, 'Carrie Fisher');
insert into starsin values('Star Wars', 1977, 'Mark Hamill');
insert into starsin values('Star Wars', 1977, 'Harrison Ford');
insert into starsin values('Empire Strikes Back', 1980, 'Harrison Ford');
insert into starsin values('The Usual Suspects', 1995, 'Kevin Spacey');
insert into starsin values('Terms of Endearment', 1983, 'Debra Winger');
insert into starsin values('Terms of Endearment', 1983, 'Jack Nicholson');
insert into starsin values('Wayne''s World', 1992, 'Mike Myers');
insert into starsin values('Gone With the Wind', 1938, 'Vivien Leigh');
insert into starsin values('Wayne''s World', 1992, 'Dana Carvey');
insert into starsin values('The Sting', 1973, 'Paul Newman');
insert into starsin values('Philadelphia', 1993, 'Joanne Woodward');
insert into starsin values('Speed', 1994, 'Sandra Bullock');
insert into starsin values('Moonsoon Wedding', 2001, 'Naseeruddin Shah');
insert into starsin values('Moonsoon Wedding', 2001, 'Lillete Dubey');
insert into starsin values('The Never Ending Story', 2000, 'Barret Oliver');
insert into starsin values('AC/DC: Family Jewels', 2005, 'Mark Evans');
insert into starsin values('AC/DC: Family Jewels', 2005, 'Brian Johnson');
commit;
