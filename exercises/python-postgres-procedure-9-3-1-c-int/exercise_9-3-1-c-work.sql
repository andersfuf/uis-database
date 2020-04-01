-- Work script
-- In PGADMIN select individual elements or lines and 
-- presse execute (lightning).

-- NB this script is not run as a script
-- NB A usefull collection of SQL
-- AL20200327 Work script


-- show current schema search path
show search_path;
-- set activ schema search path
set search_path = pc, "$user", public;
set search_path = pc;
set search_path = public;
set search_path = "$user", public;

-- Usefull transaction statements
START TRANSACTION;
ROLLBACK; 
COMMIT;

/*    # python in the database
    # p.3.1. C
    # Ask the user for a price and the pc whose price is closest to the desired price.
    # Print the maker, model number, and ram of the pc
*/
  -- join pc and product (using natural join)
  SELECT model, speed, hd, ram, price, maker, type
  FROM pc NATURAL JOIN product
  ORDER BY price
  ;

-- order product by price (equi join)
  SELECT pc.model, speed, hd, ram, price, maker, type
  FROM pc
  , product
  WHERE pc.model = product.model
  ORDER BY price
  ;  
  
