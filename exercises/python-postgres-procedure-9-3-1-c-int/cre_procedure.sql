-- if needed set search_path to a schema with
-- the tables from the pc database 
-- uncheck the following line

set search_path = pc;

-- UIS-Exerxise 9-3-1C internaltional edition
-- UIS-Exerxise 9-3-1A american edition
-- AL20200327-install-script

START TRANSACTION;

\i exercise_9-3-1-c-procedure.sql

COMMIT;

