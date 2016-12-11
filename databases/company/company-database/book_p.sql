drop table author;
drop table book;
drop sequence book_seq;

create table BOOK(
book_id numeric,
title varchar(200),
primary key (book_id)
);

create table AUTHOR(
author_name varchar(100),
book_id numeric,
foreign key (book_id) references book
);

create sequence book_seq;

start transaction;
insert into book values(nextval('book_seq'), 'CISSP All-in-One Exam Guide');
insert into author values('Shon Harris', currval('book_seq'));

insert into book values(nextval('book_seq'), 'PHP and MySQL Web Development');
insert into author values('Luke Welling', currval('book_seq'));
insert into author values('Laura Thomson', currval('book_seq'));

insert into book values(nextval('book_seq'), 'Competing on Analytics: The New Science of Winning');
insert into author values('Thomas H. Davenport', currval('book_seq'));
insert into author values('Jeanne G. Harris', currval('book_seq'));

insert into book values(nextval('book_seq'), 'Sams Teach Yourself SQL in 10 Minutes');
insert into author values('Ben Forta', currval('book_seq'));


insert into book values(nextval('book_seq'), 'Web Analytics: An Hour a Day');
insert into author values('Avinash Kaushik', currval('book_seq'));

insert into book values(nextval('book_seq'), 'CCNA Portable Command Guide');
insert into author values('Scott Empson', currval('book_seq'));

insert into book values(nextval('book_seq'), 'CCNA Official Exam Certification Library (Exam 640-802), (Containing ICND1 and ICND2 Exam Certification Guides)');
insert into author values('Wendell Odom', currval('book_seq'));

insert into book values(nextval('book_seq'), 'FileMaker Pro 10: The Missing Manual');
insert into author values('Susan Prosser', currval('book_seq'));
insert into author values('Geoff Coffey', currval('book_seq'));

insert into book values(nextval('book_seq'), 'Learning PHP, MySQL, and JavaScript: A Step-By-Step Guide to Creating Dynamic Websites (Animal Guide)');
insert into author values('Robin Nixon', currval('book_seq'));

insert into book values(nextval('book_seq'), 'High Performance MySQL: Optimization, Backups, Replication, and More');
insert into author values('Baron Schwartz', currval('book_seq'));
insert into author values('Peter Zaitsev', currval('book_seq'));
insert into author values('Vadim Tkachenko', currval('book_seq'));
insert into author values('Jeremy D. Zawodny', currval('book_seq'));

insert into book values(nextval('book_seq'), 'Access 2007: The Missing Manual');
insert into author values('Matthew MacDonald', currval('book_seq'));
 

insert into book values(nextval('book_seq'), 'CCENT/CCNA ICND1 Official Exam Certification Guide');
insert into author values('Wendell Odom', currval('book_seq'));

commit;