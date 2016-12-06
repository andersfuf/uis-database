drop table author;
drop table book;
drop sequence book_seq;

create table BOOK(
book_id number,
title varchar(200),
primary key (book_id)
);

create table AUTHOR(
author_name varchar(100),
book_id number,
foreign key (book_id) references book
);

create sequence book_seq;

insert into book values(book_seq.nextval, 'CISSP All-in-One Exam Guide');
insert into author values('Shon Harris', book_seq.currval);

insert into book values(book_seq.nextval, 'PHP and MySQL Web Development');
insert into author values('Luke Welling', book_seq.currval);
insert into author values('Laura Thomson', book_seq.currval);

insert into book values(book_seq.nextval, 'Competing on Analytics: The New Science of Winning');
insert into author values('Thomas H. Davenport', book_seq.currval);
insert into author values('Jeanne G. Harris', book_seq.currval);

insert into book values(book_seq.nextval, 'Sams Teach Yourself SQL in 10 Minutes');
insert into author values('Ben Forta', book_seq.currval);


insert into book values(book_seq.nextval, 'Web Analytics: An Hour a Day');
insert into author values('Avinash Kaushik', book_seq.currval);

insert into book values(book_seq.nextval, 'CCNA Portable Command Guide');
insert into author values('Scott Empson', book_seq.currval);

insert into book values(book_seq.nextval, 'CCNA Official Exam Certification Library (Exam 640-802), (Containing ICND1 and ICND2 Exam Certification Guides)');
insert into author values('Wendell Odom', book_seq.currval);

insert into book values(book_seq.nextval, 'FileMaker Pro 10: The Missing Manual');
insert into author values('Susan Prosser', book_seq.currval);
insert into author values('Geoff Coffey', book_seq.currval);

insert into book values(book_seq.nextval, 'Learning PHP, MySQL, and JavaScript: A Step-By-Step Guide to Creating Dynamic Websites (Animal Guide)');
insert into author values('Robin Nixon', book_seq.currval);

insert into book values(book_seq.nextval, 'High Performance MySQL: Optimization, Backups, Replication, and More');
insert into author values('Baron Schwartz', book_seq.currval);
insert into author values('Peter Zaitsev', book_seq.currval);
insert into author values('Vadim Tkachenko', book_seq.currval);
insert into author values('Jeremy D. Zawodny', book_seq.currval);

insert into book values(book_seq.nextval, 'Access 2007: The Missing Manual');
insert into author values('Matthew MacDonald', book_seq.currval);
 

insert into book values(book_seq.nextval, 'CCENT/CCNA ICND1 Official Exam Certification Guide');
insert into author values('Wendell Odom', book_seq.currval);

commit;