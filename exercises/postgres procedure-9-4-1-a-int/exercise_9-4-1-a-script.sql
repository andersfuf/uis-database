-- Test script
-- AL20180316

-- usefull DDL: 
SET SEARCH_PATH TO movie;
-- ROLLBACK;

DO $$
DECLARE
 star_t moviestar.name%TYPE:='That';
 eksempel2 varchar(100):= 'fremad';
 eksempel3 varchar(100):= 'fremad';

BEGIN
 RAISE NOTICE 'uis-hi'; 
  PERFORM delete_star_extended('Mike Myers');

 --SELECT uis_mm ('uis-kk') into eksempel3 ;
 SELECT 'forward' into eksempel3 ;

 RAISE NOTICE 'uis-hi-END % %',eksempel2, eksempel3; 

END
;$$