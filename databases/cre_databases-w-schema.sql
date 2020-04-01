-- b_databaser
-- load sample databases
-- AL20161211-UIS-B-C
CREATE SCHEMA airline; SET search_path TO airline;
\i airline/airline-database/airline_schema_p.sql
\i airline/airline-database/insert_airline_p.sql

CREATE SCHEMA bar; SET search_path TO bar;
\i bar/bar-database/bar_schema_p.sql
\i bar/bar-database/insert_bar_p.sql

CREATE SCHEMA company; SET search_path TO company;
\i company/company-database/bank_p.sql
\i company/company-database/book_p.sql
\i company/company-database/employee_p.sql
\i company/company-database/room_schema_p.sql

CREATE SCHEMA movie; SET search_path TO movie;
\i movie/movie-database/movie_schema_p.sql

CREATE SCHEMA pc; SET search_path TO pc;
\i pc/pc-database/pc_schema_p.sql


CREATE SCHEMA ships; SET search_path TO ships;
\i ships/ships-database/ships_schema_p.sql
