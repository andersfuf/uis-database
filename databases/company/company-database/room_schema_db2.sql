create table room_type
(  type char not null,
   price integer,
   tv char(1),      -- '0' is false otherwise true
   minibar char(1), -- '0' is false otherwise true
   primary key (type)
);


create table room
(  number integer not null generated always as identity,
   type   char,
   smoker char(1),  -- '0' is false otherwise true
   status char,
   primary key (number),
   constraint fk1 foreign key (type) references room_type.type  
);
