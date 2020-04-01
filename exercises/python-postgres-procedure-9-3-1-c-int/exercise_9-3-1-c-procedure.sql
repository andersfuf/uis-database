
CREATE OR REPLACE FUNCTION ref_931c(refcursor)
RETURNS refcursor AS $UIS931C$
-- open a cursor for scroll
-- the reference cursor returned is named: 'UIS931C'
-- pc schema
-- AL20200327
BEGIN
 OPEN $1 SCROLL FOR
 SELECT model, speed, hd, ram, price, maker, type
  FROM pc NATURAL JOIN product
  ORDER BY price
  ;
  
  RETURN $1;
END;
$UIS931C$ LANGUAGE plpgsql;