--AL20161211
-- removing
DROP DATABASE uis;
-- User: uis
DROP ROLE IF EXISTS uis;

CREATE USER uis WITH PASSWORD 'uis';

-- Database: uis
CREATE DATABASE uis;
COMMENT ON DATABASE uis  IS 'Development of Information Systems (UIS) Sample databases';

-- User priviledges
GRANT CONNECT, TEMPORARY ON DATABASE uis TO public;
GRANT ALL ON DATABASE uis TO uis;
GRANT ALL ON DATABASE uis TO develop;

