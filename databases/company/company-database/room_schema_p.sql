-- AL20161206
-- DB2 index with sequence commented
-- ok postgres

drop table room;
drop table room_type;
drop sequence room_seq;

create table room_type
(  type char not null,
   price integer,
   tv char(1),      -- '0' is false otherwise true
   minibar char(1), -- '0' is false otherwise true
   primary key (type)
);


create sequence room_seq;

create table room
(  number integer not null , 
   type   char,
   smoker char(1),  -- '0' is false otherwise true
   status char,
   primary key (number),
   constraint fk1 foreign key (type) references room_type(type)  
);


/*
-- DB2 stuff
create table room
(  number integer not null generated always as identity, -- db2 identity column-replace with sequenxe
   type   char,
   smoker char(1),  -- '0' is false otherwise true
   status char,
   primary key (number),
   constraint fk1 foreign key (type) references room_type.type  
);
*/
