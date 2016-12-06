
create table account
   (account_number varchar(15) not null unique,
    branch_name varchar(15) not null,
    balance integer not null,
    primary key(account_number));

/* populate relations */

insert into account values ('A-101',	'Downtown',	500);
insert into account values ('A-215',	'Mianus',	700);
insert into account values ('A-102',	'Perryridge',	400);
insert into account values ('A-305',	'Round Hill',	350);
insert into account values ('A-201',	'Perryridge',	900);
insert into account values ('A-222',	'Redwood',	700);
insert into account values ('A-217',	'Brighton',	750);
insert into account values ('A-333',	'Central',	850);
insert into account values ('A-444',	'North Town',	625);
