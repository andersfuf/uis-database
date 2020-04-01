-- exercise_9-4-1-b-script.sql
--ROLLBACK;SET SEARCH_PATH TO movie; 

DO $$
DECLARE
 star_t moviestar.name%TYPE:='That';
 eksempel2 varchar(100):= 'fremad';
 eksempel3 varchar(100):= 'fremad';

BEGIN
 RAISE NOTICE 'uis-hi'; 
  PERFORM ex941b('Mike Myers');

  PERFORM ex941b('CNN');
  PERFORM ex941b('Paramount');



 --SELECT uis_mm ('uis-kk') into eksempel3 ;
 SELECT concat (eksempel2, ' uis-kk ', eksempel3) into eksempel3 ;
 
 RAISE NOTICE 'uis-hi-END % %',eksempel2, eksempel3; 

END
;$$