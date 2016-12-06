--Beers(name, manf) 
--Bars(name, addr, license)
--Drinkers(name, addr, phone) 
--Likes(drinker, beer)
--Sells(bar, beer, price) 
--Frequents(drinker, bar)

drop table Frequents;
drop table Sells;
drop table Likes;
drop table Drinkers;
drop table Bars;
drop table Beers; 

create table beers (
	name varchar(15) not null,
	manf varchar(15),
	primary key (Name)
);

create table Bars (
    name varchar(15) not null,
    addr varchar(15) ,
    license smallint,
	primary key (Name)
);

create table Drinkers (
    name varchar(15) not null,
    addr varchar(15) ,
    phone varchar(15),
	primary key (Name)
);

create table Likes (
    drinker varchar(15) not null,
    beer varchar(15) not null,
    primary key (drinker, beer),
    constraint likfk1 foreign key (drinker) references Drinkers(name),
    constraint likfk2 foreign key (beer) references beers(name)
);

create table Sells (
    bar varchar(15) not null,
    beer varchar(15) not null,
    price smallint not null,
    primary key (bar, beer),
    constraint selfk1 foreign key (bar) references Bars(name),
    constraint selfk2 foreign key (beer) references beers(name)
);

create table Frequents (
    drinker varchar(15) not null,
    bar varchar(15) not null,
    primary key (drinker, bar),
    constraint frefk1 foreign key (drinker) references Drinkers(name),
    constraint frefk2 foreign key (bar) references Bars(name)
);

